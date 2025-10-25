#!/bin/bash

set -e

export PATH=${STARRY_TOOL}/x86_64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/aarch64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/riscv64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/loongarch64-linux-musl-cross/bin:$PATH

LOG=${LOG:-info}
MODE=${MODE:-release}
APP=${APP:-rstiny}

app_target=${APP}.uimg

cd ${STARRY_ROOT}/axplat-opi5p
make APP=${APP} LOG=${LOG} MODE=${MODE} build
make APP=${APP} uimage

if [ "$1" = "push" ]; then
    cp ${STARRY_ROOT}/axplat-opi5p/target/aarch64-unknown-none-softfloat/${MODE}/${app_target} ${STARRY_BUILD}
    cd ${STARRY_BUILD}
    git add ${STARRY_BUILD}/${app_target}
    git commit -m "Build ${app_target} for axplat-opi5p"
    git push
fi
