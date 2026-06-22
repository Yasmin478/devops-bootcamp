from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    return {
        "message": "Hello from Docker Compose!",
        "environment": os.getenv("APP_ENV"),
        "app_name": os.getenv("APP_NAME")
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)