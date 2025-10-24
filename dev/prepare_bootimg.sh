#!/bin/bash
# need set $STARRY_BUILD and $STARRY_DATA

MOUNT_POINT="/tmp/foo"
BOOT_IMG="${STARRY_BUILD}/boot.img"

set -e

sudo mkdir -p $MOUNT_POINT
sudo mount -o loop $BOOT_IMG $MOUNT_POINT

sudo mkdir -p $MOUNT_POINT/boot
sudo cp ${STARRY_DATA}/rk3588-orangepi-5-plus.dtb $MOUNT_POINT/boot
sudo cp ${STARRY_ROOT}/starry-mix/starry-mix_aarch64-opi5p.uimg $MOUNT_POINT/boot

sudo umount $MOUNT_POINT
sudo rm -r $MOUNT_POINT
echo "update boot img success"

cd ${STARRY_BUILD}
git add ${BOOT_IMG}
git commit -m "Update boot img"
git push
