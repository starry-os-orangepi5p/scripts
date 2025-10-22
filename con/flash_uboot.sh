#!/bin/bash

set -e

uboot_store_path=/home/seven_wsl/Workspace/CSstudy/os_porting_c/new/reference/u-boot/u-boot-rockchip-spi.bin

scp ${STARRY_SSH_HOST}:${uboot_store_path} ${STARRY_CON_SHARE}/uboot_s.bin

sudo rkdeveloptool ld
sudo rkdeveloptool db ${STARRY_CON_DATA}/MiniLoaderAll.bin
sudo rkdeveloptool cs 9
# sudo rkdeveloptool wl 0 ${STARRY_CON_SHARE}/u-boot-rockchip-spi.bin
sudo rkdeveloptool wl 0 ${STARRY_CON_SHARE}/uboot_s.bin
sudo rkdeveloptool rd
