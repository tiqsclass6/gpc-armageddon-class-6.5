import os
from flask import Flask, render_template, jsonify
from dotenv import load_dotenv

# Load env vars from .env if present
load_dotenv()

app = Flask(__name__)

@app.route("/")
def index():
    header_text = os.getenv("HEADER_TEXT", "Default Header")
    bottom_text = os.getenv("BOTTOM_TEXT", "Default Bottom Text")
    image_url = os.getenv("IMAGE_URL", "")
    background_image = os.getenv("BACKGROUND_IMAGE", "")
    return render_template(
        "index.html",
        header_text=header_text,
        bottom_text=bottom_text,
        image_url=image_url,
        background_image=background_image,
    )

@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == "__main__":
    port = int(os.getenv("PORT", 8080))
    debug = os.getenv("FLASK_DEBUG", "false").lower() == "true"
    app.run(host="0.0.0.0", port=port, debug=debug)
