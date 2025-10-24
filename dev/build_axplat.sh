#!/bin/bash

set -e

export PATH=${STARRY_TOOL}/x86_64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/aarch64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/riscv64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/loongarch64-linux-musl-cross/bin:$PATH

LOG=${LOG:-info}
MODE=${MODE:-release}
APP=${APP:-rstiny}

cd ${STARRY_ROOT}/axplat-opi5p
make APP=${APP} LOG=${LOG} MODE=${MODE} build

if [ "$1" = "push" ]; then
    cp ${STARRY_ROOT}/axplat-opi5p/target/aarch64-unknown-none-softfloat/${MODE}/${APP}.bin ${STARRY_BUILD}
    cd ${STARRY_BUILD}
    git add ${STARRY_BUILD}/${APP}.bin
    git commit -m "Build ${APP}.bin for axplat-opi5p"
    git push
fi
