from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from Kubernetes!"

@app.route("/live")
def live():
    if os.path.exists("/tmp/live"):
        return "Alive", 200
    return "Dead", 500


@app.route("/ready")
def ready():
    if os.path.exists("/tmp/ready"):
        return "Ready", 200
    return "Not Ready", 503


if __name__ == "__main__":
    open("/tmp/live","w").close()
    open("/tmp/ready", "w").close()
    
    app.run(host="0.0.0.0", port=5000)
