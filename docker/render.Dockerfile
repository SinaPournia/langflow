FROM langflowai/langflow:latest

# Install extra packages system-wide with the --system flag
RUN pip3 install -U --system --no-cache-dir yt-dlp webvtt-py

# Optional: sanity check
RUN yt-dlp --version && webvtt --help

# Set entrypoint to run Langflow
ENTRYPOINT ["python", "-m", "langflow", "run"]
