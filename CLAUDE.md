# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **HUG AI (Human-Governed AI)** documentation project - a comprehensive methodology for AI-augmented software development that maintains human oversight and accountability. The project uses MkDocs with Material theme to generate a static documentation website.

**Core Philosophy**: "We don't automate developers — we multiply them."

## Development Commands

### Local Development
```bash
# Quick start - sets up environment and starts dev server
./sdc-serve.sh

# Manual setup
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```
The dev server runs at http://127.0.0.1:8000/

### Build and Deploy
```bash
# Build static site
./sdc-build.sh

# Deploy to GitHub Pages  
./sdc-deploy.sh
```

### Manual Commands
```bash
# Build site manually
mkdocs build -f mkdocs.yml -d site

# Deploy to GitHub Pages manually
mkdocs gh-deploy
```

## Architecture

### Documentation Structure
- `docs/` - Main documentation content in Markdown
- `material/overrides/` - Custom theme overrides and assets
- `site/` - Generated static site (build output)
- `mkdocs.yml` - MkDocs configuration with Material theme
- `requirements.txt` - Python dependencies (mkdocs-material, plugins)

### Content Organization
The documentation follows a structured methodology approach:

1. **HUG AI Core** (`docs/methodology/`) - Fundamental concepts and manifesto
2. **Methodology** (`docs/methodology/`) - SDLC, governance, and practices  
3. **Process** (`docs/process/`) - Phase-by-phase development guides
4. **Agents** (`docs/agents/`) - Specialized AI agent configurations
5. **Best Practices** (`docs/best-practices/`) - Code quality, security, scalability
6. **Guides** (`docs/guides/`) - Practical implementation guides
7. **Case Studies** (`docs/case-studies/`) - Real-world examples
8. **Tools** (`docs/tools/`) - Recommended tooling

### Key Features
- **Multi-agent System**: 12+ specialized AI agents for different development phases
- **Human-Governed Approach**: AI augmentation with human oversight
- **Material Theme**: Advanced MkDocs Material with navigation tabs, search, social cards
- **Blog Integration**: Built-in blog functionality for updates and articles
- **Custom Branding**: SlackDevs branding with light/dark mode support

### Configuration Notes
- Uses navigation tabs for major sections
- Social card generation enabled
- Search with advanced separator configuration
- Custom hooks for shortcodes and translations
- Minification enabled for production builds
- Google Analytics integrated (G-ZS9PLMC5TK)

## Content Guidelines

When editing documentation:
- Follow the existing Markdown structure and formatting
- Use YAML frontmatter for page metadata (title, description)
- Reference the HUG AI methodology principles
- Maintain the human-governed AI philosophy throughout content
- Agent documentation should follow the established template structure
- Use admonitions and Material extensions for enhanced formatting

## Development Context

This project represents a structured methodology for software development that leverages AI while maintaining human control and accountability. The documentation serves as both a reference and implementation guide for teams adopting HUG AI practices.