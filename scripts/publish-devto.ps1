param(
  [Parameter(Mandatory = $true)]
  [string]$PostDir,

  [switch]$Publish
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$envPath = Join-Path $repoRoot ".env"

if (-not (Test-Path -LiteralPath $envPath)) {
  throw "Missing .env file at $envPath"
}

$envValues = @{}
Get-Content -LiteralPath $envPath | ForEach-Object {
  $line = $_.Trim()
  if (-not $line -or $line.StartsWith("#")) { return }
  $key, $value = $line -split "=", 2
  if ($key) {
    if ($null -eq $value) { $value = "" }
    $envValues[$key.Trim()] = $value.Trim()
  }
}

$apiKey = $envValues["DEVTO_API_KEY"]
if ([string]::IsNullOrWhiteSpace($apiKey)) {
  throw "DEVTO_API_KEY is empty in .env"
}

$apiBaseUrl = $envValues["DEVTO_API_BASE_URL"]
if ([string]::IsNullOrWhiteSpace($apiBaseUrl)) {
  $apiBaseUrl = "https://dev.to/api"
}

$resolvedPostDir = Resolve-Path -LiteralPath (Join-Path $repoRoot $PostDir)
$bodyPath = Join-Path $resolvedPostDir "devto.md"
$metadataPath = Join-Path $resolvedPostDir "devto-metadata.md"

if (-not (Test-Path -LiteralPath $bodyPath)) {
  throw "Missing devto.md in $resolvedPostDir"
}

if (-not (Test-Path -LiteralPath $metadataPath)) {
  throw "Missing devto-metadata.md in $resolvedPostDir"
}

$metadata = Get-Content -Raw -LiteralPath $metadataPath
$bodyMarkdown = Get-Content -Raw -LiteralPath $bodyPath

function Get-MetadataBlock {
  param(
    [string]$Text,
    [string]$Heading
  )

  $pattern = '(?ms)^##\s+' + [regex]::Escape($Heading) + '\s*```text\s*(.*?)\s*```'
  $match = [regex]::Match($Text, $pattern)
  if (-not $match.Success) {
    throw "Could not find metadata block: $Heading"
  }
  return $match.Groups[1].Value.Trim()
}

$title = Get-MetadataBlock -Text $metadata -Heading "Title"
$description = Get-MetadataBlock -Text $metadata -Heading "Description"
$tagsText = Get-MetadataBlock -Text $metadata -Heading "Tags"
$tags = $tagsText.Split(",") | ForEach-Object { $_.Trim() } | Where-Object { $_ }

function ConvertTo-JsonStringLiteral {
  param(
    [AllowNull()]
    [string]$Value
  )

  if ($null -eq $Value) {
    return 'null'
  }

  $escaped = $Value.Replace('\', '\\').Replace('"', '\"').Replace("`r", '\r').Replace("`n", '\n').Replace("`t", '\t')
  return '"' + $escaped + '"'
}

$tagJson = @()
foreach ($tag in $tags) {
  $tagJson += (ConvertTo-JsonStringLiteral -Value $tag)
}

$payload = @"
{"article":{"title":$(ConvertTo-JsonStringLiteral -Value $title),"published":$(([bool]$Publish).ToString().ToLowerInvariant()),"body_markdown":$(ConvertTo-JsonStringLiteral -Value $bodyMarkdown),"description":$(ConvertTo-JsonStringLiteral -Value $description),"tags":[$($tagJson -join ',')]}}
"@
$uri = "$($apiBaseUrl.TrimEnd('/'))/articles"

$response = Invoke-RestMethod `
  -Method Post `
  -Uri $uri `
  -Headers @{ "api-key" = $apiKey; "Accept" = "application/vnd.forem.api-v1+json" } `
  -ContentType "application/json" `
  -Body $payload

[pscustomobject]@{
  Id = $response.id
  Title = $response.title
  Published = $response.published
  Url = $response.url
}
