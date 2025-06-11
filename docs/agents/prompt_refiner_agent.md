---
title: Prompt Refiner Agent
description: Defines the responsibilities, configuration, and behavior of the Prompt Refiner Agent in HUG AI.
---

# Prompt Refiner Agent

The **Prompt Refiner Agent** is responsible for optimizing, validating, and adapting prompts to maximize the effectiveness and safety of generative AI outputs.

It ensures that prompts are aligned with project standards, task scope, and expected structure — especially before passing them to other specialized agents.

## Role and Purpose

This agent helps:

- Detect and correct ambiguous or unsafe prompts
- Expand minimal inputs into complete task instructions
- Apply organization-specific tone, format, or compliance rules
- Reduce hallucinations by controlling prompt constraints

## Input

- Raw or user-written prompts
- Task type metadata (e.g., "code generation", "security review")
- Prompt templates and refiner patterns

## Output

- Refined, formatted prompts with metadata headers
- Suggestions for human review (optional)
- Logs of transformation steps for traceability

## Example Output

```yaml
refined_prompt: >
  Based on the requirements.yaml and business_goals.md, generate a modular
  Python service implementing the authentication flow, using FastAPI.
source: implementation_agent
compliance_tags:
  - scoped
  - reviewed
  - deterministic
```

## Governance & Validation

- Human review required in sensitive tasks (e.g., data handling, auth logic)
- Prompt variants are versioned and traceable
- Misuse prevention through pattern filters

## Configuration (YAML)

```yaml
agent: prompt_refiner_agent
input_sources:
  - prompts/*.md
  - rules/compliance_guidelines.md
prompt_type: refinement
patterns:
  - format_check
  - tone_alignment
  - scope_compliance
post_actions:
  - generate_log
  - mark_for_review
```

## Integration

This agent runs:

- Before calling Implementation, Security, or Documentation agents
- In fallback mode (e.g., after agent failure or vague output)
- As part of continuous improvement for prompt engineering

It boosts the reliability of the entire HUG AI agent ecosystem.
