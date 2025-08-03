sudo ln -s /dev/null overlay/system/etc/systemd/system/serial-getty@hvc0.service
sudo ln -s /usr/lib/systemd/user/umtprd-manager.service overlay/system/etc/systemd/user/graphical-session.target.wants/umtprd-manager.service
sudo ln -s /dev/null overlay/system/etc/systemd/user/mtp-server-usb-moded-watcher.service
sudo ln -s /dev/null overlay/system/usr/share/halium-overlay/vendor/lib64/hw/gralloc.common.so
sudo ln -s /dev/null overlay/system/usr/share/halium-overlay/vendor/lib64/hw/gralloc.default.so
