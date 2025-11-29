This is testing branch!
Switch to halium-11.0 branch for the stable version
Only use this branch if you know what's going on here

On this branch, you will receive OTA updates from Ubuntu Touch official servers (until Spacewar has been added to the official list).

How to install :

Notes : This is for advanced users. It's meant for people who want to contribute to this port. For beginners, just install the latest release (don't download the ones tagged with "Pre-release".

1. Download the firmware and the patch
2. Create a custom partition with parted and name it "rootfs"
3. Create another partition with parted and name it "linux" and format it to ext4 (fastboot format:ext4 linux)
4. Flash ubuntu.img to that partition (fastboot flash ubuntu.img rootfs)
5. Set active slot to B
6. Flash boot and vendor_boot to slot B
7. If you are on Android 14, 15 or 16, you need to flash Android 13 files to slot b (except super partition),
8. The same way (if you are not on stock Android 13 NOS), you need to push vendor.img and odm.img to the partition you created on step 3
9. Unzip and push the patch file to linux partition (need to mount the partition first: adb shell "mount /data").
10. Reboot and enjoy! 
