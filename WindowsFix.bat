@echo off
echo === Android Connectivity Fix for China ROMs ===
echo Checking for connected devices...
adb devices
echo.
echo Applying fixes...
adb shell settings put global captive_portal_http_url http://nmcheck.kde.org/check_network_status.txt
adb shell settings put global captive_portal_https_url https://nmcheck.kde.org/check_network_status.txt
adb shell settings put global captive_portal_mode 0
echo.
echo Done! Please toggle Airplane Mode or Restart your phone.
pause