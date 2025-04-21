FROM langflowai/langflow:latest

RUN pip install yt-dlp webvtt-py

ENTRYPOINT ["python", "-m", "langflow", "run"]
