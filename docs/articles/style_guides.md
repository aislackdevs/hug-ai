---
title: Coding Style Guides
description: Shared formatting and naming conventions used across HUG AI agents and human contributors.
---

# Coding Style Guides

Consistency in code style is critical for collaboration between humans and AI agents. HUG AI promotes shared style guides to ensure all generated and manually written code adheres to common patterns.

## Why Style Guides Matter

- Make code easier to read, maintain, and extend
- Help align AI outputs with human expectations
- Enable automated linting, formatting, and code validation

## Format Standards

| Language | Formatter        | Linter             |
|----------|------------------|--------------------|
| Python   | Black            | Flake8, Bandit     |
| TypeScript | Prettier       | ESLint             |
| Go       | gofmt            | golint             |
| Markdown | Prettier         | Markdownlint       |

## Naming Conventions

- **Variables**: `snake_case`
- **Classes**: `PascalCase`
- **Constants**: `ALL_CAPS`
- **Files**: `kebab-case.md`, `snake_case.py`

## Documentation

- All functions and classes must have docstrings
- Use markdown headers and code blocks consistently
- Include `---` metadata headers in `.md` files for config parsing

## Prompting for Style

Agents should be configured to:
- Reference a central `coding_standards.md`
- Use templates with embedded style examples
- Auto-format outputs where possible

## Enforcing Style in CI

- Add format and lint steps to every pull request
- Reject merges if style violations are detected
- Allow overrides only with justification and tags

## Versioning

- Style guides should live in `/tools/style-guides.md`
- Major revisions require stakeholder review
- Agents must track the version of the guide used

---


