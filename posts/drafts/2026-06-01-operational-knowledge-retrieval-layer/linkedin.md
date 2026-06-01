# LinkedIn Post

My first RAG layer for operational AI workflows does not start with a standalone vector database.

It starts with a narrower question:

What approved knowledge should the workflow be allowed to retrieve before an AI decision happens?

For this kind of system, most of the surrounding data is already relational:

- workflow traces;
- document versions;
- approval flags;
- handoff outcomes;
- source metadata.

That is why I like starting with Postgres + pgvector:

1. Keep retrieval close to operational data.
2. Log retrieved chunks and final decisions together.
3. Add eval checks before adding more infrastructure.

The public prototype I am using includes:

- synthetic operational documents;
- golden questions for retrieval quality;
- allowed-use metadata;
- trace rows for decision review.

The lesson:

RAG for business workflows is not just semantic search.

It is retrieval + guardrails + no-answer behavior + human review + observability.

Full article:

https://dev.to/rkrisa/why-my-first-rag-layer-starts-in-postgres-not-in-a-standalone-vector-database-lgn-temp-slug-6821012

Public case study:

https://github.com/rkrisa/portfolio-ai-ops/tree/main/cases/operational-knowledge-retrieval-layer
