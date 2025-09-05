Attempt to get Ubports working on Nothing Phone 1 (Spacewar)
This tree is based on Fairphone 5 (fp5) on Ubports Gitlab reference port (halium 11)

Current status :
- [x] Boots into UI !
- [x] Display (60Hz only for now)
- [x] GPU acceleration
- [x] Manual brightness
- [x] Touchscreen
- [x] RIL (SMS and calls)
- [x] Mobile data (tested up to 4G, I don't have 5G)
- [x] SSH
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
- [x] Offline charging
- [x] Online charging
- [x] RTC Time
- [x] Shutdown / Reboot
- [x] Auto-rotation (buggy, see below)
- [x] Secure lockscreen
- [x] Camera (front & back)
- [x] Video recording
- [x] Waydroid & Libertine containers

- Unstable / Bugs :
- [ ] Mobile network disconnects and reconnects sometimes
- [ ] Auto-rotation is unreliable (doesn't always work)
- [ ] Camera quality is far behind Android
- [ ] Battery life isn't as on Android (but still good enough)

Untested :
- [ ] NFC (seems to work)
- [ ] VoLTE (should work)
- [ ] MTP & ADB (will be fixed soon)
- [ ] Wired and wireless external monitor
- [ ] 120Hz display refresh rate

Currently broken :
- [ ] Vibration (working on a fix)
- [ ] Auto-brightness (will work on a fix)

Unsupported (won't/can't fix) :
- [ ] UDFPS (Underdispay fingerprint is apparently not supported by UT)
- [ ] Glyphs (not sure how to fix these)
- [ ] Dual Sim functionnaly (only 1 SIM at a time)
