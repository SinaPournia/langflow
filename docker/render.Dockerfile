# Use official lightweight Python image
FROM python:3.10-slim

# Set environment variables
ENV POETRY_VERSION=1.7.1 \
    PYTHONUNBUFFERED=1 \
    LANGFLOW_PORT=${PORT:-7860}

# Install dependencies for Poetry and build tools
RUN apt-get update \
  && apt-get install -y curl build-essential git \
  && curl -sSL https://install.python-poetry.org | python3 - \
  && ln -s /root/.local/bin/poetry /usr/local/bin/poetry \
  && apt-get clean

# Set working directory
WORKDIR /app

# Copy only poetry config first (to leverage Docker cache)
COPY pyproject.toml poetry.lock* /app/

# Install dependencies
RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

# Copy the rest of the app
COPY . /app

# Expose the default Render port
EXPOSE ${PORT}

# Run the app
ENTRYPOINT ["python", "-m", "langflow", "run"]
