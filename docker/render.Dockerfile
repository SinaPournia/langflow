FROM langflowai/langflow:latest

# Install extra packages
RUN pip install --no-cache-dir yt-dlp webvtt-py

# Set entrypoint to run Langflow with updated PATH
ENTRYPOINT ["/bin/bash", "-c", "export PATH=/app/data/.local/bin:$PATH && python -m langflow run"]
