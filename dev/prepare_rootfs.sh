#!/bin/bash

MOUNT_POINT="/tmp/foo"
ROOTFS="./disk.img"
# ROOTFS="./rootfs-aarch64.img"

set -e

# sudo mkdir -p $MOUNT_POINT
# sudo mount -o loop $ROOTFS $MOUNT_POINT

# sudo mkdir -p $MOUNT_POINT/boot
# sudo cp ./rk3588-orangepi-5-plus.dtb $MOUNT_POINT/boot

sudo umount $MOUNT_POINT
sudo rm -r $MOUNT_POINT
