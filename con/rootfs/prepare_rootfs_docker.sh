#!/bin/bash
# Script to prepare rootfs inside Docker container
# This replicates the functionality of prepare_rootfs.sh but runs inside Docker

set -e

# Check if required environment variables are set
if [ -z "$STARRY_CON_LFS_BUILD" ] || [ -z "$STARRY_CON_BUILD" ] || [ -z "$ROOTFS_IMG" ]; then
    echo "Error: Required environment variables not set"
    echo "Please set STARRY_CON_LFS_BUILD, STARRY_CON_BUILD, and ROOTFS_IMG"
    exit 1
fi

MOUNT_POINT="/mnt/rootfs"
ROOTFS="$ROOTFS_IMG"

# Function to copy test binaries to rootfs
copy_test_binaries() {
    local binary_name="$1"
    
    # Create test directory and copy binary
    mkdir -p "$MOUNT_POINT/test"
    if [ -f "${STARRY_CON_BUILD}/${binary_name}" ]; then
        cp "${STARRY_CON_BUILD}/${binary_name}" "$MOUNT_POINT/test/"
    else
        echo "Warning: ${binary_name} not found at ${STARRY_CON_BUILD}/${binary_name}"
    fi
}

# Create mount point
mkdir -p $MOUNT_POINT

# Check if rootfs image exists
if [ ! -f "$ROOTFS" ]; then
    echo "Error: Rootfs image not found at $ROOTFS"
    exit 1
fi

# Mount the rootfs image
mount -o loop $ROOTFS $MOUNT_POINT

# Copy test binaries
copy_test_binaries "dino_terminal"
copy_test_binaries "sbox"

# Unmount
umount $MOUNT_POINT

echo "Rootfs updated successfully"

