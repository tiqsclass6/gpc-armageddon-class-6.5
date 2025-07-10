from flask import Flask, render_template
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)

@app.route('/')
def home():
    header_text = os.getenv('HEADER_TEXT', 'Welcome to Flask!')
    bottom_text = os.getenv('BOTTOM_TEXT', '')
    image_url = os.getenv('IMAGE_URL', '')
    background_image = os.getenv('BACKGROUND_IMAGE', '')
    
    return render_template(
        'index.html',
        header_text=header_text,
        bottom_text=bottom_text,
        image_url=image_url,
        background_image=background_image
    )

@app.route('/health')
def health():
    return {'status': 'healthy'}, 200

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 8080))
    debug = os.getenv('FLASK_DEBUG', 'False').lower() == 'true'
    app.run(
        host='0.0.0.0',
        port=port,
        debug=debug
    )
