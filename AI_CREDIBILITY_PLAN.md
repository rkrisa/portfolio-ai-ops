# AI Credibility Plan

This repository is not meant to prove generic AI fluency. It is meant to prove that I can turn messy business operations into AI-assisted systems with context, guardrails, evaluation and human oversight.

## Positioning

Target narrative:

> AI Operator / Solutions Architect / RevOps Automation Builder for chat-driven, operations-heavy businesses.

This is stronger than a generic "AI engineer" narrative because it connects real operating problems with technical implementation: CRM, WhatsApp, commerce, candidates, dashboards, workflows, context layers and human-in-the-loop decisions.

## Missing Proof To Build

| Gap | Public proof | First artifact |
| --- | --- | --- |
| RAG and long-context discipline | Operational retrieval layer using approved docs, playbooks and metadata | [Operational Knowledge Retrieval Layer](cases/operational-knowledge-retrieval-layer/README.md) |
| Evals and observability | Trace every AI-assisted decision and score retrieval/answer quality | Eval checklist inside the retrieval case |
| Public technical vocabulary | Architecture notes in English using market language without inflating claims | [POST_QUEUE.md](POST_QUEUE.md) |
| External proof | GitHub case updates, screenshots, diagrams and small public posts | Roadmap + case backlog |

## Stack Decision

Start with Postgres + pgvector because most operational data already wants relational structure: leads, stages, source metadata, documents, reviews and trace logs. Add a dedicated vector database later only if search traffic, filtering complexity or deployment boundaries justify it.

Recommended first stack:

- Postgres + pgvector for document chunks and embeddings;
- n8n or a small script for ingestion;
- OpenAI-compatible embeddings or another embedding provider;
- optional reranker after the first retrieval baseline;
- Langfuse or Phoenix for traces, prompts, evals and human review;
- a small golden-question set for retrieval and answer-quality checks.

References:

- pgvector: <https://github.com/pgvector/pgvector>
- Langfuse docs: <https://langfuse.com/docs>
- Phoenix docs: <https://arize.com/docs/phoenix>
- Qdrant docs: <https://qdrant.tech/documentation/>

## 90-Day Execution

### Days 1-30: RAG Proof

- Build the retrieval case around approved operational documents.
- Keep the scope narrow: playbooks, response rules, product/service notes and handoff criteria.
- Track retrieved source, confidence, no-answer behavior and human review outcome.
- Publish two architecture notes.

### Days 31-60: Evaluation Proof

- Add 20-30 golden questions.
- Add regression checks for answer grounding, citation presence, refusal/no-answer behavior and unsafe action prevention.
- Add cost/token estimates per decision.
- Capture one anonymized trace or dashboard screenshot.

### Days 61-90: Market Proof

- Polish the first two cases: context-aware agent and lead intelligence.
- Publish 4-6 short technical posts in English.
- Use the cases in career materials for Solutions Engineer, AI Solutions, RevOps and Implementation roles.
- Keep any unvalidated metric as `metrics to collect`.
