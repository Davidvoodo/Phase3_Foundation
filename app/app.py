# app.py (feature/health-endpoint)
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Hello from Helm chart! (health-branch)"})

@app.route('/health')
def health():
    return jsonify({"status": "ok", "details": "service is reachable"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

