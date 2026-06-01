create extension if not exists vector;

create table if not exists knowledge_documents (
  id bigserial primary key,
  source_name text not null,
  source_type text not null,
  business_domain text not null,
  public_safe boolean not null default false,
  version_label text,
  updated_at timestamptz not null default now()
);

create table if not exists knowledge_chunks (
  id bigserial primary key,
  document_id bigint not null references knowledge_documents(id) on delete cascade,
  heading text,
  chunk_text text not null,
  allowed_use text not null check (allowed_use in ('internal_only', 'agent_context', 'customer_facing')),
  requires_human_approval boolean not null default false,
  embedding vector(1536),
  created_at timestamptz not null default now()
);

create index if not exists knowledge_chunks_embedding_hnsw
  on knowledge_chunks using hnsw (embedding vector_cosine_ops);

create index if not exists knowledge_chunks_document_id_idx
  on knowledge_chunks (document_id);

create table if not exists ai_decision_traces (
  id bigserial primary key,
  workflow_name text not null,
  input_type text not null,
  input_hash text,
  retrieved_chunk_ids bigint[] not null default '{}',
  retrieval_score numeric,
  model_name text,
  prompt_tokens integer,
  completion_tokens integer,
  estimated_cost_usd numeric,
  decision text,
  handoff_reason text,
  human_review_outcome text,
  created_at timestamptz not null default now()
);
