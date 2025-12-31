all:
	./build.sh -b workdir
	./build/prepare-fake-ota.sh out/device_pong_usrmerge.tar.xz ota
	./build/system-image-from-ota.sh ota/ubuntu_command images

clean:
	rm -r out/ workdir/ images/ ota/ || true

install:
	fastboot reboot fastboot
	fastboot delete-logical-partition product_a
	fastboot delete-logical-partition product_b
	fastboot delete-logical-partition system_ext_a
	fastboot delete-logical-partition system_ext_b
	fastboot delete-logical-partition vendor_b
	fastboot delete-logical-partition vendor_dlkm_b
	fastboot delete-logical-partition odm_b
	fastboot flash boot_a images/boot.img
	fastboot flash system_a images/system.img
	fastboot erase userdata
