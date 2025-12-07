Welcome to Ubuntu Touch for Nothing Phone 1 (Spacewar)
This tree is deeply based on Fairphone 5 (fp5) on Ubports Gitlab reference port (halium 11)

Current status :
- [x] Boots into UI !
- [x] Display (60Hz only for now)
- [x] GPU acceleration
- [x] Manual and auto-brightness
- [x] Touchscreen
- [x] RIL (SMS and calls)
- [x] Mobile data (tested up to 4G, I don't have 5G)
- [x] USB SSH
- [x] Ubports recovery (with adb and fastbootd)
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
- [x] Tap/double tap to wake
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
- [x] Sensors (Accelerometer/Gyroscope)
- [x] Wireless externl display
- [x] MTP & ADB
- [x] Vibration (partially)

Unstable / Bugs :
- [ ] There's no vibration lomiri keyboard taps (it works everywhere else),
- [ ] The keyboard clicks still produce sounds even when the phone is on Silent mode (disabled by default).

Untested :
- [ ] NFC (seems to work)
- [ ] VoLTE (should work)

Unsupported (won't/can't fix) :
- [ ] UDFPS (Underdispay fingerprint is apparently not supported by UT yet)
- [ ] Glyphs interface aka the LED strips on the back of the phone (not sure how to fix these). They can still be controlled through sysfs
- [ ] Dual Sim functionnaly (only 1 SIM at a time)
- [ ] 90Hz and 120Hz display refresh rates

Credits and thanks :
- Ubports Team,
- NotKit,
- Muhammad23012009,
- deathmist,
- abkro (for his patches on OnePlus 8T regarding audio bringup),
- Anyone else I may have forgotten !
