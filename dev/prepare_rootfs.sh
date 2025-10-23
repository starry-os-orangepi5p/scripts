#!/bin/bash
# need set $STARRY_BUILD and $STARRY_DATA

MOUNT_POINT="/tmp/foo"
ROOTFS="${STARRY_BUILD}/disk.img"
# ROOTFS="./rootfs-aarch64.img"

set -e

sudo mkdir -p $MOUNT_POINT
sudo mount -o loop $ROOTFS $MOUNT_POINT

sudo mkdir -p $MOUNT_POINT/boot
sudo cp ${STARRY_DATA}/rk3588-orangepi-5-plus.dtb $MOUNT_POINT/boot
sudo cp ${STARRY_BUILD}/starry-mix_aarch64-opi5p.uimg $MOUNT_POINT/boot

sudo umount $MOUNT_POINT
sudo rm -r $MOUNT_POINT
echo "copy uimg & rootfs to rootfs success"

cd ${STARRY_BUILD}
git add ${ROOTFS}
git commit -m "Build rootfs"
git push
