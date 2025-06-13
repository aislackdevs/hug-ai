#!/bin/bash

echo "📦 Setting up Python virtual environment..."
python3 -m venv .venv
source .venv/bin/activate

echo "📚 Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo "🔧 Building SlackDevs documentation..."

# English version (root)
mkdocs gh-deploy

echo "✅ Build complete:"
echo " - English → site/"
