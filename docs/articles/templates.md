---
title: Prompt Templates and Reuse
description: Guidelines for creating, structuring, and versioning prompt templates in HUG AI.
---

# Prompt Templates and Reuse

Prompt templates are essential assets in HUG AI, allowing teams to standardize how agents generate code, analyze requirements, or document outcomes.

## Purpose of Templates

- Provide structured, reusable scaffolds for prompting
- Reduce hallucination and variability in outputs
- Accelerate onboarding and replication of agent behaviors

## Template Types

| Type           | Usage Example                          |
|----------------|----------------------------------------|
| Requirement    | Extracting functional needs            |
| Architecture   | Proposing system design components     |
| Implementation | Generating modules or tests            |
| Documentation  | Creating READMEs, changelogs, etc.     |

## Recommended Format

Use `.md` or `.yaml` with frontmatter and slot placeholders:

```yaml
---
template: requirement_extraction_v1
agent: requirements_analyzer
version: 1.2.0
---

## Input

{{raw_user_input}}

## Instructions

- Identify all functional requirements
- Clarify ambiguity with questions
- Output in `requirements.yaml` format
```

## Folder Structure

Place shared templates in:
```
tools/templates/
├── requirements_extraction.md
├── implementation_module.yaml
└── architecture_suggestion.md
```

## Versioning & Governance

- Tag templates by version in filename or metadata
- Review changes via PRs and agent compatibility
- Link each template to its test cases and example outputs

## Agent Integration

Agents reference templates via config files:

```yaml
agent: implementation_agent
prompt_template: templates/implementation_module.yaml
schema_version: 2.0.0
```

## Best Practices

- Avoid long, ambiguous instructions
- Use comments to guide future editors
- Test new templates before rollout

---


