#!/bin/bash
echo "=== Android Connectivity Fix for China ROMs ==="
adb devices
echo "Applying fixes..."
adb shell settings put global captive_portal_http_url http://nmcheck.kde.org/check_network_status.txt
adb shell settings put global captive_portal_https_url https://nmcheck.kde.org/check_network_status.txt
adb shell settings put global captive_portal_mode 0
echo "Done! Restart your phone or toggle Airplane Mode."