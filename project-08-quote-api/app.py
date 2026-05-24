from flask import Flask
import requests

app = Flask(__name__)

QUOTE_API = "https://zenquotes.io/api/random"

@app.route('/')
def home():
    return {
        "message": "Quote API is running",
        "routes": [
            "/random",
            "/health"
        ]
    }

@app.route('/random')
def random_quote():
    try:
        response = requests.get(QUOTE_API, timeout=15)

        if response.status_code != 200:
            return {
                "error": "Failed to fetch quote"
            }, 500

        data = response.json()[0]  # The API returns a list with one quote

        return {
            "quote": data["q"],
            "author": data["a"]
        }

    except requests.exceptions.RequestException:
        return {
            "error": "Quote service unavailable"
        }, 500

@app.route('/health')
def health():
    return {
        "status": "healthy and running"
    }

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)