---
title: Documentation Writer Agent
description: Defines the responsibilities, configuration, and behavior of the Documentation Writer Agent in HUG AI.
---

# Documentation Writer Agent

The **Documentation Writer Agent** automates the generation of structured, human-readable documentation from project artifacts. It transforms specifications, code, and context into developer or user-facing docs.

## Role and Purpose

This agent helps:

- Generate API references, usage examples, and configuration guides
- Maintain consistency in structure and tone across all documentation
- Extract technical summaries from code and config files
- Prepare onboarding and handoff materials for teams

## Input

- Source code and comments
- Component specifications and requirements
- Style guides and documentation templates

## Output

- Markdown files for knowledge bases or doc sites
- Inline comments or docstrings (optional)
- Getting Started or Setup guides

## Example Output (Markdown)

```markdown
## AuthService: Token Refresh Endpoint

**POST /auth/refresh**

Refreshes an expired access token using a valid refresh token.

**Request Body:**
```json
{
  "refresh_token": "..."
}
```

**Response:**
```json
{
  "access_token": "...",
  "expires_in": 3600
}
```


## Governance & Validation

- Outputs reviewed by technical writers or leads
- Templates ensure structure and tone alignment
- Version-controlled and CI-validated before publishing

## Configuration (YAML)

```yaml
agent: documentation_writer_agent
input_sources:
  - src/**/*.py
  - specs/**/*.yaml
  - templates/doc_template.md
output_format: markdown
doc_type: api+component+guide
post_actions:
  - insert_front_matter
  - lint_with_mdl
```

## Integration

This agent is used:

- Post-implementation or during code stabilization
- In support of onboarding and external documentation needs
- Alongside QA and internal reviews

It supports seamless developer experiences and improves collaboration across teams.
