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

# Clone QCACLD-3.0 from FP5 repositories

cd ../../../drivers/staging

BRANCH="kernel/13/fp5"
GERRIT_URL="https://gerrit-public.fairphone.software"
PLATFORM_VENDOR_URL="${GERRIT_URL}/platform/vendor"

mkdir wlan-qc && cd wlan-qc
git clone -b ${BRANCH} ${PLATFORM_VENDOR_URL}/qcom-opensource/wlan/fw-api fw-api
git clone -b ${BRANCH} ${PLATFORM_VENDOR_URL}/qcom-opensource/wlan/qca-wifi-host-cmn qca-wifi-host-cmn
git clone -b ${BRANCH} ${PLATFORM_VENDOR_URL}/qcom-opensource/wlan/qcacld-3.0 qcacld-3.0

# Generate lahaina_ALLYES_GKI.config from lahaina_GKI.config
#./scripts/gki/fragment_allyesconfig.sh arch/arm64/configs/vendor/lahaina_GKI.config arch/arm64/configs/vendor/lahaina_ALLYES_GKI.config

# Launch the build script !

cd "$HERE"

./build/build.sh "${args[@]}" -b "$BUILD_DIR"
