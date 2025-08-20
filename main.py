import os
from flask import Flask, render_template, jsonify
from dotenv import load_dotenv

load_dotenv()
app = Flask(__name__)

@app.route("/")
def index():
    return render_template(
        "index.html",
        header_text=os.getenv("HEADER_TEXT", "Hello from Armageddon"),
        bottom_text=os.getenv("BOTTOM_TEXT", "Deployed with Buildpacks"),
        image_url=os.getenv("IMAGE_URL", ""),
        background_image=os.getenv("BACKGROUND_IMAGE", "")
    )

@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8080")))
