---
title: Branch & PR Manager Agent
description: Defines the responsibilities, configuration, and behavior of the Branch & PR Manager Agent in HUG AI.
---

# Branch & PR Manager Agent

The **Branch & PR Manager Agent** facilitates clean, traceable, and automated source control practices across AI-assisted development workflows.

## Role and Purpose

This agent helps:

- Create branches following naming conventions
- Initialize pull requests with context-rich descriptions
- Assign reviewers and labels based on task metadata
- Auto-close or update stale PRs when criteria are met

## Input

- Task definitions and agent output (e.g., implementation or documentation changes)
- Repository metadata and git history
- PR templates and config rules

## Output

- New branches with consistent naming
- Draft PRs with change summaries and linked issues
- YAML/JSON logs of branching actions for audit

## Example Output (PR Summary)

```markdown
### PR: feat/auth-login-implementation

Implements login endpoint per spec RQ-001.
- Adds token generation logic
- Includes unit tests (94% coverage)
- Reviewed by implementation and security agents

Closes: #34
Labels: feature, reviewed
```

## Governance & Validation

- Actions must be traceable and follow branching policy
- Human approval required for merges
- Automated checks (CI, reviewers, lint) enforced before merge

## Configuration (YAML)

```yaml
agent: branch_pr_manager_agent
branch_prefix: feat
naming_strategy: kebab-case
pull_request_template: .github/PULL_REQUEST_TEMPLATE.md
assign_reviewers: true
label_strategy: agent_based
post_actions:
  - trigger_ci_pipeline
  - notify_team_in_slack
```

## Integration

This agent is triggered:

- After implementation, testing, or documentation agents finish work
- At the start of a new feature or hotfix cycle
- In automation flows for bulk updates or module migrations

It ensures version control hygiene and speeds up collaboration across contributors.
