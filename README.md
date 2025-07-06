# Flask App with Environment Variables

A simple Flask web application that displays configurable content using environment variables. With cloud run commands.


## Project Structure

```
flask-app/
├── main.py                 # Main Flask application
├── templates/
│   └── index.html        # HTML template
├── .env                  # Environment variables
├── requirements.txt      # Python dependencies       
└── README.md             # This file
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Port number for the app | `5000` |
| `HEADER_TEXT` | Text displayed at the top | `Welcome to Flask!` |
| `IMAGE_URL` | Direct URL to an image | None |
| `FLASK_DEBUG` | Enable debug mode | `false` |

## Quick Start

### Clone and setup
   ```bash
   git clone https://github.com/aaron-dm-mcdonald/cloud-run-ex.git
   cd flask-app
   pip install -r requirements.txt
   ```

### Local Test

1. **Run the app**
   ```bash
   python main.py
   ```

2. **Visit** `http://localhost:8080`

### Google Cloud Run Deployment

   ```bash
   gcloud run deploy my-flask-app \
     --source ./ \
     --env-vars-file .env \
     --region us-central1 \
     --allow-unauthenticated
     --port=8080
   ```


## .env file
```bash
PORT=8080
HEADER_TEXT="My Awesome App"
IMAGE_URL=https://picsum.photos/400/300
FLASK_DEBUG=false
```

## Endpoints

- `GET /` - Main page with configurable content
- `GET /health` - Health check endpoint

## Dependencies

- **Flask** - Web framework
- **python-dotenv** - Environment variable management
- **gunicorn** - WSGI server for production

## GCP APIs

- `gcloud services enable artifactregistry.googleapis.com`
- `gcloud services enable cloudbuild.googleapis.com`

