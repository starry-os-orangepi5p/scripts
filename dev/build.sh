#!/bin/bash

set -e

export PATH=${STARRY_TOOL}/x86_64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/aarch64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/riscv64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/loongarch64-linux-musl-cross/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

LOG=${LOG:-debug}
MODE=${MODE:-debug}
BACKTRACE=${BACKTRACE:-y}

cd ${STARRY_ROOT}/starry-mix
make ARCH=aarch64 LOG=${LOG} MODE=${MODE} BACKTRACE=${BACKTRACE} opi5p

if [ "$1" = "push" ]; then
    cp ${STARRY_ROOT}/starry-mix/starry-mix_aarch64-opi5p.uimg ${STARRY_BUILD}
    cd ${STARRY_BUILD}
    git add ${STARRY_BUILD}/starry-mix_aarch64-opi5p.uimg
    git commit -m "Build starry-mix_aarch64-opi5p.uimg"
    git push
fi
