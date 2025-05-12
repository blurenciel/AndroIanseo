# AndroIanseo

**AndroIanseo** is a lightweight installer for running [IANSEO](https://www.ianseo.net), the archery scoring system, on Android using [Termux](https://termux.dev) and `proot-distro`.

> ✅ Designed for phones with minimal space and no root access.

---

## 📦 What It Does

- Installs Debian inside Termux using `proot-distro`
- Installs Apache, PHP, MariaDB (inside Debian)
- Downloads and configures the official IANSEO release
- Runs completely offline after install

---

## 🚀 Installation

1. Install Termux from [F-Droid](https://f-droid.org/packages/com.termux/)
2. Run this in Termux:

```bash
pkg install -y git
git clone https://github.com/blurenciel/AndroIanseo
cd AndroIanseo
chmod +x install.sh
./install.sh
```
3. After install
```bash
androianseo
./androianseo-setup.sh
```

Then open http://localhost:8080 in your Android browser!
