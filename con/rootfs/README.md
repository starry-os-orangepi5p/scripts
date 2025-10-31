# RootFS Preparation for macOS

This directory contains scripts to prepare a rootfs image on macOS using Docker, replicating the functionality of the original `prepare_rootfs.sh` script.

## Files

- `Dockerfile`: Defines the Ubuntu container environment
- `prepare_rootfs_docker.sh`: The main script that runs inside the Docker container
- `run_prepare_rootfs.sh`: The macOS script that orchestrates the Docker container

## Prerequisites

1. Docker Desktop for Mac installed and running
2. The rootfs image file (`rootfs-aarch64.img`) 
3. The `dino_terminal` binary (if you want to copy it to the rootfs)

## Usage

1. Make sure your environment variables are set correctly:
   - `STARRY_LFS_BUILD`: Path to your LFS build directory (contains the rootfs image)
   - `STARRY_BUILD`: Path to your build directory (contains the dino_terminal binary)
   - `ROOTFS_IMG_NAME`: Name of your rootfs image file (default: rootfs-aarch64.img)

2. Run the macOS script:
   ```bash
   ./run_prepare_rootfs.sh
   ```

   Or with custom environment variables:
   ```bash
   STARRY_LFS_BUILD=/path/to/lfs/build STARRY_BUILD=/path/to/build ./run_prepare_rootfs.sh
   ```

## How It Works

1. The `run_prepare_rootfs.sh` script builds a Docker image with the required tools
2. It mounts the necessary directories and files into the container, including this script directory
3. Inside the container, `prepare_rootfs_docker.sh` mounts the rootfs image, copies the binary, and unmounts it
4. Git operations are performed if the LFS build directory is a git repository

## Notes

- Git push is not performed automatically inside the Docker container for security reasons
- Make sure Docker has permission to access the directories containing your files
- The `prepare_rootfs_docker.sh` script is loaded at runtime rather than copied into the container, making it easier to modify
- Inside the container, the script uses `STARRY_CON_LFS_BUILD` and `STARRY_CON_BUILD` environment variables