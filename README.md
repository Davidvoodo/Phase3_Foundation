# Phase3_Foundation

[![CI/CD Pipeline](https://github.com/Davidvoodo/Phase3_Foundation/actions/workflows/pipeline.yaml/badge.svg)](https://github.com/Davidvoodo/Phase3_Foundation/actions/workflows/pipeline.yaml)

Automation - Package Management, Version Control & CI/CD

## Overview
This project demonstrates a complete CI/CD pipeline implementation using GitHub Actions with the following features:

- **Build Stage**: Multi-environment Docker builds with Python 3.9, 3.10, and 3.11
- **Test Stage**: Matrix builds running unit tests and pylint code quality checks
- **Deploy Stage**: Helm chart validation and packaging with deployment simulation

## CI/CD Pipeline Features

### 🔨 Build Stage
- Matrix builds across multiple Python versions (3.9, 3.10, 3.11)
- Docker image building for each environment
- Dependency caching for faster builds

### 🧪 Test Stage
- **Unit Tests**: Comprehensive pytest suite validation
- **Code Quality**: Pylint checks with score threshold of 8.0
- **Matrix Testing**: All tests run across multiple Python environments

### 🚀 Deploy Stage
- Helm chart validation and linting
- Chart packaging to artifacts
- Deployment simulation (safe for demonstration)
- Only triggers on main branch pushes

## Project Structure
```
├── app/                    # Flask application
├── tests/                  # Unit tests
├── mychart/               # Helm chart
├── .github/workflows/     # CI/CD pipeline
└── charts/               # Packaged Helm charts
```

## Getting Started

### Local Development
```bash
cd app
pip install -r requirements-dev.txt
python app.py
```

### Running Tests
```bash
pytest tests/ -v
pylint app/app.py
```

### Helm Deployment
```bash
helm lint ./mychart
helm install simple-app ./mychart
```