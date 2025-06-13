---
title: CLI & Automation Tools
description: Command-line interfaces and automation scripts for streamlined HUG AI development workflows.
---

# CLI & Automation Tools

The HUG AI CLI and automation tools provide command-line interfaces and scripting capabilities that enable developers to integrate AI-assisted development into their existing workflows seamlessly.

## HUG AI CLI

### Installation

```bash
# Install globally via npm
npm install -g @hugai/cli

# Or use via npx (no installation required)
npx @hugai/cli --version

# Verify installation
hugai --version
```

### Core Commands

#### Project Initialization

```bash
# Initialize HUG AI in existing project
hugai init

# Create new project with HUG AI
hugai create <project-name> --template <template-name>

# Initialize with specific configuration
hugai init --config enterprise --stack react,nodejs
```

#### Agent Management

```bash
# List available agents
hugai agents list

# Configure agent for specific task
hugai agents configure --type code-gen --language typescript

# Run specific agent
hugai agents run architecture --input "Design user authentication system"

# Agent status and monitoring
hugai agents status
hugai agents logs --agent code-gen
```

#### Development Workflow

```bash
# Generate feature with AI assistance
hugai feature create "user profile management"

# Generate API endpoints
hugai api generate --from schema.yaml

# Create tests for existing code
hugai test generate --coverage 90

# Generate documentation
hugai docs generate --format markdown
```

#### Quality & Review

```bash
# Run code quality checks
hugai quality check --fix

# Perform AI-assisted code review
hugai review --branch feature/user-auth

# Security analysis
hugai security scan --severity high

# Performance analysis
hugai performance analyze --entry-point src/index.js
```

#### Deployment & Operations

```bash
# Prepare deployment
hugai deploy prepare --environment staging

# Generate infrastructure code
hugai infra generate --provider aws --region us-east-1

# Create monitoring setup
hugai monitor setup --provider datadog
```

### Advanced Usage

#### Configuration Management

```bash
# Show current configuration
hugai config show

# Update configuration
hugai config set governance.checkpoints.after_testing true

# Import configuration from file
hugai config import .hugai/config.yaml

# Export configuration
hugai config export --format yaml > hugai-config.yaml
```

#### Multi-Agent Workflows

```bash
# Run coordinated multi-agent workflow
hugai workflow run feature-development \
  --agents requirements,architecture,implementation,testing \
  --input "User notification system"

# Create custom workflow
hugai workflow create notification-workflow \
  --steps "requirements -> architecture -> implementation -> testing"

# Monitor workflow progress
hugai workflow status --id workflow-123
```

#### Team Collaboration

```bash
# Share agent configurations with team
hugai team sync --push-config

# Pull latest team configurations
hugai team sync --pull-config

# Review team activity
hugai team activity --since 1week

# Team metrics and analytics
hugai team metrics --period monthly
```

## Automation Scripts

### Git Hooks Integration

**Pre-commit Hook:**
```bash
#!/bin/sh
# .git/hooks/pre-commit

# Run HUG AI quality checks before commit
hugai quality check --staged

# Generate documentation if needed
if hugai docs needs-update; then
  hugai docs generate --stage
fi

# Exit with error if quality checks fail
exit $?
```

**Pre-push Hook:**
```bash
#!/bin/sh
# .git/hooks/pre-push

# Run comprehensive testing
hugai test run --coverage-threshold 80

# Security scan
hugai security scan --block-push-on-high

# Performance regression check
hugai performance regression-check --baseline main

exit $?
```

### Development Environment Setup

**Bootstrap Script:**
```bash
#!/bin/bash
# scripts/bootstrap.sh

echo "Setting up HUG AI development environment..."

# Install HUG AI CLI if not present
if ! command -v hugai &> /dev/null; then
    npm install -g @hugai/cli
fi

# Initialize HUG AI in project
hugai init --auto-detect

# Install pre-commit hooks
hugai setup hooks --install

# Configure agents based on project stack
hugai agents auto-configure

# Set up team configuration sync
hugai team setup-sync --repo-url $GITHUB_REPOSITORY

echo "HUG AI development environment ready!"
```

**Development Server Script:**
```bash
#!/bin/bash
# scripts/dev-server.sh

# Start development server with HUG AI monitoring
hugai dev start --monitor &
DEV_PID=$!

# Start file watcher for automatic code quality checks
hugai watch --quality-check &
WATCH_PID=$!

echo "Development server running with HUG AI assistance"
echo "Press Ctrl+C to stop"

# Cleanup on exit
trap "kill $DEV_PID $WATCH_PID" EXIT
wait $DEV_PID
```

### CI/CD Integration Scripts

**GitHub Actions Integration:**
```yaml
# .github/workflows/hugai-quality.yml
name: HUG AI Quality Check

on: [push, pull_request]

jobs:
  quality-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
          
      - name: Install HUG AI CLI
        run: npm install -g @hugai/cli
        
      - name: HUG AI Quality Check
        run: |
          hugai quality check --format github-actions
          hugai security scan --format sarif --output security.sarif
          
      - name: Upload Security Results
        uses: github/codeql-action/upload-sarif@v2
        if: always()
        with:
          sarif_file: security.sarif
```

**GitLab CI Integration:**
```yaml
# .gitlab-ci.yml
stages:
  - quality
  - test
  - deploy

hugai-quality:
  stage: quality
  image: node:18
  script:
    - npm install -g @hugai/cli
    - hugai quality check --format gitlab
    - hugai security scan --format gitlab-sast
  artifacts:
    reports:
      sast: hugai-security-report.json
    expire_in: 1 week
```

### Deployment Automation

**Deployment Preparation Script:**
```bash
#!/bin/bash
# scripts/deploy-prep.sh

ENVIRONMENT=$1
if [ -z "$ENVIRONMENT" ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

echo "Preparing deployment for $ENVIRONMENT..."

# Run full quality suite
hugai quality check --comprehensive

# Generate deployment documentation
hugai docs generate --type deployment --environment $ENVIRONMENT

# Create infrastructure if needed
hugai infra plan --environment $ENVIRONMENT

# Generate monitoring configuration
hugai monitor generate-config --environment $ENVIRONMENT

# Create rollback plan
hugai deploy create-rollback-plan --environment $ENVIRONMENT

echo "Deployment preparation completed for $ENVIRONMENT"
```

**Health Check Script:**
```bash
#!/bin/bash
# scripts/health-check.sh

# Run HUG AI health checks after deployment
hugai health-check \
  --endpoint $DEPLOYMENT_URL \
  --tests functional,performance,security \
  --timeout 300

# Monitor initial metrics
hugai monitor check-metrics \
  --environment $ENVIRONMENT \
  --duration 5m \
  --alert-on-anomalies

# Report deployment status
hugai deploy report-status \
  --deployment-id $DEPLOYMENT_ID \
  --status healthy
```

## Custom Automation Examples

### Code Quality Enforcement

```bash
#!/bin/bash
# scripts/quality-gate.sh

# Comprehensive quality gate script
QUALITY_THRESHOLD=85
SECURITY_THRESHOLD=high
COVERAGE_THRESHOLD=80

echo "Running HUG AI quality gate..."

# Code quality analysis
QUALITY_SCORE=$(hugai quality analyze --score-only)
if [ $QUALITY_SCORE -lt $QUALITY_THRESHOLD ]; then
    echo "Quality score $QUALITY_SCORE below threshold $QUALITY_THRESHOLD"
    exit 1
fi

# Security analysis
hugai security scan --severity $SECURITY_THRESHOLD --fail-on-issues

# Test coverage
hugai test coverage --threshold $COVERAGE_THRESHOLD

# Performance analysis
hugai performance analyze --fail-on-regression

echo "All quality gates passed!"
```

### Documentation Automation

```bash
#!/bin/bash
# scripts/auto-docs.sh

# Automatic documentation generation and updates
echo "Generating documentation with HUG AI..."

# API documentation
hugai docs api generate --format openapi

# Code documentation
hugai docs code generate --include-examples

# Architecture documentation
hugai docs architecture generate --include-diagrams

# User documentation
hugai docs user generate --from-specs

# Check for documentation gaps
hugai docs analyze-gaps --suggest-improvements

# Commit documentation changes
if [ -n "$(git status --porcelain docs/)" ]; then
    git add docs/
    git commit -m "docs: Auto-update documentation

🤖 Generated with HUG AI CLI
- API documentation updated
- Code examples refreshed  
- Architecture diagrams updated"
fi
```

### Team Workflow Automation

```bash
#!/bin/bash
# scripts/team-workflow.sh

FEATURE_NAME=$1
ASSIGNEE=$2

if [ -z "$FEATURE_NAME" ] || [ -z "$ASSIGNEE" ]; then
    echo "Usage: $0 <feature-name> <assignee>"
    exit 1
fi

echo "Setting up team workflow for feature: $FEATURE_NAME"

# Create feature branch
git checkout -b "feature/$FEATURE_NAME"

# Initialize feature with HUG AI
hugai feature init "$FEATURE_NAME" --assignee "$ASSIGNEE"

# Generate initial structure
hugai feature scaffold "$FEATURE_NAME" --auto-detect-requirements

# Set up feature-specific monitoring
hugai monitor setup-feature --name "$FEATURE_NAME"

# Create feature documentation
hugai docs feature create "$FEATURE_NAME"

# Send team notification
hugai team notify "Feature $FEATURE_NAME initialized and assigned to $ASSIGNEE"

echo "Feature workflow setup completed!"
```

## Configuration Files

### CLI Configuration

```yaml
# ~/.hugai/config.yaml
version: "1.0"

# Default project settings
defaults:
  language: "typescript"
  framework: "react"
  testing: "jest"
  governance_level: "team"

# Agent configurations
agents:
  code_generation:
    temperature: 0.2
    max_tokens: 2000
    model: "gpt-4"
  
  code_review:
    strict_mode: true
    auto_fix: false
    
  documentation:
    style: "markdown"
    include_examples: true

# Quality thresholds
quality:
  code_coverage: 80
  security_severity: "medium"
  performance_budget: "2s"

# Team settings
team:
  sync_interval: "15m"
  notification_channels: ["slack", "email"]
  approval_timeout: "24h"
```

### Project Configuration

```yaml
# .hugai/project.yaml
project:
  name: "my-awesome-app"
  type: "web-application"
  stack: ["react", "nodejs", "postgresql"]

governance:
  checkpoints:
    after_design: true
    after_implementation: false
    before_deployment: true
  
  approvers:
    technical: ["tech-lead@company.com"]
    security: ["security@company.com"]

automation:
  pre_commit: true
  auto_documentation: true
  quality_gates: true
  deployment_checks: true

integrations:
  ci_cd: "github-actions"
  monitoring: "datadog"
  notifications: "slack"
```

## Best Practices

### CLI Usage Guidelines

1. **Always use version control** for HUG AI configurations
2. **Test automation scripts** in staging environments first
3. **Use meaningful commit messages** when HUG AI makes changes
4. **Monitor resource usage** during AI operations
5. **Keep credentials secure** - never commit API keys

### Script Organization

```
scripts/
├── setup/
│   ├── bootstrap.sh
│   └── configure-hugai.sh
├── development/
│   ├── dev-server.sh
│   └── quality-check.sh
├── deployment/
│   ├── deploy-prep.sh
│   └── health-check.sh
└── maintenance/
    ├── update-docs.sh
    └── cleanup.sh
```

### Error Handling

```bash
# Always include proper error handling
set -e  # Exit on error
set -u  # Exit on undefined variables

# Function for error reporting
error_exit() {
    echo "Error: $1" >&2
    hugai team notify "Automation failed: $1"
    exit 1
}

# Usage example
hugai quality check || error_exit "Quality check failed"
```

---

The HUG AI CLI and automation tools provide a comprehensive command-line interface for integrating AI-assisted development into any workflow. From simple quality checks to complex multi-agent workflows, these tools enable teams to harness the power of AI while maintaining human control and oversight.