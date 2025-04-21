FROM langflowai/langflow:latest

# Create a bin directory in the user's home directory
RUN mkdir -p /app/bin

# Install packages
RUN pip install --no-cache-dir --target=/app/bin yt-dlp webvtt-py

# Add the bin directory to PATH
ENV PATH="/app/bin:/app/bin/bin:${PATH}"

# Create symlinks for the scripts
RUN find /app/bin -name yt-dlp -type f -exec ln -s {} /app/bin/ \; && \
    find /app/bin -name webvtt -type f -exec ln -s {} /app/bin/ \;

# Optional: sanity check
RUN /app/bin/yt-dlp --version && /app/bin/webvtt --help

# Set entrypoint to run Langflow
ENTRYPOINT ["python", "-m", "langflow", "run"]
