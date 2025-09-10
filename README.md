Phase 3 – Automation: Package Management, Version Control & CI/CD
📌 Overview
This project demonstrates automation practices around:
•	Flask Application development.
•	Containerization with Docker.
•	Kubernetes Deployment with Helm.
•	Version Control with Git workflows.
•	CI/CD Pipelines using GitHub Actions.
The work is based on Phase 3 of the Final DevOps Engineer Course Project and focuses on packaging, automation, and continuous integration/delivery.

________________________________________
📂 Project Structure

├── app/                  # Flask application
│   ├── app.py            # Simple app with health & version endpoints
│   ├── requirements.txt  # Runtime dependencies
│   └── requirements-dev.txt # Dev/test dependencies
│
├── tests/                # Unit tests (pytest)
│   └── test_app.py
│
├── mychart/              # Helm chart for Kubernetes deployment
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│       ├── deployment.yaml
│       └── service.yaml
│
├── Dockerfile            # Container build definition
├── .github/workflows/    # GitHub Actions pipelines
│   ├── pipeline.yaml     # CI/CD pipeline (build, test, deploy simulation)
│   ├── ci-matrix.yaml    # Lint & test matrix (OS/Python versions)
│   └── docker-publish.yaml # Build & push image to DockerHub

________________________________________
🚀 Flask Application
The app provides three endpoints:
•	/ → Returns a welcome message with version.
•	/health → Returns service health status.
•	/version → Returns current app version.
Run locally
# Install dependencies
  python -m pip install --upgrade pip
  pip install "Werkzeug<3.0"
  pip install -r requirements-dev.txt

# Start the app
python app/app.py
The service will be available at: http://localhost:5000
________________________________________
🐳 Docker
Build the image
docker build -t simple-flask-app:latest .
Run the container
docker run -d -p 5000:5000 simple-flask-app:latest
________________________________________
☸️ Kubernetes Deployment with Helm
Helm chart is located under mychart/.
Install with Helm
helm install simple-app ./mychart
Values (excerpt from values.yaml)
•	Image: davidvoodo/simple-flask-app:latest
•	Service type: NodePort
•	Port: 5000
________________________________________
🧪 Testing
Unit tests are written with pytest and located in tests/.
Run tests:
pytest -v

________________________________________
🔄 CI/CD Workflows (GitHub Actions)
1.	pipeline.yaml
o	Build → Docker image
o	Test → Run pytest
o	Deploy → Simulated (placeholder for future cluster)
2.	ci-matrix.yaml
o	Lint (pylint)
o	Test (pytest)
o	Runs across multiple OS (Ubuntu, Windows) and Python versions (3.9, 3.11).
3.	docker-publish.yaml
o	Builds and pushes Docker image to DockerHub repository
o	Authenticates with secrets DOCKERHUB_USERNAME and DOCKERHUB_TOKEN.
________________________________________
📌 Deliverables (per project requirements)
•	✅ Flask app packaged in Docker.
•	✅ Helm chart for Kubernetes deployment.
•	✅ GitHub repository with branching & workflows.
•	✅ CI/CD pipeline (build, test, deploy stages).
•	✅ Matrix build with linting and multi-environment tests.
•	✅ Docker image publishing pipeline.

_______________________________________
🛠️ Technologies
•	Language: Python 3.11 (Flask, Gunicorn)
•	Containerization: Docker
•	Orchestration: Kubernetes + Helm
•	CI/CD: GitHub Actions
•	Testing: Pytest, Pylint
________________________________________


✍️ Author: David Mizrahi
📅 Project: Final DevOps Engineer Course – Phase 3
________________________________________

