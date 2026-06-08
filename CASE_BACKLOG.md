# Case Backlog

Public backlog of recent implementations that can become anonymized portfolio case studies.

This file intentionally avoids client names, private URLs, phone numbers, workflow IDs, order IDs, exact revenue values and internal operational identifiers.

## Candidate Cases

| Candidate case | Public angle | Status | Metrics |
| --- | --- | --- | --- |
| [Context-Aware AI Reception Agent for Chat Commerce](cases/context-aware-ai-reception-agent/README.md) | AI agent that resolves commercial context before replying, using CRM, campaign/source signals and approved response rules. | Draft public version | metrics to collect |
| [AI Workflow Observability Contract](cases/ai-workflow-observability-contract/README.md) | Contract-first trace layer for AI-assisted workflows, covering decision paths, human review, cost and safety fields across agents and automations. | Draft public version | metrics to collect |
| [Operational Knowledge Retrieval Layer](cases/operational-knowledge-retrieval-layer/README.md) | RAG layer for operational playbooks, approved answers and lead/product context, with retrieval evals and observability. | Implementation blueprint | metrics to collect |
| [Human-in-the-Loop Commercial Follow-up Automation](cases/human-in-the-loop-commercial-follow-up/README.md) | Follow-up workflow that prioritizes leads, respects operational limits and routes sensitive cases to human review. | Draft public version | metrics to collect |
| [Lightweight ATS and Candidate Intake System](cases/lightweight-ats-candidate-intake/README.md) | Fast hiring intake layer connecting a careers portal, structured candidate scoring and operational handoff. | Draft public version | metrics to collect |
| [Marketplace ERP Read-Only Integration and Catalog Proxy](cases/marketplace-erp-catalog-proxy/README.md) | Secure read-first API integration for catalog/order visibility, with OAuth handled outside the repo and no write automation until homologation. | Draft public version | metrics to collect |
| Visual Governance Layer for Multi-Agent Operations | YAML-defined agent catalog rendered into an auditable cockpit, keeping architecture files as the source of truth and the UI as a review surface. | Good technical case | metrics to collect |
| CRM and WhatsApp Message Capture Foundation | Operational message capture layer that separates CRM events, real conversations, contact enrichment and future AI memory. | Good technical case | metrics to collect |
| WhatsApp-Based Supplier Follow-up Operations | Controlled supplier follow-up workflow with queue validation, approval gates and traceable outbound actions. | Possible operations case | metrics to collect |

## Recommended Publishing Order

1. Context-Aware AI Reception Agent for Chat Commerce.
2. Operational Knowledge Retrieval Layer.
3. Human-in-the-Loop Commercial Follow-up Automation.
4. Marketplace ERP Read-Only Integration and Catalog Proxy.
5. Lightweight ATS and Candidate Intake System.
6. CRM and WhatsApp Message Capture Foundation.

## Evidence To Collect Before Writing

- sanitized architecture diagram;
- before/after workflow summary;
- implementation scope;
- operational safeguards;
- public-safe screenshots, if any;
- metrics to collect;
- lessons learned;
- what was intentionally kept human-in-the-loop.

## Public Guardrails

- Keep company and client names anonymous unless explicit approval exists.
- Do not publish real leads, phone numbers, candidate data, supplier data or order data.
- Do not publish private workflow URLs, webhook paths, tokens, credentials or database identifiers.
- Replace exact financial or volume numbers with `metrics to collect` until validated and approved.
