# Boost Productivity with Human-Governed AI Development Flows

## Overview

In SlackDevs, software is developed by AI agents that follow a structured Software Development Life Cycle (**HUG AI Development**). This cycle is modular, traceable, and designed for **human governance at every step**.

The default flow is:

```
PROMPT_REFINE → REQUIREMENTS → ROUTER → ARCHITECT → CODER → TESTER → REVIEW → PR_MANAGER → MAINTENANCE
```

Each phase is handled by a specialized AI agent, and the outputs are passed down the pipeline in isolated branches to maintain traceability.

---

## What is Flow Control?

Flow control allows you to define **checkpoints** in this pipeline — specific moments where the AI must pause and **wait for human validation** before proceeding. This empowers teams to:

- Learn interactively from the AI process
- Inject human insight or domain expertise
- Prevent undesired outputs early
- Maintain compliance in regulated environments

---

## Configuring Custom Checkpoints

You can configure checkpoints via a simple YAML file:

```yaml
# .slackdevs/flow.yaml
checkpoints:
  - after: 00_PROMPT_REFINE
  - after: 03_ARCHITECT
  - after: 05_TEST_CODER
```

Each `after:` key defines a pause after the specified agent completes.

During the run, the CLI will prompt:

```
Continue after 03_ARCHITECT? [y/n]
```

---

## Examples

| Use Case                       | Recommended Checkpoints                         |
|--------------------------------|--------------------------------------------------|
| Learning or mentoring          | After every phase                               |
| Enterprise or regulated teams  | After ARCHITECT, TEST_CODER, BRANCH_PR          |
| Fast solo development          | Only at PR (default)                            |

---

## Why It Matters

- Enforces **human-in-the-loop** by design
- Enables educational and collaborative workflows
- Provides safety valves in autonomous development
- Adapts to any skill level or project risk profile

> "SlackDevs isn’t just about automating work — it’s about giving humans control over that automation."
