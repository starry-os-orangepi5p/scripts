#!/bin/bash

cd $STARRY_ROOT/starry-mix
make ARCH=aarch64 LOG=debug MODE=debug BACKTRACE=y opi5p
