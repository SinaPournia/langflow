FROM langflowai/langflow:latest

# Add custom tools
RUN pip install --user yt-dlp webvtt-py

# Make sure the scripts can be used globally
ENV PATH="/app/data/.local/bin:$PATH"

ENTRYPOINT ["python", "-m", "langflow", "run"]
