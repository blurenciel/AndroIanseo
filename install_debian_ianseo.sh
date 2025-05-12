#!/data/data/com.termux/files/usr/bin/bash

echo "=== Updating Termux ==="
pkg update -y && pkg upgrade -y

echo "=== Installing proot-distro ==="
pkg install proot-distro -y

echo "=== Installing Debian via proot-distro ==="
proot-distro install debian

echo "=== Copying debian-setup.sh to Debian root directory ==="
cp debian-setup.sh ~/.proot-distro/installed-rootfs/debian/root/

echo "=== Running setup inside Debian ==="
proot-distro login debian -- bash /root/debian-setup.sh
