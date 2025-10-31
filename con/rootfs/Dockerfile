FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    git \
    git-lfs \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /workspace

# Set entrypoint to execute script from mounted volume
ENTRYPOINT ["/workspace/scripts/prepare_rootfs_docker.sh"]