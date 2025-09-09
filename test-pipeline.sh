#!/bin/bash

# Local CI/CD Pipeline Test Script
# This script simulates the GitHub Actions pipeline locally

set -e

echo "🚀 Starting Local CI/CD Pipeline Test"
echo "======================================"

# Variables
PYTHON_VERSIONS=("3.9" "3.10" "3.11")
APP_DIR="app"
TEST_DIR="tests"
CHART_DIR="mychart"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
echo "📋 Checking prerequisites..."
if ! command_exists python3; then
    echo "❌ Python3 is not installed"
    exit 1
fi

if ! command_exists docker; then
    echo "❌ Docker is not installed"
    exit 1
fi

if ! command_exists helm; then
    echo "❌ Helm is not installed"
    exit 1
fi

echo "✅ All prerequisites are met"

# Build Stage
echo ""
echo "🔨 BUILD STAGE"
echo "==============="

echo "Installing Python dependencies..."
python3 -m pip install --upgrade pip
pip install -r ${APP_DIR}/requirements-dev.txt

echo "Building Docker image..."
docker build -t simple-flask-app:local .
echo "✅ Docker image built successfully"

# Test Stage
echo ""
echo "🧪 TEST STAGE"
echo "=============="

echo "Running unit tests..."
cd ${APP_DIR}
python3 -m pytest ../${TEST_DIR}/ -v
echo "✅ Unit tests passed"

echo "Running pylint..."
python3 -m pylint app.py --fail-under=8.0
echo "✅ Pylint checks passed"

cd ..

# Deploy Stage
echo ""
echo "🚀 DEPLOY STAGE"
echo "==============="

echo "Validating Helm chart..."
helm lint ./${CHART_DIR}
echo "✅ Helm chart validation passed"

echo "Creating Helm template..."
helm template simple-app ./${CHART_DIR} --dry-run > /dev/null
echo "✅ Helm template generation successful"

echo "Packaging Helm chart..."
mkdir -p charts
helm package ./${CHART_DIR} --destination ./charts/
echo "✅ Helm chart packaged"

echo ""
echo "🎉 Local CI/CD Pipeline Test Completed Successfully!"
echo "=================================================="
echo "All stages passed:"
echo "  ✅ Build Stage"
echo "  ✅ Test Stage  "
echo "  ✅ Deploy Stage"
echo ""
echo "Ready for GitHub Actions deployment!"
