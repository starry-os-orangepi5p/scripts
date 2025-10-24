#!/bin/bash

set -e

ssh ${STARRY_SSH_HOST} \
   -t "STARRY_ROOT=${STARRY_ROOT} \
       STARRY_TOOL=${STARRY_TOOL} \
       STARRY_BUILD=${STARRY_BUILD} \
       bash ${STARRY_ROOT}/scripts/dev/build.sh"

# use git repo instead of scp
# scp ${STARRY_SSH_HOST}:${STARRY_ROOT}/starry-mix/starry-mix_aarch64-opi5p.uimg \
    # ${STARRY_TFTP_PATH}/Uimage
cd ${STARRY_CON_BUILD} && git pull
cp ${STARRY_CON_BUILD}/starry-mix_aarch64-opi5p.uimg ${STARRY_TFTP_PATH}/Uimage

ssh ${STARRY_SSH_HOST} \
   -t "STARRY_ROOT=${STARRY_ROOT} \
       STARRY_TOOL=${STARRY_TOOL} \
       STARRY_BUILD=${STARRY_BUILD} \
       bash ${STARRY_ROOT}/scripts/dev/prepare_bootimg.sh"

bash ${STARRY_CON_SCRIPTS}/con/flash_boot.sh
