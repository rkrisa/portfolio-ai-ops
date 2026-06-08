# Ricardo Krisanoski - AI Operations Portfolio

Public portfolio of applied AI, CRM automation, revenue operations and workflow systems built around real business problems.

The goal of this repository is to document how I design practical operating systems: turning scattered business context into workflows, queues, dashboards and human-in-the-loop AI assistance.

## Positioning

I build AI-assisted operating systems for chat-driven and operations-heavy businesses.

Core themes:

- CRM automation and sales operations;
- WhatsApp/chat commerce workflows;
- lead prioritization and follow-up systems;
- human-in-the-loop AI;
- data-to-dashboard operating layers;
- n8n, Make, APIs, Postgres and reporting workflows.

## Case Studies

| Case | Status | What it demonstrates |
| --- | --- | --- |
| [AI Lead Intelligence for Chat Commerce](cases/ai-lead-intelligence-chat-commerce/README.md) | Draft public version | CRM automation, lead scoring, AI-assisted prioritization, seller workflow design |
| [Context-Aware AI Reception Agent for Chat Commerce](cases/context-aware-ai-reception-agent/README.md) | Draft public version | Context engineering, AI guardrails, CRM/campaign-aware response design |
| [AI Workflow Observability Contract](cases/ai-workflow-observability-contract/README.md) | Draft public version | Langfuse-style tracing, decision auditability, human review and cost visibility |
| [Operational Knowledge Retrieval Layer](cases/operational-knowledge-retrieval-layer/README.md) | Implementation blueprint | RAG, pgvector, retrieval quality, evals and AI observability |
| [Human-in-the-Loop Commercial Follow-up Automation](cases/human-in-the-loop-commercial-follow-up/README.md) | Draft public version | Follow-up queues, lane limits, human review and revenue operations |
| [Marketplace ERP Read-Only Integration and Catalog Proxy](cases/marketplace-erp-catalog-proxy/README.md) | Draft public version | OAuth/API integration, read-first automation and credential hygiene |
| [Lightweight ATS and Candidate Intake System](cases/lightweight-ats-candidate-intake/README.md) | Draft public version | Careers portal, structured intake, role-fit scoring and hiring handoff |

Upcoming anonymized case candidates are tracked in [CASE_BACKLOG.md](CASE_BACKLOG.md).

## Current Credibility Track

The next technical gap being converted into public proof is documented in [AI_CREDIBILITY_PLAN.md](AI_CREDIBILITY_PLAN.md):

- build a small RAG layer around operational docs and approved playbooks;
- add trace/eval/cost logging around AI-assisted decisions;
- publish one architecture note every two weeks;
- keep metrics as `metrics to collect` until validated.

## How The Cases Are Written

Each case follows the same structure:

1. Business context.
2. Problem.
3. Solution.
4. Architecture.
5. Stack.
6. Results or metrics to collect.
7. Lessons learned.
8. Public guardrails.

Sensitive client, customer, revenue and operational data is removed or anonymized. The focus is on problem-solving, architecture, execution and transferable business impact.

## Repository Roadmap

See [ROADMAP.md](ROADMAP.md).

## Publishing

See [PUBLISHING.md](PUBLISHING.md) for the recommended GitHub setup.
