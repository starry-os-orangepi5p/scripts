#!/bin/bash

set -e

TFTP_PATH="/private/tftpboot"
STARRY_ROOT="/home/seven_wsl/Workspace/CSstudy/os_porting_c/new/work/starry_workspace"

ssh tt -t "bash \$STARRY_ROOT/scripts/dev/build.sh"
scp tt:$STARRY_ROOT/starry-mix/starry-mix_aarch64-opi5p.uimg $TFTP_PATH/Uimage
bash $SCRIPT_PATH/con/...sh # TODO: tftpboot

