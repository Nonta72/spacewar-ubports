Attempt to get Ubports working on Nothing Phone 1 (Spacewar)
This tree is based on Fairphone 5 (fp5) on Ubports Gitlab reference port (halium 11)

Current status :
- [x] Boots into UI !
- [x] Display working
- [x] GPU acceleration
- [x] Touchscreen
- [x] RIL (SMS and calls)
- [x] Mobile data (tested up to 4G, I don't have 5G)
- [x] SSH working
- [x] Ubports recovery with adb
- [x] Touchscreen working in recovery mode
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
- [x] Auto-rotation
- [x] Secure lockscreen (i.e setting a passcode = settings crash). You must setup password on first boot, otherwise settings will crash if you try to set it up later on.

Untested :
- [ ] NFC (seems to work)
- [ ] VoLTE (should work)
- [ ] MTP & ADB (will be fixed soon)
- [ ] Wired and wireless external monitor
- [ ] 120Hz display refresh rate

Currently broken :
- [ ] UDFPS (Underdispay fingerprint sensor)
- [ ] Vibration (working on a fix)
- [ ] Camera (trying to get it working but not easy)
- [ ] Glyphs (not sure how to fix these)
- [ ] Auto-brightness (will work on a fix)
- [ ] Waydroid (it installs but gets stuck on loading screen. Working on a fix)


