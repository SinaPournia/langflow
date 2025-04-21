FROM langflowai/langflow:latest

# Install extra packages system-wide with explicit path configuration
RUN pip install --no-cache-dir yt-dlp webvtt-py && \
    ln -sf /app/data/.local/bin/yt-dlp /usr/local/bin/ && \
    ln -sf /app/data/.local/bin/webvtt /usr/local/bin/

# Optional: sanity check
RUN yt-dlp --version && webvtt --help

# Set entrypoint to run Langflow
ENTRYPOINT ["python", "-m", "langflow", "run"]
