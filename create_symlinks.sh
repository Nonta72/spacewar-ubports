mkdir overlay/system/etc/systemd && mkdir overlay/system/etc/systemd/system
mkdir overlay/system/etc/systemd/user && mkdir overlay/system/etc/systemd/user/graphical-session.target.wants
mkdir overlay/system/usr/share/halium-overlay/vendor/lib64 && mkdir overlay/system/usr/share/halium-overlay/vendor/lib64/hw
ln -s /dev/null overlay/system/etc/systemd/system/serial-getty@hvc0.service
ln -s /dev/null overlay/system/etc/systemd/user/graphical-session.target.wants/umtprd-manager.service
ln -s /dev/null overlay/system/etc/systemd/user/mtp-server-usb-moded-watcher.service
ln -s /dev/null overlay/system/usr/share/halium-overlay/vendor/lib64/hw/gralloc.common.so
ln -s /dev/null overlay/system/usr/share/halium-overlay/vendor/lib64/hw/gralloc.default.so
