# LinkedIn Post

An AI customer ops agent is not just a prompt.

It is a workflow.

The model is only one layer.

Before the AI writes anything, the system should answer:

- What CRM context matters?
- What did retrieval find?
- Is this safe to automate?
- Should a deterministic rule win?
- Should this go to a human?
- What will be logged for audit?

I prepared a public-safe architecture sample around that idea:

1. Trigger.
2. CRM/message context.
3. Context resolver.
4. RAG-style shadow retrieval.
5. Deterministic guardrails.
6. AI decision step.
7. Reply, CRM action or human handoff.
8. Observability and audit log.

The key lesson:

AI agents in customer operations need operating layers, not only model calls.

Context, guardrails, observability and human review are part of the product.

Public case:

https://github.com/rkrisa/portfolio-ai-ops/tree/main/cases/ai-customer-operations-agent-sample

