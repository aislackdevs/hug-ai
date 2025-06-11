---
title: Performance Agent
description: Defines the responsibilities, configuration, and behavior of the Performance Agent in HUG AI.
---

# Performance Agent

The **Performance Agent** is designed to evaluate and optimize system performance by analyzing code, configurations, and usage patterns. It supports performance tuning throughout the SDLC.

## Role and Purpose

This agent helps:

- Detect inefficient algorithms, queries, or bottlenecks
- Benchmark key operations or endpoints
- Recommend optimizations for throughput, latency, or memory usage
- Suggest monitoring and profiling strategies

## Input

- Source code or benchmark scripts
- Architecture and deployment configurations
- Test data and runtime logs

## Output

- Performance summary reports
- Annotated hotspots or optimization flags
- Suggestions for improved design or caching strategies

## Example Output (Markdown)

```markdown
## Performance Summary: Auth Service

- Avg. Login Time: 740ms (target: <500ms)
- Identified slow call: password hash (bcrypt, 12 rounds)
- Suggestion: Consider using Argon2 with tuned params
```

## Governance & Validation

- Benchmarks must be reproducible and documented
- Suggested changes require dev team review and test confirmation
- Artifacts stored with traceable versioning

## Configuration (YAML)

```yaml
agent: performance_agent
input_sources:
  - benchmarks/*.yaml
  - src/**/*.js
  - configs/perf_targets.yaml
output_format: markdown+yaml
prompt_type: analysis+recommendation
post_actions:
  - tag_hotspots
  - suggest_benchmark_plan
```

## Integration

The Performance Agent runs:

- Before critical releases
- On demand during optimization sprints
- As part of ongoing SLA/SLO validation

It works closely with the Implementation, Architecture, and DevOps agents.
