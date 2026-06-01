# Portfolio Roadmap

## Publishing Priority

1. Finalize the first public case: `Context-Aware AI Reception Agent for Chat Commerce`.
2. Add the RAG/eval layer as a visible technical proof: `Operational Knowledge Retrieval Layer`.
3. Finalize `AI Lead Intelligence for Chat Commerce` as the second commercial case.
4. Collect safe metrics:
   - monthly lead/message volume;
   - active automation workflows;
   - response-time or follow-up SLA improvement;
   - leads recovered or reactivated;
   - manual hours saved;
   - sellers/users impacted.
5. Add anonymized architecture images or dashboard screenshots.
6. Add public-safe screenshots or architecture diagrams for the draft cases.
7. Convert the remaining backlog candidates into public drafts when they have enough proof.

## 30-Day Technical Proof Sprint

Week 1:

- define the operational document sources;
- create the public-safe retrieval schema;
- write 10 golden questions for eval.

Week 2:

- implement a small pgvector prototype;
- log retrieved chunks, confidence, model decision and human review outcome;
- publish the first architecture note.

Week 3:

- add retrieval quality checks: expected source, citation presence and no-answer behavior;
- add cost/token estimates per decision;
- compare raw prompt context vs retrieved context.

Week 4:

- add one anonymized dashboard or trace screenshot;
- write the public case update;
- publish a second architecture note in English.

## Recent Implementation Backlog

See [CASE_BACKLOG.md](CASE_BACKLOG.md) for the current list of recent implementations that can become anonymized public cases.

## Minimum Public GitHub Setup

- Repository name: `portfolio-ai-ops`
- Visibility: public
- Description: `Applied AI operations, CRM automation and revenue workflow case studies.`
- Topics:
  - `ai-operations`
  - `crm`
  - `revenue-operations`
  - `workflow-automation`
  - `n8n`
  - `human-in-the-loop`
  - `sales-ops`

## Before Publishing

- Remove all private company names if needed.
- Replace exact revenue values with ranges or relative impact.
- Avoid customer names, phone numbers, order IDs, internal URLs and screenshots with real leads.
- Keep architecture and decision logic visible.
- Use metrics only when they are safe and defensible.
