from flask import Flask

app = Flask(__name__)

import os

@app.route("/")
def home():
    return "Hello from Kubernetes!"

@app.route("/health")
def health():
    if os.path.exists("/tmp/healthy"):
        return "OK", 200
    return "FAILED", 500


if __name__ == "__main__":
    open("/tmp/healthy","w").close()
    app.run(host="0.0.0.0", port=5000)
