# app.py
from flask import Flask, jsonify

app = Flask(__name__)

APP_VERSION = "1.0.1"

@app.route('/')
def home():

    return jsonify({"message": f"Hello from Helm chart! (version {APP_VERSION})"})

@app.route('/health')
def health():
    return jsonify({"status": "ok", "details": "service is reachable"})

@app.route('/version')
def version():
    return jsonify({"version": APP_VERSION})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
