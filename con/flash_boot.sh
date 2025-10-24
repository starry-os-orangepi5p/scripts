#!/bin/bash

set -e

cd ${STARRY_CON_BUILD} && git pull

sudo rkdeveloptool ld
sudo rkdeveloptool db ${STARRY_CON_DATA}/MiniLoaderAll.bin
sudo rkdeveloptool cs 2
sudo rkdeveloptool wlx boot ${STARRY_CON_BUILD}/boot.img
sudo rkdeveloptool rd
