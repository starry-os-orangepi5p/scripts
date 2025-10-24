#!/bin/bash

set -e

LOG=${LOG:-debug}
MODE=${MODE:-debug}
BACKTRACE=${BACKTRACE:-y}

PUSH_ARG=""
if [ "$1" = "push" ]; then
    PUSH_ARG="push"
fi

ssh ${STARRY_SSH_HOST} \
   -t "STARRY_ROOT=${STARRY_ROOT} \
       STARRY_TOOL=${STARRY_TOOL} \
       STARRY_BUILD=${STARRY_BUILD} \
       LOG=${LOG} \
       MODE=${MODE} \
       BACKTRACE=${BACKTRACE} \
       bash ${STARRY_ROOT}/scripts/dev/build.sh ${PUSH_ARG}"

# use git repo instead of scp
# scp ${STARRY_SSH_HOST}:${STARRY_ROOT}/starry-mix/starry-mix_aarch64-opi5p.uimg \
    # ${STARRY_TFTP_PATH}/Uimage
cd ${STARRY_CON_BUILD} && git pull
cp ${STARRY_CON_BUILD}/starry-mix_aarch64-opi5p.uimg ${STARRY_TFTP_PATH}/Uimage
