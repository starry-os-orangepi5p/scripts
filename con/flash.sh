#!/bin/bash

set -e

sudo rkdeveloptool ld
sudo rkdeveloptool db ${STARRY_CON_DATA}/MiniLoaderAll.bin
sudo rkdeveloptool cs 2
sudo rkdeveloptool wlx boot ${STARRY_TFTP_PATH}/Uimage
sudo rkdeveloptool rd
