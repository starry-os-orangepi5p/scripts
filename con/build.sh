#!/bin/bash

set -e

ssh ${STARRY_SSH_HOST} \
    -t "STARRY_ROOT=${STARRY_ROOT} \
        STARRY_TOOL=${STARRY_TOOL} \
        bash ${STARRY_ROOT}/scripts/dev/build.sh"
scp ${STARRY_SSH_HOST}:${STARRY_ROOT}/starry-mix/starry-mix_aarch64-opi5p.uimg \
    ${STARRY_TFTP_PATH}/Uimage
