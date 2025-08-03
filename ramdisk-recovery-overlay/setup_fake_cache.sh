#!/system/bin/sh

DATA_MOUNT_CODE=1

RETRY_COUNTER=0
while [ "$DATA_MOUNT_CODE" != "0" ]; do
    if [ "$RETRY_COUNTER" -gt "10" ]; then
        echo "setup_fake_cache.sh - reached maximum number of retries" > /dev/kmsg

        setprop halium.datamount.done 1
        exit 1
    fi
    RETRY_COUNTER=$((RETRY_COUNTER+1))

    mount /dev/block/bootdevice/by-name/userdata /data > /dev/kmsg
    DATA_MOUNT_CODE=$?
    sleep 1
done

if [ "$DATA_MOUNT_CODE" == "0" ]; then
    mkdir /data/cache > /dev/kmsg
    mount -o bind /data/cache /cache > /dev/kmsg
fi

setprop halium.datamount.done 1
exit 0
