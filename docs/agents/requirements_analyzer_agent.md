---
title: Requirements Analyzer Agent
description: Defines the responsibilities, configuration, and behavior of the Requirements Analyzer Agent in HUG AI.
---

# Requirements Analyzer Agent

The **Requirements Analyzer Agent** is responsible for extracting, clarifying, and validating project requirements during the planning phase of the development lifecycle.

Its purpose is to assist human stakeholders in transforming abstract needs, ideas, or conversations into structured, actionable requirements that are traceable throughout the SDLC.

## Role and Purpose

This agent helps:

- Interpret informal business inputs (e.g., user stories, notes, transcripts)
- Detect ambiguity, inconsistency, or missing information
- Suggest technical and functional requirements
- Prepare structured outputs for design and architecture agents

It works closely with product owners, analysts, and architecture agents.

## Input

The agent accepts:

- Free-form text: user stories, meeting transcripts, brainstorm notes
- Existing partial specs
- Context files (e.g., business goals, personas, constraints)

## Output

- A structured list of validated requirements (functional and non-functional)
- Tags for criticality, scope, and dependency
- Clarification questions for missing or unclear items
- A `requirements.yaml` file ready for review and version control

## Example Output Schema

```yaml
requirements:
  - id: RQ-001
    title: User Login
    type: functional
    priority: high
    description: The system must allow users to log in using email and password.
    dependencies: []
    notes: Ensure OAuth is considered for future versions.
```

## Governance & Validation

- Outputs are always reviewed by a human stakeholder or analyst
- Prompting is standardized and versioned
- Any change to inputs or outputs triggers a traceable commit

## Configuration (YAML)

Example snippet:

```yaml
agent: requirements_analyzer
input_format: markdown|transcript|plaintext
output_format: yaml
schema: requirements_v1
context:
  - business_goals.md
  - user_personas.md
prompt_type: clarifying+extraction
post_actions:
  - tag_missing_requirements
  - generate_questions_for_review
```

## Integration

This agent typically runs at the beginning of the lifecycle, but can be reused in:

- Feature grooming
- Sprint pre-planning
- Change request analysis

It feeds directly into the `architecture_agent` and `design` phase.

---


