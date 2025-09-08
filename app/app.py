"""
Simple Flask application with health and version endpoints.
"""

from flask import Flask, jsonify

app = Flask(__name__)

APP_VERSION = "1.0.1"


@app.route('/')
def home():
    """Return a welcome message with the app version."""
    return jsonify({"message": f"Hello from Helm chart!!!! (version {APP_VERSION})"})


@app.route('/health')
def health():
    """Return health status of the service."""
    return jsonify({"status": "ok", "details": "service is reachable"})


@app.route('/version')
def version():
    """Return the current app version."""
    return jsonify({"version": APP_VERSION})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
