# AndroIANSEO

Automated Termux setup for [IANSEO](https://github.com/brian-nelson/ianseo) using Debian via `proot-distro`.

## Features

- Installs Debian inside Termux using `proot-distro`
- Sets up Apache, PHP, and MariaDB
- Clones the IANSEO timing and scoring software

## Prerequisites

- Termux (latest version from [F-Droid](https://f-droid.org/en/packages/com.termux/))
- At least 2GB free storage
- Internet connection

## Installation

```bash
git clone https://github.com/blurenciel/AndroIanseo
cd androianseo
chmod +x install-ianseo-debian.sh
bash install-ianseo-debian.sh
