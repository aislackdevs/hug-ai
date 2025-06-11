---
title: Router Agent
description: Defines the responsibilities, configuration, and behavior of the Router Agent in HUG AI.
---

# Router Agent

The **Router Agent** serves as a dispatcher and task orchestrator in the HUG AI agent network. It routes requests to the appropriate agent(s) based on task type, configuration, and context.

## Role and Purpose

This agent helps:

- Identify which agent should handle a given prompt or file
- Chain or parallelize agents depending on the workflow
- Apply fallback rules or retry mechanisms when an agent fails
- Maintain logs of agent task routing for audit and optimization

## Input

- Task metadata (e.g., type, priority, source)
- Available agent list and their capabilities
- Project configuration YAML

## Output

- Agent routing decisions
- Task delegation logs
- Retry queue (if applicable)

## Example Output (Routing Decision)

```yaml
task: analyze_requirements
routed_to: requirements_analyzer_agent
fallback: prompt_refiner_agent
confidence_score: 0.94
```

## Governance & Validation

- Routing logic is deterministic and logged
- All decisions are reviewable via audit logs
- Fallback chains and retry limits are configurable

## Configuration (YAML)

```yaml
agent: router_agent
input_sources:
  - tasks/*.yaml
  - agents/*.yaml
strategy: priority_first
fallbacks_enabled: true
retry_policy:
  max_attempts: 2
  delay_seconds: 5
logging: true
```

## Integration

The Router Agent operates:

- At the beginning of chained workflows
- During dynamic task processing (e.g., pipelines or CLI tools)
- As part of autonomous orchestration scenarios

It connects to all other agents and ensures efficient coordination across the system.
