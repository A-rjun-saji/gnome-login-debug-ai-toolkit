#!/bin/bash

echo "🔍 Starting GNOME Login Debug Script..."
echo "Logged in as: $(whoami)"
echo "=============================="

# 1. Detect current default display manager
echo "📌 Display Manager:"
if [ -f /etc/X11/default-display-manager ]; then
  cat /etc/X11/default-display-manager
else
  echo "Not found!"
fi

# 2. Check running DM
echo "🔧 Running Display Manager Process:"
ps aux | grep -E 'gdm|lightdm|sddm' | grep -v grep

# 3. Check systemd boot target
echo "🎯 Default Systemd Target:"
systemctl get-default

# 4. Autologin config check
echo "🧾 LightDM Autologin Status:"
grep -E 'autologin-user|user-session' /etc/lightdm/lightdm.conf 2>/dev/null || echo "Not configured"

# 5. GNOME session installed?
echo "🖥️ GNOME Session Installed:"
gnome-session --version 2>/dev/null && echo "GNOME OK" || echo "GNOME NOT installed!"

# 6. Broken ~/.Xauthority?
echo "🔐 Checking ~/.Xauthority permissions:"
ls -la ~/.Xauthority 2>/dev/null || echo "No .Xauthority found"

# 7. Check if disk full (common black screen cause)
echo "💽 Disk Space (/):"
df -h /

# 8. GPU + Driver check
echo "🧠 GPU Detection:"
lspci | grep -i "vga"

echo "🧰 Kernel GPU Driver:"
lspci -k | grep -A 2 -i "vga"

# 9. Xorg error logs
echo "❌ Xorg.0.log Errors:"
grep -iE "(EE)|fatal|fail" /var/log/Xorg.0.log | tail -n 20

# 10. System boot/login errors
echo "⚠️ Journalctl Login/LightDM Errors:"
journalctl -xe | grep -Ei 'lightdm|gnome|xorg' | tail -n 30

echo "=============================="
echo "🧪 Login debug complete. Review output above."
