---
title: CI/CD Tools
description: Continuous integration and deployment tools for automated HUG AI development workflows.
---

# CI/CD Tools

HUG AI provides comprehensive CI/CD integrations that automate human-governed AI development workflows across popular platforms, ensuring quality, security, and governance requirements are met throughout the software delivery pipeline.

## GitHub Actions Integration

### Workflow Templates

#### **Complete HUG AI Workflow**
```yaml
# .github/workflows/hugai-complete.yml
name: HUG AI Development Workflow

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

env:
  HUGAI_API_KEY: ${{ secrets.HUGAI_API_KEY }}
  NODE_VERSION: '18'

jobs:
  hugai-analysis:
    runs-on: ubuntu-latest
    name: HUG AI Code Analysis
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'
          
      - name: Install HUG AI CLI
        run: npm install -g @hugai/cli
        
      - name: HUG AI Project Analysis
        run: |
          hugai analyze project \
            --format github-actions \
            --output analysis-report.json
            
      - name: Upload Analysis Report
        uses: actions/upload-artifact@v3
        with:
          name: hugai-analysis
          path: analysis-report.json

  quality-gates:
    runs-on: ubuntu-latest
    needs: hugai-analysis
    name: Quality Gates
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Install dependencies
        run: npm ci
        
      - name: HUG AI Quality Check
        run: |
          hugai quality check \
            --coverage-threshold 80 \
            --security-severity medium \
            --performance-budget 2s \
            --format github-actions
            
      - name: Security Scan
        run: |
          hugai security scan \
            --format sarif \
            --output hugai-security.sarif \
            --fail-on high
            
      - name: Upload Security Results
        uses: github/codeql-action/upload-sarif@v2
        if: always()
        with:
          sarif_file: hugai-security.sarif

  automated-testing:
    runs-on: ubuntu-latest
    needs: quality-gates
    name: AI-Generated Testing
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Generate Missing Tests
        run: |
          hugai test generate \
            --coverage-goal 90 \
            --types unit,integration \
            --auto-commit false
            
      - name: Run All Tests
        run: |
          npm test -- --coverage --coverageReporters=lcov
          hugai test analyze-results --input coverage/lcov.info
          
      - name: Upload Coverage
        uses: codecov/codecov-action@v3
        with:
          file: ./coverage/lcov.info

  governance-check:
    runs-on: ubuntu-latest
    needs: [quality-gates, automated-testing]
    name: Governance Validation
    if: github.event_name == 'pull_request'
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: HUG AI Governance Check
        run: |
          hugai governance validate \
            --pr-number ${{ github.event.number }} \
            --base-branch ${{ github.base_ref }} \
            --head-branch ${{ github.head_ref }}
            
      - name: Request Human Approval
        if: steps.governance.outputs.approval_required == 'true'
        uses: ./.github/actions/request-approval
        with:
          approvers: ${{ steps.governance.outputs.required_approvers }}
          context: "HUG AI governance check requires human approval"

  deployment-prep:
    runs-on: ubuntu-latest
    needs: governance-check
    name: Deployment Preparation
    if: github.ref == 'refs/heads/main'
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Generate Deployment Artifacts
        run: |
          hugai deploy prepare \
            --environment production \
            --generate-manifests \
            --create-rollback-plan
            
      - name: Upload Deployment Artifacts
        uses: actions/upload-artifact@v3
        with:
          name: deployment-artifacts
          path: deployment/
```

#### **PR Quality Check Workflow**
```yaml
# .github/workflows/hugai-pr-check.yml
name: HUG AI PR Quality Check

on:
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  hugai-pr-analysis:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0 # Full history for better analysis
          
      - name: HUG AI PR Analysis
        uses: hugai-org/github-action@v1
        with:
          command: 'pr analyze'
          base-branch: ${{ github.base_ref }}
          head-branch: ${{ github.head_ref }}
          
      - name: Comment PR with Analysis
        uses: actions/github-script@v6
        with:
          script: |
            const fs = require('fs');
            const analysis = JSON.parse(fs.readFileSync('hugai-pr-analysis.json'));
            
            const comment = `## 🤖 HUG AI Analysis
            
            ### Code Quality: ${analysis.quality.score}/100
            ### Security Issues: ${analysis.security.issues.length}
            ### Test Coverage: ${analysis.testing.coverage}%
            
            ${analysis.summary}
            
            ### Required Actions:
            ${analysis.actions.map(action => `- ${action}`).join('\n')}
            `;
            
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: comment
            });
```

### Custom Actions

#### **HUG AI Quality Gate Action**
```yaml
# .github/actions/hugai-quality-gate/action.yml
name: 'HUG AI Quality Gate'
description: 'Run HUG AI quality checks with configurable thresholds'

inputs:
  coverage-threshold:
    description: 'Minimum test coverage percentage'
    required: false
    default: '80'
  security-severity:
    description: 'Minimum security severity to fail'
    required: false
    default: 'medium'
  quality-score:
    description: 'Minimum quality score'
    required: false
    default: '85'

outputs:
  quality-passed:
    description: 'Whether quality gate passed'
  coverage-result:
    description: 'Current test coverage'
  security-issues:
    description: 'Number of security issues found'

runs:
  using: 'composite'
  steps:
    - name: Install HUG AI
      shell: bash
      run: npm install -g @hugai/cli
      
    - name: Run Quality Gate
      shell: bash
      run: |
        hugai quality gate \
          --coverage-threshold ${{ inputs.coverage-threshold }} \
          --security-severity ${{ inputs.security-severity }} \
          --quality-score ${{ inputs.quality-score }} \
          --format github-actions \
          --output quality-results.json
          
    - name: Set Outputs
      shell: bash
      run: |
        echo "quality-passed=$(jq -r '.passed' quality-results.json)" >> $GITHUB_OUTPUT
        echo "coverage-result=$(jq -r '.coverage' quality-results.json)" >> $GITHUB_OUTPUT
        echo "security-issues=$(jq -r '.security.count' quality-results.json)" >> $GITHUB_OUTPUT
```

## GitLab CI Integration

### Pipeline Templates

#### **Complete GitLab Pipeline**
```yaml
# .gitlab-ci.yml
stages:
  - analyze
  - quality
  - test
  - security
  - governance
  - deploy

variables:
  HUGAI_VERSION: "latest"
  NODE_VERSION: "18"

.hugai-setup: &hugai-setup
  - npm install -g @hugai/cli@$HUGAI_VERSION
  - hugai config set api-key $HUGAI_API_KEY

hugai-analysis:
  stage: analyze
  image: node:$NODE_VERSION
  script:
    - *hugai-setup
    - hugai analyze project --format gitlab --output analysis.json
  artifacts:
    reports:
      hugai: analysis.json
    expire_in: 1 week
  only:
    - merge_requests
    - main
    - develop

quality-check:
  stage: quality
  image: node:$NODE_VERSION
  script:
    - *hugai-setup
    - npm ci
    - |
      hugai quality check \
        --coverage-threshold 80 \
        --format gitlab \
        --output quality-report.json
  artifacts:
    reports:
      junit: quality-report.xml
      coverage_report:
        coverage_format: cobertura
        path: coverage/cobertura-coverage.xml
  coverage: '/Lines\s*:\s*(\d+\.\d+)%/'
  
security-scan:
  stage: security
  image: node:$NODE_VERSION
  script:
    - *hugai-setup
    - |
      hugai security scan \
        --format gitlab-sast \
        --output security-report.json
  artifacts:
    reports:
      sast: security-report.json
  allow_failure: false

test-generation:
  stage: test
  image: node:$NODE_VERSION
  script:
    - *hugai-setup
    - npm ci
    - hugai test generate --coverage-goal 90 --auto-commit false
    - npm test
  artifacts:
    reports:
      junit: test-results.xml
    paths:
      - coverage/
  coverage: '/Lines\s*:\s*(\d+\.\d+)%/'

governance-validation:
  stage: governance
  image: node:$NODE_VERSION
  script:
    - *hugai-setup
    - |
      hugai governance validate \
        --mr-iid $CI_MERGE_REQUEST_IID \
        --source-branch $CI_MERGE_REQUEST_SOURCE_BRANCH_NAME \
        --target-branch $CI_MERGE_REQUEST_TARGET_BRANCH_NAME
  only:
    - merge_requests
  when: manual
  allow_failure: false

deployment-prep:
  stage: deploy
  image: node:$NODE_VERSION
  script:
    - *hugai-setup
    - |
      hugai deploy prepare \
        --environment $CI_ENVIRONMENT_NAME \
        --commit-sha $CI_COMMIT_SHA \
        --generate-manifests
  artifacts:
    paths:
      - deployment/
    expire_in: 1 week
  only:
    - main
  environment:
    name: production
```

## Jenkins Integration

### Pipeline Script

```groovy
// Jenkinsfile
pipeline {
    agent any
    
    environment {
        HUGAI_API_KEY = credentials('hugai-api-key')
        NODE_VERSION = '18'
    }
    
    stages {
        stage('Setup') {
            steps {
                script {
                    // Install Node.js and HUG AI CLI
                    sh """
                        nvm use ${NODE_VERSION}
                        npm install -g @hugai/cli
                        hugai --version
                    """
                }
            }
        }
        
        stage('HUG AI Analysis') {
            steps {
                script {
                    sh '''
                        hugai analyze project \
                            --format jenkins \
                            --output analysis-report.json
                    '''
                    
                    // Archive analysis results
                    archiveArtifacts artifacts: 'analysis-report.json'
                }
            }
        }
        
        stage('Quality Gates') {
            parallel {
                stage('Code Quality') {
                    steps {
                        sh '''
                            hugai quality check \
                                --coverage-threshold 80 \
                                --format junit \
                                --output quality-results.xml
                        '''
                        
                        publishTestResults testResultsPattern: 'quality-results.xml'
                    }
                }
                
                stage('Security Scan') {
                    steps {
                        sh '''
                            hugai security scan \
                                --format json \
                                --output security-report.json \
                                --fail-on high
                        '''
                        
                        publishHTML([
                            allowMissing: false,
                            alwaysLinkToLastBuild: true,
                            keepAll: true,
                            reportDir: '.',
                            reportFiles: 'security-report.html',
                            reportName: 'Security Report'
                        ])
                    }
                }
                
                stage('Test Generation') {
                    steps {
                        sh '''
                            hugai test generate \
                                --coverage-goal 90 \
                                --types unit,integration
                            
                            npm test -- --reporter mocha-junit-reporter
                        '''
                        
                        publishTestResults testResultsPattern: 'test-results.xml'
                        publishCoverage adapters: [
                            istanbulCoberturaAdapter('coverage/cobertura-coverage.xml')
                        ], sourceFileResolver: sourceFiles('STORE_LAST_BUILD')
                    }
                }
            }
        }
        
        stage('Governance Check') {
            when {
                changeRequest()
            }
            steps {
                script {
                    def approvalRequired = sh(
                        script: '''
                            hugai governance validate \
                                --pr-number ${CHANGE_ID} \
                                --output-approval-required
                        ''',
                        returnStdout: true
                    ).trim()
                    
                    if (approvalRequired == 'true') {
                        input message: 'HUG AI governance requires human approval. Proceed?',
                              submitterParameter: 'APPROVER'
                        
                        sh """
                            hugai governance approve \
                                --pr-number ${CHANGE_ID} \
                                --approver ${APPROVER}
                        """
                    }
                }
            }
        }
        
        stage('Deploy Preparation') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                    hugai deploy prepare \
                        --environment production \
                        --build-number ${BUILD_NUMBER} \
                        --commit-sha ${GIT_COMMIT}
                '''
                
                archiveArtifacts artifacts: 'deployment/**/*'
            }
        }
    }
    
    post {
        always {
            // Send HUG AI pipeline results
            sh '''
                hugai pipeline report \
                    --build-number ${BUILD_NUMBER} \
                    --status ${currentBuild.currentResult} \
                    --duration ${currentBuild.duration}
            '''
        }
        
        failure {
            // Notify team of pipeline failure
            sh '''
                hugai notify failure \
                    --pipeline jenkins \
                    --build-number ${BUILD_NUMBER} \
                    --branch ${GIT_BRANCH}
            '''
        }
    }
}
```

## Azure DevOps Integration

### Pipeline YAML

```yaml
# azure-pipelines.yml
trigger:
  branches:
    include:
    - main
    - develop
  paths:
    exclude:
    - docs/*
    - README.md

pr:
  branches:
    include:
    - main
  paths:
    exclude:
    - docs/*

variables:
  nodeVersion: '18.x'
  hugaiVersion: 'latest'

stages:
- stage: Analysis
  displayName: 'HUG AI Analysis'
  jobs:
  - job: ProjectAnalysis
    displayName: 'Project Analysis'
    pool:
      vmImage: 'ubuntu-latest'
    steps:
    - task: NodeTool@0
      inputs:
        versionSpec: $(nodeVersion)
      displayName: 'Install Node.js'
      
    - script: |
        npm install -g @hugai/cli@$(hugaiVersion)
        hugai --version
      displayName: 'Install HUG AI CLI'
      
    - script: |
        hugai analyze project \
          --format azure-devops \
          --output $(Build.ArtifactStagingDirectory)/analysis.json
      displayName: 'Run Project Analysis'
      env:
        HUGAI_API_KEY: $(hugai-api-key)
        
    - task: PublishBuildArtifacts@1
      inputs:
        pathToPublish: '$(Build.ArtifactStagingDirectory)'
        artifactName: 'hugai-analysis'

- stage: QualityGates
  displayName: 'Quality Gates'
  dependsOn: Analysis
  jobs:
  - job: QualityCheck
    displayName: 'Quality Check'
    pool:
      vmImage: 'ubuntu-latest'
    steps:
    - task: NodeTool@0
      inputs:
        versionSpec: $(nodeVersion)
        
    - script: npm ci
      displayName: 'Install Dependencies'
      
    - script: |
        hugai quality check \
          --coverage-threshold 80 \
          --security-severity medium \
          --format azure-devops
      displayName: 'Run Quality Check'
      env:
        HUGAI_API_KEY: $(hugai-api-key)
        
    - task: PublishTestResults@2
      inputs:
        testResultsFormat: 'JUnit'
        testResultsFiles: 'quality-results.xml'
        testRunTitle: 'HUG AI Quality Check'
      condition: always()

- stage: Governance
  displayName: 'Governance Validation'
  dependsOn: QualityGates
  condition: and(succeeded(), eq(variables['Build.Reason'], 'PullRequest'))
  jobs:
  - job: GovernanceCheck
    displayName: 'Governance Validation'
    pool:
      vmImage: 'ubuntu-latest'
    steps:
    - script: |
        hugai governance validate \
          --pr-number $(System.PullRequest.PullRequestNumber) \
          --source-branch $(System.PullRequest.SourceBranch) \
          --target-branch $(System.PullRequest.TargetBranch)
      displayName: 'Validate Governance'
      env:
        HUGAI_API_KEY: $(hugai-api-key)
```

## CircleCI Integration

### Configuration

```yaml
# .circleci/config.yml
version: 2.1

orbs:
  node: circleci/node@5.0.2
  hugai: hugai-org/hugai@1.0.0

workflows:
  hugai-development:
    jobs:
      - hugai-analysis:
          context: hugai-credentials
      - quality-gates:
          requires:
            - hugai-analysis
      - governance-check:
          requires:
            - quality-gates
          filters:
            branches:
              ignore: main
      - deploy-prep:
          requires:
            - quality-gates
          filters:
            branches:
              only: main

jobs:
  hugai-analysis:
    executor: node/default
    steps:
      - checkout
      - hugai/install
      - hugai/analyze:
          format: "circleci"
          output: "analysis-results"
      - store_artifacts:
          path: analysis-results

  quality-gates:
    executor: node/default
    steps:
      - checkout
      - node/install-packages
      - hugai/install
      - hugai/quality-check:
          coverage-threshold: 80
          security-severity: "medium"
      - hugai/security-scan:
          format: "sarif"
      - store_test_results:
          path: test-results
      - store_artifacts:
          path: coverage

  governance-check:
    executor: node/default
    steps:
      - checkout
      - hugai/install
      - hugai/governance-validate:
          pr-number: << pipeline.number >>
      - hugai/request-approval:
          when: on_fail

  deploy-prep:
    executor: node/default
    steps:
      - checkout
      - hugai/install
      - hugai/deploy-prepare:
          environment: "production"
      - store_artifacts:
          path: deployment
```

## Custom CI/CD Integrations

### Docker-based Pipeline

```dockerfile
# Dockerfile.hugai-ci
FROM node:18-alpine

# Install HUG AI CLI
RUN npm install -g @hugai/cli

# Install common tools
RUN apk add --no-cache git curl jq

# Copy pipeline scripts
COPY scripts/ /scripts/
RUN chmod +x /scripts/*.sh

WORKDIR /workspace

# Entry point for CI operations
ENTRYPOINT ["/scripts/ci-entrypoint.sh"]
```

```bash
#!/bin/bash
# scripts/ci-entrypoint.sh

set -e

COMMAND=$1
shift

case $COMMAND in
  "analyze")
    echo "Running HUG AI project analysis..."
    hugai analyze project --format json --output analysis.json
    ;;
    
  "quality")
    echo "Running quality checks..."
    hugai quality check \
      --coverage-threshold ${COVERAGE_THRESHOLD:-80} \
      --security-severity ${SECURITY_SEVERITY:-medium}
    ;;
    
  "governance")
    echo "Validating governance..."
    hugai governance validate \
      --pr-number $PR_NUMBER \
      --base-branch $BASE_BRANCH
    ;;
    
  "deploy-prep")
    echo "Preparing deployment..."
    hugai deploy prepare \
      --environment $ENVIRONMENT \
      --version $VERSION
    ;;
    
  *)
    echo "Unknown command: $COMMAND"
    echo "Available commands: analyze, quality, governance, deploy-prep"
    exit 1
    ;;
esac
```

### Kubernetes Job Templates

```yaml
# k8s/hugai-quality-job.yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: hugai-quality-check
spec:
  template:
    spec:
      containers:
      - name: hugai-ci
        image: hugai/ci:latest
        command: ["/scripts/ci-entrypoint.sh"]
        args: ["quality"]
        env:
        - name: HUGAI_API_KEY
          valueFrom:
            secretKeyRef:
              name: hugai-credentials
              key: api-key
        - name: COVERAGE_THRESHOLD
          value: "80"
        - name: SECURITY_SEVERITY
          value: "medium"
        volumeMounts:
        - name: source-code
          mountPath: /workspace
      volumes:
      - name: source-code
        persistentVolumeClaim:
          claimName: source-code-pvc
      restartPolicy: Never
```

## Monitoring and Analytics

### Pipeline Metrics Collection

```yaml
# Pipeline metrics configuration
metrics:
  enabled: true
  collectors:
    - prometheus
    - datadog
    - custom-webhook
    
  metrics:
    - name: "pipeline_duration"
      type: "histogram"
      labels: ["stage", "outcome"]
      
    - name: "quality_score"
      type: "gauge" 
      labels: ["project", "branch"]
      
    - name: "security_issues"
      type: "counter"
      labels: ["severity", "category"]
      
    - name: "governance_approvals"
      type: "counter"
      labels: ["approver", "outcome"]
```

### Dashboard Configuration

```json
{
  "dashboard": {
    "title": "HUG AI CI/CD Analytics",
    "panels": [
      {
        "title": "Pipeline Success Rate",
        "type": "stat",
        "targets": [
          {
            "expr": "rate(hugai_pipeline_success_total[1h])"
          }
        ]
      },
      {
        "title": "Quality Score Trend", 
        "type": "graph",
        "targets": [
          {
            "expr": "hugai_quality_score"
          }
        ]
      },
      {
        "title": "Security Issues by Severity",
        "type": "piechart",
        "targets": [
          {
            "expr": "sum by (severity) (hugai_security_issues)"
          }
        ]
      }
    ]
  }
}
```

## Best Practices

### CI/CD Pipeline Guidelines

1. **Fail Fast**: Run quality checks early in the pipeline
2. **Parallel Execution**: Run independent checks in parallel
3. **Governance Gates**: Require human approval for critical changes
4. **Artifact Management**: Store all analysis results and reports
5. **Monitoring**: Track pipeline performance and success rates

### Security Considerations

1. **API Key Management**: Use secure credential storage
2. **Network Security**: Ensure secure communication with HUG AI services
3. **Audit Logging**: Log all CI/CD activities for compliance
4. **Access Control**: Limit who can modify pipeline configurations

### Performance Optimization

1. **Caching**: Cache dependencies and analysis results
2. **Incremental Analysis**: Only analyze changed files when possible
3. **Resource Limits**: Set appropriate resource limits for CI jobs
4. **Timeout Configuration**: Set reasonable timeouts for all operations

---

HUG AI CI/CD tools provide comprehensive automation for human-governed AI development workflows, ensuring quality, security, and governance requirements are consistently met across all software delivery pipelines.