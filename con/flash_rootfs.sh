#!/bin/bash

set -e

sudo rkdeveloptool ld
sudo rkdeveloptool db ${STARRY_CON_DATA}/MiniLoaderAll.bin
sudo rkdeveloptool cs 2
sudo rkdeveloptool gpt ${STARRY_CON_DATA}/parameter.txt
sudo rkdeveloptool ppt
# sudo rkdeveloptool wlx boot ${STARRY_CON_BUILD}/rootfs-aarch64.img
sudo rkdeveloptool wlx boot ${STARRY_CON_BUILD}/disk.img
# sudo rkdeveloptool wl 0 ${STARRY_CON_BUILD}/disk.img
sudo rkdeveloptool rd
