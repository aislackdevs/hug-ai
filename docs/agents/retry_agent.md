---
title: Retry Agent
description: Defines the responsibilities, configuration, and behavior of the Retry Agent in HUG AI.
---

# Retry Agent

The **Retry Agent** monitors agent failures or incomplete executions and applies intelligent retry strategies to ensure resilience and reliability across workflows.

## Role and Purpose

This agent helps:

- Detect failed agent runs due to network, timeout, or invalid input
- Apply retry policies with backoff or alternative configurations
- Escalate persistent failures to human reviewers
- Log retry history for analytics and debugging

## Input

- Execution logs and agent response statuses
- Retry configuration policies
- Agent dependency graph (for cascading retries)

## Output

- Retry logs with timestamps and outcomes
- Alerts or notifications (Slack, email)
- Optional fallback tasks

## Example Output (YAML)

```yaml
retry_attempt:
  agent: implementation_agent
  original_prompt: impl_auth.yaml
  attempt: 2
  result: success
  note: Switched to shorter context window
```

## Governance & Validation

- Max attempts, delay strategy, and backoff config are enforced
- Retry loops are capped and logged
- Escalation rules route persistent issues to Router or human

## Configuration (YAML)

```yaml
agent: retry_agent
monitored_agents:
  - implementation_agent
  - test_agent
retry_policy:
  max_attempts: 3
  strategy: exponential_backoff
  initial_delay: 5
post_actions:
  - notify_on_final_failure
  - tag_prompt_for_review
```

## Integration

The Retry Agent is triggered:

- After any agent failure
- In long-running pipelines with async agents
- In testing or staging environments with instability

It works alongside the Router Agent and supports graceful error recovery across the system.
