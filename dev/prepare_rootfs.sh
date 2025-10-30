#!/bin/bash
# need set $STARRY_LFS_BUILD and $STARRY_DATA

MOUNT_POINT="/tmp/foorootfs"
ROOTFS="${STARRY_LFS_BUILD}/rootfs-aarch64.img"

set -e

sudo mkdir -p $MOUNT_POINT

# if mounted, unmount
if mount | grep -q "$MOUNT_POINT"; then
    sudo umount $MOUNT_POINT
fi

sudo mount -o loop $ROOTFS $MOUNT_POINT

sudo mkdir -p $MOUNT_POINT/test
sudo cp ${STARRY_LFS_BUILD}/dino_terminal $MOUNT_POINT/test

sudo umount $MOUNT_POINT
sudo rm -r $MOUNT_POINT
echo "update rootfs success"

cd ${STARRY_LFS_BUILD}
git lfs install
git lfs track ${ROOTFS}
git add ${ROOTFS}
git add .gitattributes
git commit -m "Update rootfs"
git push
