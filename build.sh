#!/bin/bash
set -xe
shopt -s extglob

BUILD_DIR=workdir

# From https://stackoverflow.com/a/48808214
args=("$@")
for ((i=0; i<"${#args[@]}"; ++i)); do
    case ${args[i]} in
        -b) BUILD_DIR=${args[i+1]}; unset args[i]; unset args[i+1]; break;;
    esac
done

[ -d build ] || git clone https://gitlab.com/ubports/community-ports/halium-generic-adaptation-build-tools build

# Grab full fp5 kernel source from halium gitlab
git clone https://gitlab.com/ubports/porting/reference-device-ports/android11/fairphone-5/kernel-fairphone-qcm6490.git -b halium-11.0-rebase $HOME/fp5

HERE=$(pwd)
SCRIPT="$(dirname "$(realpath "$0")")"/build
if [ ! -d "$SCRIPT" ]; then
    SCRIPT="$(dirname "$SCRIPT")"
fi
TMPDOWN="$BUILD_DIR/downloads"
mkdir -p "$TMPDOWN"

source deviceinfo
source "$SCRIPT/common_functions.sh"
source "$SCRIPT/setup_repositories.sh" "${TMPDOWN}"

KERNEL_DIR="$(basename "${deviceinfo_kernel_source}")"
KERNEL_DIR="${KERNEL_DIR%.*}"
echo $KERNEL_DIR

cd "$TMPDOWN/$KERNEL_DIR/arch/arm64/boot/dts"

# Clone DTS from NothingOSS into dts/vendor
git clone https://github.com/NothingOSS/android_kernel_devicetree_nothing_sm7325 -b sm7325/t vendor

# Fix broken NothingOSS symlinks
cd ../../../../techpack/audio/soc && rm -rf core.h && rm -rf pinctrl-utils.h
ln -s ../../../drivers/pinctrl/pinctrl-utils.h pinctrl-utils.h
ln -s ../../../drivers/pinctrl/core.h core.h

# Use QCA_CLD3 and BT Stack backport from fp5 halium (too lazy to cherry-pick every single commit and yes, won't probably work)

# This assumes you cloned THIS repo into $HOME/halium/spacewar-ubports
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$HOME/halium/spacewar-ubports"
WLAN_DRV_DIR="$HOME/fp5/drivers/staging"
DEST_DIR="$PROJECT_ROOT/workdir/downloads/$KERNEL_DIR/drivers/staging"
BT_DRV_DIR="$HOME/fp5"
DEST_DIR_BT="$PROJECT_ROOT/workdir/downloads/$KERNEL_DIR"

# Copy QCA_CLD3 files
cp -R "$WLAN_DRV_DIR/fw-api" "$DEST_DIR"
cp -R "$WLAN_DRV_DIR/qca-wifi-host-cmn" "$DEST_DIR"
cp -R "$WLAN_DRV_DIR/qcacld-3.0" "$DEST_DIR"

# Copy BT Stack backport files
cp -R "$BT_DRV_DIR/backports" "$DEST_DIR_BT"

# Generate lahaina_ALLYES_GKI.config from lahaina_GKI.config
#./scripts/gki/fragment_allyesconfig.sh arch/arm64/configs/vendor/lahaina_GKI.config arch/arm64/configs/vendor/lahaina_ALLYES_GKI.config

# Launch the build script !

cd "$HERE"

./build/build.sh "${args[@]}" -b "$BUILD_DIR"
