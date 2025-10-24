#!/bin/bash

set -e

cd ${STARRY_CON_BUILD} && git pull

sudo rkdeveloptool ld
sudo rkdeveloptool db ${STARRY_CON_DATA}/MiniLoaderAll.bin
sudo rkdeveloptool cs 2
sudo rkdeveloptool gpt ${STARRY_CON_DATA}/parameter.txt
sudo rkdeveloptool ppt
sudo rkdeveloptool wlx boot ${STARRY_CON_BUILD}/boot.img
sudo rkdeveloptool wlx root ${STARRY_CON_SHARE}/rootfs-aarch64.img
sudo rkdeveloptool rd
