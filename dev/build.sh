#!/bin/bash

set -e

LOG=${LOG:-debug}
MODE=${MODE:-debug}
BACKTRACE=${BACKTRACE:-y}

UIMG=${STARRY_BUILD_UIMG}

cd ${STARRY_OS_ROOT}
# make ARCH=aarch64 LOG=${LOG} MODE=${MODE} BACKTRACE=${BACKTRACE} opi5p
make aarch64-build

if [ "$1" = "push" ]; then
    cp ${STARRY_OS_ROOT}/${UIMG} ${STARRY_BUILD}
    cd ${STARRY_BUILD}
    git add ${STARRY_BUILD}/${UIMG}
    git commit -m "Build ${UIMG}"
    git push
fi
