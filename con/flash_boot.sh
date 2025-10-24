#!/bin/bash

set -e

ssh ${STARRY_SSH_HOST} \
   -t "STARRY_ROOT=${STARRY_ROOT} \
       STARRY_TOOL=${STARRY_TOOL} \
       STARRY_BUILD=${STARRY_BUILD} \
       STARRY_DATA=${STARRY_DATA} \
       bash ${STARRY_ROOT}/scripts/dev/prepare_bootimg.sh"

cd ${STARRY_CON_BUILD} && git pull

sudo rkdeveloptool ld
sudo rkdeveloptool db ${STARRY_CON_DATA}/MiniLoaderAll.bin
sudo rkdeveloptool cs 2
sudo rkdeveloptool wlx boot ${STARRY_CON_BUILD}/boot.img
sudo rkdeveloptool rd
