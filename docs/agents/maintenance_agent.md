---
title: Maintenance Agent
description: Defines the responsibilities, configuration, and behavior of the Maintenance Agent in HUG AI.
---

# Maintenance Agent

The **Maintenance Agent** supports long-term health and sustainability of AI-assisted projects by automating periodic tasks, identifying tech debt, and proposing improvements.

## Role and Purpose

This agent helps:

- Detect outdated dependencies and deprecated APIs
- Identify unused or dead code paths
- Flag documentation drift or staleness
- Recommend updates or refactoring opportunities

## Input

- Codebase and dependency manifests
- CI/CD logs and usage metrics
- Documentation change history

## Output

- Maintenance reports (HTML or Markdown)
- Suggested tasks or JIRA tickets
- Version bump PRs (optional)

## Example Output (Markdown)

```markdown
## Maintenance Report - June 2025

- Outdated package: `express@4.17.1` (latest: 4.19.0)
- Deprecated method in `authService.js` (line 73)
- README.md last updated 14 months ago

Suggested Actions:
- Upgrade `express`
- Replace deprecated usage
- Regenerate README using Documentation Writer Agent
```

## Governance & Validation

- Maintenance tasks reviewed in backlog grooming
- Code quality tools used to validate refactors
- Agent usage tracked in team rituals (e.g., retro, planning)

## Configuration (YAML)

```yaml
agent: maintenance_agent
input_sources:
  - src/**/*.js
  - package.json
  - docs/**/*.md
output_format: markdown+html
prompt_type: audit+refactor_suggestion
post_actions:
  - open_github_issues
  - suggest_readme_regeneration
```

## Integration

This agent runs:

- On a schedule (e.g., weekly, monthly)
- Before major version bumps or audits
- In sprint cycles focused on refactoring or documentation

It integrates closely with the Documentation Writer, Internal Reviewer, and DevOps agents.
