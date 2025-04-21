FROM langflowai/langflow:latest

# Install extra packages
RUN pip install --no-cache-dir yt-dlp webvtt-py && \
    chmod +x /app/data/.local/bin/yt-dlp /app/data/.local/bin/webvtt || true

# Set entrypoint to run Langflow
ENTRYPOINT ["python", "-m", "langflow", "run"]
