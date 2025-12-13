Welcome to a dualboot project with Ubuntu Touch and Android for the Nothing Phone 1 (Spacewar)
This tree is deeply based on Fairphone 5 (fp5) on Ubports Gitlab reference port (halium 11)

![](https://img.shields.io/github/downloads/neonmodder123/spacewar-ut-dualboot/total?label=Downloads&style=plastic)

# WARNING:
This project is very experimental and is very dangerous and you might risk hard-bricking your phone! Your data may and may not be wiped depending on how much data you have consumed in the partition. Proceed with caution.
You should also boot android **at least once**!!!
# Guide to dualboot:

1. Download the latest release of Ubuntu Touch

2. Extract the .tar.xz file

3. Reboot your device into fastboot mode

4. Unlock the bootloader (if you haven't already)

5. Download and flash the normal boot and vendor_boot images ([download from here](https://github.com/neonmodder123/spacewar-ut-dualboot/tree/ubuntu-dualboot/normal-images)) and reboot to recovery using these commands:
```
fastboot set_active b
fastboot flash boot_b boot.img
fastboot flash vendor_boot_b vendor_boot.img
fastboot reboot recovery
```
6. Push the bin folder:
```
adb push bin/ /tmp/
```
7. Run the parted commands in adb shell:
```
adb shell
cd /tmp/bin
chmod +x *
./parted /dev/block/sda
unit GB
print
```
7. Note down the End value and partition number of the partition userdata (should be 10).

8. Run the following parted commands below. Note down that End? is subtracted by the amount you want to give in GB to Ubuntu Touch. ex. END_GB - 64 = NEW_END_GB, and the START_GB for ubtouch_data is NEW_END_GB.
```
resizepart
10
<NEW_END_GB>
yes
ignore
mkpart ubtouch_data
ext4
<USERDATA_END_GB>
<OLD_USERDATA_END_GB>
```
9. Now confirm that you created the partition successfully:
```
print
quit
```
   It should show you a new partition with the number 11 called ubtouch_data.
10. In the UBPorts recovery, click **Advanced** , then click **Reboot to recovery**.
11. Use the mkfs.ext4 binary to format your new partition:
```
./mkfs.ext4 /dev/block/sda11
```
12. In the UBPorts recovery, click **Advanced** , then click **Reboot to recovery**. Then, enter the adb shell to mount your new partition to /data and then exit:
```
adb shell
mount /data
exit
```
13. Push the ubuntu.img rootfs to /data using adb then reboot to bootloader:
```
adb push <drag ubuntu.img> /data/
adb reboot bootloader
```
14. Flash the modified boot and vendor_boot images in the extracted folder containing the ubuntu.img rootfs using these commands:
```
fastboot set_active b
fastboot flash boot_b <drag boot.img>
fastboot flash vendor_boot_b <drag vendor_boot.img>
```
14. Reboot!

  You have now successfully dualbooted Android and Ubuntu Touch! Wait 2-4 minutes for the first boot. You should see the Ubuntu Touch bootanimation and then see the setup. Proceed to the next step.

15. Finish the Ubuntu Touch setup and connect to the internet if you did not already.
16. Open the Open Store and search for an app called "Switch my Slot" and install it.
17. Now if you want to switch back to android, open the newly installed app and click Switch Slot, and reboot!
You can also switch slots in android using the app [Boot Control](https://github.com/capntrips/BootControl/releases/tag/v1.0.0-alpha03), but you need to have root installed. If you do not want to root your device, you will manually have to reboot to fastboot mode/bootloader and use fastboot on your PC to switch to Ubuntu Touch.

# _**IMPORTANT NOTE**_: You can NEVER, lock the bootloader in this state. EVER! If you attempt to, you will risk hard-bricking your phone! (Black screen, not turning on at all.) Although this is recoverable with EDL Mode, it is not recommended.

# Current status :
- [x] Boots into UI !
- [x] Display (60Hz only for now)
- [x] GPU acceleration
- [x] Manual brightness
- [x] Touchscreen
- [x] RIL (SMS and calls)
- [x] Mobile data (tested up to 4G, I don't have 5G)
- [x] USB SSH
- [x] Ubports recovery with adb
- [x] Touchscreen in recovery mode
- [x] Wi-Fi
- [x] BT (BT audio too)
- [x] Flight mode
- [x] NFC
- [x] GPS
- [x] Earphones
- [x] Loudspeaker
- [x] Microphone
- [x] Volume control with volume keys
- [x] Double tap to wake
- [x] Flashlight
- [x] Hardware video playback
- [x] AppArmor
- [x] Online and offline charging
- [x] RTC Time
- [x] Shutdown / Reboot
- [x] Auto-rotation
- [x] Secure lockscreen
- [x] Camera (front & back)
- [x] Video recording
- [x] Waydroid & Libertine containers
- [x] Sensor (Accelerometer/Gyroscope)
- [x] Wireless externl display
- [x] MTP & ADB in userspace (you must be on a Linux host to access MTP)
- [x] Vibration (partially fixed)

- Unstable / Bugs :
- [ ] Camera quality is far behind Android (also limited to 12MP)
- [ ] Battery life isn't as on Android (but still good enough)
- [ ] Auto-brightness works but it's not stable/accurate (working on a fix)

Untested :
- [ ] NFC (seems to work)
- [ ] VoLTE (should work)

Currently broken :
- [ ] 90Hz and 120Hz display refresh rate

Unsupported (won't/can't fix) :
- [ ] UDFPS (Underdispay fingerprint is apparently not supported by UT)
- [ ] Glyphs (not sure how to fix these)
- [ ] Dual Sim functionnaly (only 1 SIM at a time)

Credits and thanks :
- Ubports Team,
- NotKit
- Muhammad23012009
- deathmist
- abkro (for his patches on OnePlus 8T regarding audio bringup)
- Nonta72
- Anyone else I may have forgotten !
