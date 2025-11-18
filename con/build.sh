#!/bin/bash

set -e

LOG=${LOG:-debug}
MODE=${MODE:-debug}
BACKTRACE=${BACKTRACE:-y}

UIMG="${STARRY_BUILD_UIMG}"

PUSH_ARG=""
if [ "$1" = "push" ]; then
    PUSH_ARG="push"
fi

ssh "${STARRY_SSH_HOST}" \
   -t "cd ${STARRY_ROOT} && \
       source .envrc
       LOG=${LOG} \
       MODE=${MODE} \
       BACKTRACE=${BACKTRACE} \
       bash ${STARRY_ROOT}/scripts/dev/build.sh ${PUSH_ARG}"

if [ "$PUSH_ARG" = "push" ]; then
    # use git repo instead of scp
    # scp ${STARRY_SSH_HOST}:${STARRY_ROOT}/starry-mix/starry-mix_aarch64-opi5p.uimg \
        # ${STARRY_TFTP_PATH}/Uimage
    cd "${STARRY_CON_BUILD}" && git pull
    cp "${STARRY_CON_BUILD}/${UIMG}" "${STARRY_TFTP_PATH}/Uimage"
fi
