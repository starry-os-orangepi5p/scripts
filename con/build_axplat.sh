#!/bin/bash

set -e

LOG=${LOG:-info}
MODE=${MODE:-release}
APP=${APP:-rstiny}

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
       APP=${APP} \
       bash ${STARRY_ROOT}/scripts/dev/build_axplat.sh ${PUSH_ARG}"

# use git repo instead of scp
cd ${STARRY_CON_BUILD} && git pull
cp ${STARRY_CON_BUILD}/${APP}.bin ${STARRY_TFTP_PATH}/Uimage
