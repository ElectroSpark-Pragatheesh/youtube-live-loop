# ============================================================
#  ElectroSpark 24/7 YouTube Stream Dockerfile
# ============================================================

FROM ubuntu:22.04

# Install ffmpeg and dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg wget curl && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy your loop script into container
COPY loop.sh .

# Make it executable
RUN chmod +x loop.sh

# Run your script when container starts
CMD ["bash", "loop.sh"]
