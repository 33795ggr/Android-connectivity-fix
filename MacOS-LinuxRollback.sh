#!/bin/bash
echo "=== Rollback: Android Connectivity Fix ==="
echo "Checking for connected devices..."
adb devices
echo "Reverting changes to factory defaults..."
adb shell settings delete global captive_portal_http_url
adb shell settings delete global captive_portal_https_url
adb shell settings put global captive_portal_mode 1
echo "Rollback complete! Please restart your phone."