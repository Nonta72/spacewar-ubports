#! /vendor/bin/sh

source_size=`du -s ${1} | cut -f 1`

dd if=${1} of=/dev/block/by-name/apdp bs=${source_size}K count=1 conv=fsync

echo "[load_apdp] setting debug_policy to ${2}" > /dev/kmsg

setprop persist.vendor.debug_policy.ready 1
echo "[load_apdp] set persist.vendor.debug_policy.ready to 1" > /dev/kmsg
