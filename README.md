# 🔍 GNOME Login Debug Toolkit

This tool was co-created by **Arjun S.** with the help of **AI scripting assistance**, built during a real-life debugging scenario on Kali Linux.

> “Instead of reinstalling Linux, I decided to build a script that solves it.”

---

## 🛠️ What It Does

- Detects Display Manager (GDM, LightDM, SDDM)
- Shows default systemd boot target
- Checks `.Xauthority` permission issues
- Verifies GNOME session is installed
- Scans disk space (common GUI failure cause)
- Detects GPU and driver setup
- Parses Xorg errors and login-related logs via journalctl

---

## 🧠 Who It Helps

- Cybersecurity learners (SOC, IR)
- Bug bounty hunters & Pentesters
- Linux users debugging black screen or session crash
- VirtualBox / VMware users on GNOME environments

---

## 🧪 How to Use

```bash
chmod +x gnome-login-debug.sh
./gnome-login-debug.sh
