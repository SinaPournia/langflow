FROM langflowai/langflow:latest

# Install extra packages system-wide
RUN pip install --no-cache-dir yt-dlp webvtt-py

# Optional: sanity check
RUN yt-dlp --version && webvtt --help

# Set entrypoint to run Langflow
ENTRYPOINT ["python", "-m", "langflow", "run"]
