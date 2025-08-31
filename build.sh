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

cd "$TMPDOWN/$KERNEL_DIR"

# Create Droidian config fragment on build time
echo "Creating Droidian kernel config fragment ..."
cat > arch/arm64/configs/vendor/droidian.config << 'DROIDIAN_EOF'
# Droidian required kernel options
CONFIG_DEVTMPFS=y
CONFIG_VT=y
CONFIG_NAMESPACES=y
CONFIG_MODULES=y
CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
CONFIG_USB_CONFIGFS_RNDIS=y
CONFIG_USB_CONFIGFS_RMNET_BAM=y
CONFIG_USB_CONFIGFS_MASS_STORAGE=y
CONFIG_INIT_STACK_ALL_ZERO=y
CONFIG_ANDROID_PARANOID_NETWORK=n
CONFIG_ANDROID_BINDERFS=n

# Namespace support
CONFIG_SYSVIPC=y
CONFIG_PID_NS=y
CONFIG_IPC_NS=y
CONFIG_UTS_NS=y

# Bluetooth support
CONFIG_BT=y
CONFIG_BT_HIDP=y
CONFIG_BT_RFCOMM=y
CONFIG_BT_RFCOMM_TTY=y
CONFIG_BT_BNEP=y
CONFIG_BT_BNEP_MC_FILTER=y
CONFIG_BT_BNEP_PROTO_FILTER=y
CONFIG_BT_HCIVHCI=y

# Waydroid support
CONFIG_SW_SYNC_USER=y
CONFIG_NET_CLS_CGROUP=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_VETH=y
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder,anbox-binder,anbox-hwbinder,anbox-vndbinder"

# Debug support
CONFIG_PSTORE=y
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_RAM=y
CONFIG_PSTORE_RAM_ANNOTATION_APPEND=y

DROIDIAN_EOF
echo "Droidian config fragment created at arch/arm64/configs/vendor/droidian.config"
echo "Configuration includes:"
echo "- Basic Droidian requirements" 
echo "- Bluetooth support"
echo "- Waydroid support"
echo "- Namespace support"

# Generate lahaina_ALLYES_GKI.config from lahaina_GKI.config
#./scripts/gki/fragment_allyesconfig.sh arch/arm64/configs/vendor/lahaina_GKI.config arch/arm64/configs/vendor/lahaina_ALLYES_GKI.config

# Launch the build script !

cd "$HERE"

./build/build.sh "${args[@]}" -b "$BUILD_DIR"
