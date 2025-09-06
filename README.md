Welcome to Ubuntu Touch for Nothing Phone 1 (Spacewar)
This tree is deeply based on Fairphone 5 (fp5) on Ubports Gitlab reference port (halium 11)

Current status :
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

- Unstable / Bugs :
- [ ] Camera quality is far behind Android (also limited to 12MP)
- [ ] Battery life isn't as on Android (but still good enough)
- [ ] Auto-brightness works but it's not stable/accurate

Untested :
- [ ] NFC (seems to work)
- [ ] VoLTE (should work)
- [ ] Wired external monitor (e.g HDMI)

Currently broken :
- [ ] Vibration (working on a fix)
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
- Anyone else I may have forgotten !
