# HUG AI Development Quickstart Guide

This configuration template enables **HUG AI Development** to work with any programming language, framework, and project type. Copy this template to `.sdc/config.yaml` in your project root and customize it for your specific technology stack.

## Complete Configuration Template

```yaml
# **HUG AI Development** Universal Project Configuration
# Copy this to: .sdc/config.yaml

project:
  name: "my-project"
  type: "web-application"        # web-application | mobile-app | backend-service | desktop-app | library
  language: "typescript"        # Primary programming language
  framework: "react"            # Main framework/platform
  architecture: "component-based" # Architecture pattern

# Technology Stack Configuration
technology:
  runtime: "node"               # node | python | java | dotnet | go | rust | dart
  package_manager: "npm"        # npm | yarn | pip | maven | gradle | cargo | pub
  build_tool: "vite"           # vite | webpack | rollup | maven | gradle | cargo | flutter
  
  # Testing frameworks
  testing:
    unit: "jest"                # jest | vitest | pytest | junit | nunit | go-test
    integration: "cypress"      # cypress | playwright | selenium | postman
    e2e: "playwright"          # playwright | cypress | detox | selenium
  
  # Code quality tools  
  quality:
    linter: "eslint"            # eslint | pylint | checkstyle | golint | dart-analyze
    formatter: "prettier"       # prettier | black | google-java-format | gofmt
    type_checker: "typescript"  # typescript | mypy | flow | none

# Project Structure Configuration
structure:
  source_dir: "src"
  
  # Frontend/UI structure
  components_dir: "src/components"     # React/Vue components | Flutter widgets
  pages_dir: "src/pages"              # Page components | Screen widgets
  hooks_dir: "src/hooks"              # React hooks | Custom hooks
  
  # Business logic structure
  services_dir: "src/services"        # Business services | API clients
  utils_dir: "src/utils"              # Utility functions
  types_dir: "src/types"              # Type definitions
  
  # Backend structure (if applicable)
  controllers_dir: "src/controllers"  # API controllers
  models_dir: "src/models"            # Data models
  repositories_dir: "src/repositories" # Data access
  
  # Testing structure
  tests_dir: "tests"                  # Test files location
  test_utils_dir: "tests/utils"      # Test utilities
  fixtures_dir: "tests/fixtures"     # Test data

# Architecture Configuration
architecture:
  pattern: "clean-architecture"       # clean | layered | mvc | mvvm | component-based
  layers:                            # Architecture layers (customize based on pattern)
    - "presentation"
    - "domain" 
    - "data"
  
  # Design patterns in use
  patterns:
    dependency_injection: true
    repository_pattern: true
    factory_pattern: false
    observer_pattern: true
    command_pattern: false

# Development Commands
commands:
  # Development
  dev: "npm run dev"
  build: "npm run build"
  start: "npm start"
  
  # Testing
  test: "npm test"
  test_unit: "npm run test:unit"
  test_integration: "npm run test:integration"
  test_e2e: "npm run test:e2e"
  test_coverage: "npm run test:coverage"
  test_watch: "npm run test:watch"
  
  # Code quality
  lint: "npm run lint"
  lint_fix: "npm run lint:fix"
  format: "npm run format"
  type_check: "npm run type-check"
  
  # Dependencies
  install: "npm install"
  update: "npm update"
  audit: "npm audit"

# Coding Standards
standards:
  style_guide: "docs/style-guide.md"  # Path to project style guide
  naming_conventions:
    files: "kebab-case"               # kebab-case | camelCase | PascalCase | snake_case
    functions: "camelCase"            # camelCase | snake_case | PascalCase
    classes: "PascalCase"             # PascalCase | camelCase | snake_case
    constants: "UPPER_SNAKE_CASE"    # UPPER_SNAKE_CASE | camelCase
  
  # Code organization principles
  principles:
    - "single-responsibility"
    - "dependency-inversion"
    - "dry"
    - "kiss"

# Human Governance Configuration
governance:
  # Checkpoint configuration for human validation
  checkpoints:
    after_analysis: false            # Pause after requirements analysis
    after_design: true              # Pause after architecture design
    after_implementation: false     # Pause after code implementation
    after_testing: true            # Pause after test creation
    before_pr: true               # Always pause before creating PR
  
  # Approval roles
  approvers:
    technical: ["senior-dev", "tech-lead"]
    product: ["product-manager"]
    design: ["ux-designer"]

# Documentation Configuration  
documentation:
  auto_generate: true              # Auto-generate documentation
  formats: ["markdown", "jsdoc"]   # markdown | jsdoc | sphinx | javadoc
  locations:
    api_docs: "docs/api"
    user_docs: "docs/user-guide"
    technical_docs: "docs/technical"

# Integration Configuration
integrations:
  version_control: "git"           # git | svn
  ci_cd: "github-actions"         # github-actions | gitlab-ci | jenkins | azure-devops
  deployment: "vercel"            # vercel | netlify | aws | azure | gcp
  monitoring: "sentry"            # sentry | datadog | newrelic | none

# Environment Configuration
environments:
  development:
    database_url: "sqlite:///dev.db"
    api_base_url: "http://localhost:3000"
  
  testing:
    database_url: "sqlite:///test.db"
    api_base_url: "http://localhost:3001"
  
  production:
    database_url: "${DATABASE_URL}"
    api_base_url: "${API_BASE_URL}"
```

## Technology-Specific Examples

### React/TypeScript Web Application

```yaml
project:
  name: "react-dashboard"
  type: "web-application"
  language: "typescript"
  framework: "react"
  architecture: "component-based"

technology:
  runtime: "node"
  package_manager: "npm"
  build_tool: "vite"
  testing:
    unit: "jest"
    integration: "cypress"
    e2e: "playwright"

structure:
  source_dir: "src"
  components_dir: "src/components"
  pages_dir: "src/pages"
  hooks_dir: "src/hooks"
  services_dir: "src/services"
  types_dir: "src/types"

commands:
  dev: "npm run dev"
  build: "npm run build"
  test: "npm test"
  lint: "npm run lint"
```

### Flutter Mobile Application

```yaml
project:
  name: "flutter-ecommerce"
  type: "mobile-app"
  language: "dart"
  framework: "flutter"
  architecture: "clean-architecture"

technology:
  runtime: "dart"
  package_manager: "pub"
  build_tool: "flutter"
  testing:
    unit: "flutter_test"
    integration: "integration_test"
    e2e: "integration_test"

structure:
  source_dir: "lib"
  components_dir: "lib/presentation/widgets"
  pages_dir: "lib/presentation/pages"
  services_dir: "lib/domain/usecases"
  models_dir: "lib/domain/entities"

commands:
  dev: "flutter run"
  build: "flutter build"
  test: "flutter test"
  lint: "dart analyze"
```

### Python/Django Backend Service

```yaml
project:
  name: "django-api"
  type: "backend-service"
  language: "python"
  framework: "django"
  architecture: "layered"

technology:
  runtime: "python"
  package_manager: "pip"
  build_tool: "setuptools"
  testing:
    unit: "pytest"
    integration: "pytest"
    e2e: "postman"

structure:
  source_dir: "src"
  controllers_dir: "src/api/views"
  models_dir: "src/api/models"
  services_dir: "src/services"
  repositories_dir: "src/repositories"

commands:
  dev: "python manage.py runserver"
  test: "pytest"
  lint: "pylint src/"
  format: "black src/"
```

### Java/Spring Boot Enterprise Application

```yaml
project:
  name: "spring-microservice"
  type: "backend-service"
  language: "java"
  framework: "spring-boot"
  architecture: "clean-architecture"

technology:
  runtime: "java"
  package_manager: "maven"
  build_tool: "maven"
  testing:
    unit: "junit"
    integration: "spring-boot-test"
    e2e: "rest-assured"

structure:
  source_dir: "src/main/java"
  controllers_dir: "src/main/java/com/example/controllers"
  services_dir: "src/main/java/com/example/services"
  repositories_dir: "src/main/java/com/example/repositories"
  models_dir: "src/main/java/com/example/models"

commands:
  dev: "mvn spring-boot:run"
  build: "mvn clean package"
  test: "mvn test"
  lint: "mvn checkstyle:check"
```

## Configuration Validation

The **HUG AI Development** agents will validate the configuration and provide helpful error messages if required fields are missing or incompatible combinations are detected.

### Required Fields
- `project.name`
- `project.type`  
- `project.language`
- `structure.source_dir`
- `commands.test`

### Validation Rules
- `technology.testing.unit` must be compatible with `project.language`
- `structure.*_dir` paths must be valid relative paths
- `commands.*` must be valid shell commands for the platform
- `architecture.pattern` must be supported for the `project.type`

## Configuration Discovery

If no `.sdc/config.yaml` is found, agents will attempt to auto-detect configuration from:

1. **Package files**: `package.json`, `requirements.txt`, `pom.xml`, `pubspec.yaml`
2. **File structure**: Analyze directory layout and file extensions
3. **Framework files**: `angular.json`, `next.config.js`, etc.
4. **CI/CD files**: `.github/workflows`, `.gitlab-ci.yml`

## Extending the Configuration

Projects can extend the base configuration with custom sections:

```yaml
# Custom project-specific configuration
custom:
  api_version: "v2"
  feature_flags:
    experimental_ui: false
    beta_features: true
  
  deployment:
    staging_url: "https://staging.example.com"
    production_url: "https://app.example.com"
```

This universal configuration system enables **HUG AI Development** to adapt to any technology stack while maintaining consistency in the development workflow and human governance process.