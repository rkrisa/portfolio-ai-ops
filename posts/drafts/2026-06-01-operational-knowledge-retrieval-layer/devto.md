When people say they are "adding RAG" to a workflow, the conversation often jumps too quickly to infrastructure choices.

Should this use a vector database?
Should there be a reranker?
Should everything go into a knowledge graph?

Those are valid questions, but they are usually not the first question.

The first question is narrower:

> What approved knowledge should the workflow be allowed to retrieve before an AI decision happens?

That is why my first retrieval layer for operational AI workflows starts in Postgres, not in a standalone vector database.

## The Workflow Problem

In operations-heavy systems, the model usually should not answer from raw memory or from a giant prompt dump.

The useful context already exists somewhere else:

- approved response rules;
- handoff criteria;
- product or service notes;
- source or campaign guidance;
- operational decisions that were already made by humans.

The hard part is not generating fluent text.

The hard part is retrieving the right approved context, showing which source influenced the decision and refusing when no safe source exists.

## Why Postgres First

For this kind of workflow, most of the surrounding data is already relational:

- leads or conversations;
- workflow names;
- stages and owners;
- human review outcomes;
- source metadata;
- trace logs;
- document versions.

So the first technical choice is not "where do vectors live in the abstract?"

It is:

1. Where can I keep retrieval close to the operational data model?
2. Where can I log the retrieval path and the final decision together?
3. Where can I evolve the schema without creating a second system too early?

Postgres plus `pgvector` is a good first answer to that set of questions.

It lets me keep:

- documents and chunks;
- metadata such as allowed use and approval requirements;
- retrieval traces;
- cost estimates;
- human review outcomes

in one place.

## What The First Version Needs

The first version does not need to be broad.

It needs to be inspectable.

My narrow retrieval scope looks like this:

- approved response rules;
- product/service notes;
- handoff and escalation criteria;
- campaign/source guidance;
- commercial playbooks.

Each retrieved chunk should carry more than text. It should also carry metadata such as:

- source name;
- document version;
- business domain;
- allowed use;
- whether human approval is required.

That metadata matters because a workflow may be allowed to use one chunk as internal reasoning support, but not as customer-facing language.

## The Eval Mindset

I do not think a retrieval layer is real until it has failure criteria.

So the public prototype includes a small golden-question set:

- Does the expected source appear in the top results?
- Does the workflow return no-answer or handoff when the source is missing?
- Does customer-facing language come only from allowed chunks?
- Can I review which chunks influenced the decision later?

That matters more than announcing that the system has embeddings.

Without retrieval checks, a RAG layer can look sophisticated while still pulling the wrong context.

## Observability Is Part Of The Design

The retrieval step and the AI decision step should be traceable together.

I want the same review surface to show:

- retrieved chunk IDs;
- similarity or retrieval score;
- model name;
- token and cost estimates;
- final decision;
- handoff reason;
- human review outcome.

That is the bridge between "the system answered" and "the system answered for a defensible reason."

## When I Would Add More Infrastructure

I am not against standalone vector databases.

I would add one later if the system needed:

- more search traffic;
- more complex filtering boundaries;
- separate deployment requirements;
- recall/latency needs that justify the extra moving parts.

But before that point, I prefer a smaller stack that makes retrieval, evaluation and auditability visible.

## The Practical Lesson

For AI workflows in revenue or operations contexts, the first retrieval layer should optimize for control, review and schema clarity.

Not for maximum architectural novelty.

That is why my first RAG layer starts in Postgres:

- closer to operational data;
- easier to trace;
- easier to evaluate;
- easier to keep human-in-the-loop.

The public case study is here:

<https://github.com/rkrisa/portfolio-ai-ops/tree/main/cases/operational-knowledge-retrieval-layer>
