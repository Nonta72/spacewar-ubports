#!/bin/sh
set -e

USB_GADGET=/sys/kernel/config/usb_gadget

if [ -d "${USB_GADGET}/g1" ]; then
    # The USB function must exists for functionfs to be available for mounting.
    mkdir -p "${USB_GADGET}/g1/functions/ffs.mtp"
fi

mkdir -p /dev/usb-ffs
chmod 0770 /dev/usb-ffs
chown phablet:phablet /dev/usb-ffs
mkdir -p /dev/usb-ffs/mtp
chmod 0770 /dev/usb-ffs/mtp
chown phablet:phablet /dev/usb-ffs/mtp
/bin/mount -t functionfs mtp /dev/usb-ffs/mtp -o uid=phablet,gid=phablet
exit 0
