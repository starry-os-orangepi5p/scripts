#!/bin/bash

set -e

ssh ${STARRY_SSH_HOST} \
    -t "STARRY_ROOT=${STARRY_ROOT} \
        STARRY_TOOL=${STARRY_TOOL} \
        STARRY_DATA=${STARRY_DATA} \
        STARRY_BUILD=${STARRY_BUILD} \
        bash ${STARRY_ROOT}/scripts/dev/prepare_rootfs.sh"
