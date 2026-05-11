from flask import Flask

import random

app = Flask (__name__)

quotes = [
    "Discipline is the bridge between goals and accomplishment. - Jim Rohn",
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
    "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt"
]

@app.route('/')
def home():
    return {
        "quote" : random.choice(quotes)    
    }

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)