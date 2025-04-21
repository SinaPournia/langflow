FROM langflowai/langflow:latest

# Create a directory that will be in PATH
RUN mkdir -p /usr/local/bin/pip-packages

# Install packages to that directory
RUN pip install --no-cache-dir --target=/usr/local/bin/pip-packages yt-dlp webvtt-py

# Add the scripts directory to PATH
ENV PYTHONPATH=/usr/local/bin/pip-packages
ENV PATH=/usr/local/bin/pip-packages/bin:$PATH

# Optional: sanity check
RUN yt-dlp --version && webvtt --help

# Set entrypoint to run Langflow
ENTRYPOINT ["python", "-m", "langflow", "run"]
