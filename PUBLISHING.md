# Publishing

This folder is meant to become a standalone public GitHub repository.

Recommended public repository:

- Name: `portfolio-ai-ops`
- Visibility: public
- Description: `Applied AI operations, CRM automation and revenue workflow case studies.`

## Option A - GitHub Web UI

1. Create a new public repository on GitHub named `portfolio-ai-ops`.
2. Do not add a README on GitHub, because this folder already has one.
3. From this folder, initialize and push:

```bash
git init
git add .
git commit -m "Initial AI operations portfolio"
git branch -M main
git remote add origin https://github.com/<your-user>/portfolio-ai-ops.git
git push -u origin main
```

## Option B - GitHub CLI

From this folder:

```bash
gh repo create portfolio-ai-ops --public --source=. --remote=origin --push --description "Applied AI operations, CRM automation and revenue workflow case studies."
```

## Pre-publish Check

Before pushing, confirm:

- no customer names;
- no phone numbers;
- no order IDs;
- no internal URLs;
- no exact private revenue numbers;
- screenshots are anonymized;
- metrics are safe and defensible.

