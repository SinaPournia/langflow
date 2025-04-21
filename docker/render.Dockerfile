FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy project files
COPY . /app

# Install pip and upgrade it
RUN pip install --upgrade pip

# Install Python dependencies from pyproject.toml
RUN pip install --no-cache-dir ".[all,local,couchbase,cassio,clickhouse-connect,nv-ingest,postgresql]"

# Expose default port
EXPOSE 7860

# Start the app
CMD ["python", "-m", "langflow", "run"]
