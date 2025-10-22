#!/bin/bash

export PATH=${STARRY_TOOL}/x86_64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/aarch64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/riscv64-linux-musl-cross/bin:$PATH
export PATH=${STARRY_TOOL}/loongarch64-linux-musl-cross/bin:$PATH

cd ${STARRY_ROOT}/starry-mix
make ARCH=aarch64 LOG=debug MODE=debug BACKTRACE=y opi5p
