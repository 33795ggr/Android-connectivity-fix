# 🌍 Global Connectivity Fix for Chinese Android ROMs (CIS Region)
### Fix for "No Internet" bugs, Google Sync issues, and System Banners on Vivo, Oppo, Xiaomi, and others.

---

## 🇷🇺 Описание проблемы (The Pain)
Смартфоны, предназначенные для китайского рынка (OriginOS, ColorOS, HyperOS), при работе в странах СНГ часто сталкиваются с «фантомным» отсутствием интернета. 

**Симптомы:**
* Иконка Wi-Fi с крестиком или восклицательным знаком (якобы нет сети).
* **Google Drive, YouTube, Gmail** и другие сервисы не синхронизируются, считая, что устройство оффлайн.
* Постоянно всплывающие уведомления о необходимости войти в сеть (Captive Portal).
* Проблемы с уведомлениями и обновлением системы.

**Причина:** Прошивка пытается проверить интернет через китайские сервера (google.cn или сервера производителя), которые заблокированы или недоступны из РФ/СНГ. Система получает «отказ» и блокирует передачу данных для многих приложений.

---

## 🇬🇧 The Problem (The Context)
Android devices with Chinese ROMs are hardcoded to verify internet access via Chinese endpoints. In the CIS region, these checks often fail due to network restrictions or high latency.

**The result:** Even with high-speed Wi-Fi, the system reports "No Connection," causing critical apps (Google Workspace, Cloud Backups) to stop functioning. This project provides a **permanent, proxy-free solution** to redirect these checks to reliable global mirrors.

---

## ✅ Решение / The Solution
Мы перенаправляем системные запросы (Captive Portal) на стабильные зеркала и отключаем навязчивый режим проверки. **Никаких VPN, никаких прокси, не тратит заряд батареи.** Один раз настроили — и забыли.

### 🛠 Способ 1: Автоматизация (ПК/Mac)
Самый быстрый способ. Вам понадобится компьютер и включенная "Отладка по USB".

1. Скачайте этот репозиторий.
2. Запустите файл для вашей системы:
   - **Windows:** `fix_china_net.bat`
   - **macOS/Linux:** `fix_china_net.sh`
3. Перезагрузите телефон.

### 📱 Способ 2: На телефоне (SetEdit)
Если под рукой нет компьютера:
1. Установите приложение **SetEdit**.
2. В таблице `Global Table` найдите или создайте строку `captive_portal_mode` со значением `0`.
3. Перезагрузите устройство.

---

## 💻 Техническая часть / Technical Details
Скрипт выполняет следующие команды через ADB:

```bash
# Redirecting HTTP/HTTPS checks to KDE mirrors (Reliable & Global)
adb shell settings put global captive_portal_http_url [http://nmcheck.kde.org/check_network_status.txt](http://nmcheck.kde.org/check_network_status.txt)
adb shell settings put global captive_portal_https_url [https://nmcheck.kde.org/check_network_status.txt](https://nmcheck.kde.org/check_network_status.txt)

# Disabling strict captive portal mode to prevent "Offline" false-positives
adb shell settings put global captive_portal_mode 0
