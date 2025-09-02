#!/usr/bin/env bash
#
# Wrapper for mount/umount calls in GitHub Actions
# Uses guestmount/guestunmount instead of kernel loop devices.

REAL_MOUNT=$(command -v mount)
REAL_UMOUNT=$(command -v umount)

case "$(basename "$0")" in
  mount)
    if [[ "$*" == *"rootfs.img"* ]]; then
      IMG=$(echo "$@" | grep -oE '\S*rootfs\.img')
      TARGET=$(echo "$@" | awk '{print $NF}')
      echo "[ci-mount] guestmount $IMG -> $TARGET"
      guestmount -a "$IMG" -m /dev/sda "$TARGET"
    else
      exec $REAL_MOUNT "$@"
    fi
    ;;

  umount)
    if [[ "$*" == *"tmp."* ]]; then
      TARGET=$(echo "$@" | awk '{print $NF}')
      echo "[ci-mount] guestunmount $TARGET"
      guestunmount "$TARGET"
    else
      exec $REAL_UMOUNT "$@"
    fi
    ;;

  *)
    echo "Unknown wrapper call: $0" >&2
    exit 1
    ;;
esac
