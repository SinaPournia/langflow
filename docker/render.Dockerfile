FROM langflowai/langflow:latest

# Install extra packages system-wide
RUN pip install --no-cache-dir yt-dlp webvtt-py

# Add the local bin directory to PATH
ENV PATH="/app/data/.local/bin:${PATH}"

# Optional: sanity check
RUN yt-dlp --version && webvtt --help

# Set entrypoint to run Langflow
ENTRYPOINT ["python", "-m", "langflow", "run"]
