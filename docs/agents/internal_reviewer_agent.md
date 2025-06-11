---
title: Internal Reviewer Agent
description: Defines the responsibilities, configuration, and behavior of the Internal Reviewer Agent in HUG AI.
---

# Internal Reviewer Agent

The **Internal Reviewer Agent** acts as an automated code and artifact reviewer, enforcing internal standards, consistency, and compliance across all deliverables.

## Role and Purpose

This agent helps:

- Evaluate outputs from other agents or developers
- Check for consistency, style, and structural alignment
- Detect potential regressions, redundancy, or policy violations
- Generate review summaries with suggestions or approval status

## Input

- Source code or generated artifacts (docs, YAML, etc.)
- Checklists and review policies
- Style guides and documentation standards

## Output

- Annotated review reports
- Line-level comments (if integrated with GitHub/GitLab APIs)
- Decision tags (approved/requires changes/flagged)

## Example Output (YAML)

```yaml
review:
  target: src/auth/token.py
  status: requires_changes
  issues:
    - line: 23
      message: Missing input validation for refresh token
    - line: 42
      message: Use logging instead of print()
```

## Governance & Validation

- Review results must be acknowledged by human reviewers
- False positives tracked and improved iteratively
- Review summaries are stored with build artifacts

## Configuration (YAML)

```yaml
agent: internal_reviewer_agent
input_sources:
  - src/**/*.py
  - docs/**/*.md
  - policies/code_review_checklist.md
output_format: yaml+markdown
prompt_type: structured_review
post_actions:
  - notify_team_leads
  - tag_review_status
```

## Integration

This agent runs:

- During pull request workflows
- After other agents produce artifacts
- On schedule in continuous compliance checks

It strengthens overall governance and accelerates safe iteration loops.
