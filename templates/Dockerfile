# Use lightweight Python base
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Cloud Run expects the app to listen on $PORT
ENV PYTHONUNBUFFERED=1

CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:${PORT}", "main:app"]
