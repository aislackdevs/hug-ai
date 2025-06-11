---
title: Architecture Agent
description: Defines the responsibilities, configuration, and behavior of the Architecture Agent in HUG AI.
---

# Architecture Agent

The **Architecture Agent** assists developers in designing modular, scalable, and consistent system architectures. It supports the design phase by providing suggestions, validations, and documentation for technical decisions.

## Role and Purpose

This agent helps:

- Translate requirements into architectural components
- Propose service boundaries, interfaces, and data flows
- Identify reusable patterns and bottlenecks
- Generate diagrams and architecture summaries for documentation

## Input

- Validated requirements from the Requirements Analyzer Agent
- Existing architecture documents (optional)
- Contextual constraints (e.g., tech stack, security policies)

## Output

- Component breakdowns and interface descriptions
- Suggested diagrams (e.g., C4, sequence, deployment)
- Documentation stubs for system design
- Architecture specs in markdown or YAML format

## Example Output (Markdown)

```markdown
### Module: Auth Service
- Exposes: `/login`, `/signup`, `/refresh`
- Dependencies: User DB, Token Service
- Technology: Node.js, PostgreSQL, JWT
- Notes: All tokens must be revocable
```

## Governance & Validation

- Suggestions are reviewed by a tech lead or architect
- Design artifacts are version-controlled
- Outputs can be manually edited or extended by humans

## Configuration (YAML)

```yaml
agent: architecture_agent
input_sources:
  - requirements.yaml
  - tech_constraints.md
output_format: markdown
prompt_type: modular_architecture
post_actions:
  - render_diagrams
  - suggest_alternatives
```

## Integration

This agent operates right after the planning phase, before implementation begins. It also contributes to:

- Design documentation
- Infrastructure planning
- System review checklists

It feeds into the `implementation_agent`, `security_agent`, and deployment planning.
