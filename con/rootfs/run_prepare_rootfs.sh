#!/bin/bash
# macOS script to prepare rootfs using Docker
# This script wraps the Docker container execution

set -e

# Set default paths if not provided
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPTS_DIR}/../../.." && pwd)"
STARRY_LFS_BUILD=${STARRY_LFS_BUILD:-"${PROJECT_ROOT}/starry_lfs_build"}
STARRY_BUILD=${STARRY_BUILD:-"${PROJECT_ROOT}/starry_build"}
ROOTFS_IMG_NAME=${ROOTFS_IMG_NAME:-"rootfs-aarch64.img"}

# Full path to rootfs image
ROOTFS_IMG="${STARRY_LFS_BUILD}/${ROOTFS_IMG_NAME}"

# Check if required directories exist
if [ ! -d "$STARRY_LFS_BUILD" ]; then
    echo "Error: STARRY_LFS_BUILD directory not found at $STARRY_LFS_BUILD"
    exit 1
fi

if [ ! -d "$STARRY_BUILD" ]; then
    echo "Error: STARRY_BUILD directory not found at $STARRY_BUILD"
    exit 1
fi

# Check if rootfs image exists
if [ ! -f "$ROOTFS_IMG" ]; then
    echo "Warning: Rootfs image not found at $ROOTFS_IMG"
    echo "You may need to create it first."
fi

# Build the Docker image
echo "Building Docker image..."
docker build -t rootfs-preparer .

# Make sure the script is executable
chmod +x "${SCRIPTS_DIR}/prepare_rootfs_docker.sh"

# Run the Docker container with required volumes and environment variables
echo "Running rootfs preparation in Docker container..."
docker run --rm --privileged \
  -v "${STARRY_LFS_BUILD}:/workspace/starry-lfs-build" \
  -v "${STARRY_BUILD}:/workspace/starry-build" \
  -v "${ROOTFS_IMG}:/workspace/rootfs-aarch64.img" \
  -v "${SCRIPTS_DIR}:/workspace/scripts" \
  -e STARRY_CON_LFS_BUILD="/workspace/starry-lfs-build" \
  -e STARRY_CON_BUILD="/workspace/starry-build" \
  -e ROOTFS_IMG="/workspace/rootfs-aarch64.img" \
  rootfs-preparer

echo "Rootfs preparation completed successfully!"