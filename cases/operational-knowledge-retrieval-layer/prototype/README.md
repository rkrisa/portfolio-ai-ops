# Prototype

Small public-safe starter kit for the Operational Knowledge Retrieval Layer.

It intentionally uses synthetic examples. Replace them with approved, anonymized operational docs only after checking privacy and publishing rules.

## Files

- `schema.sql`: Postgres + pgvector tables for documents, chunks and AI decision traces.
- `sample-documents.jsonl`: synthetic source documents to ingest.
- `golden-questions.jsonl`: small retrieval/eval set.

## First Implementation Loop

1. Load `schema.sql` into a Postgres database with pgvector enabled.
2. Chunk and embed the sample documents.
3. Insert chunks with metadata.
4. Run each golden question.
5. Check whether `expected_source_name` appears in the retrieved top results.
6. Log the selected chunks, model decision and human review outcome.

## Passing Criteria

- Expected source appears in top 3 for at least 8 of 10 golden questions.
- The system refuses or escalates when no approved source exists.
- Customer-facing language only comes from chunks marked for customer-facing use.
- Every AI-assisted decision has a trace row.
