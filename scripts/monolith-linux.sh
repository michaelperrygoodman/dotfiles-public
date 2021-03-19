# Linux 8 "Monolith"

# 256 MB /boot (boot)
# 10 GB /swap
# 240 GB / (root)

sudo -v
echo '++ root access enabled'

# update aptitude lists
apt-get update
apt-get upgrade

# Add "contrib" and "non-free" components to /etc/apt/sources.list, for example:
# Debian 8 "Jessie"
# deb http://http.debian.net/debian/ jessie main contrib non-free

# Update the list of available packages. Install the appropriate linux-headers and
# kernel module packages:
apt-get update
apt-get install linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') nvidia-kernel-dkms

# install some initial binaries
apt-get install curl wget htop tmux nmap git ack-grep automake autoconf cmake \
grep tree vim irssi lynx

# Edit /etc/default/grub
# Change these parameters for higher console resolution
# Change GRUB_GFXMODE= (e.g. GRUB_GFXMODE=1920x1080)
# Set GRUB_GFXPAYLOAD_LINUX to GRUB_GFXPAYLOAD_LINUX=keep
# Disable OS prober to prevent virtual machines on logical volumes from appearing in the boot menu.
# Set GRUB_DISABLE_OS_PROBER=true
# update-grub
# reboot

# Wireless networking for Broadcom BCM4360 chipset
apt-get install broadcom-sta-dkms

# Unload conflicting modules:
modprobe -r b44 b43 b43legacy ssb brcmsmac

# Load the wl module:
modprobe wl

# Use the lspci command to verify that card is detected:
# lspci
# lspci | grep -i wlan
# lspci | grep -i wireless
# lspci | grep -i wifi
# lspci -nn | grep Network

# Setup wlan0 with the SSID and PSK as follows:
# /etc/network/interfaces

# auto wlan0
# iface wlan0 inet dhcp
#     wpa-ssid YOUR-SSID-HERE
#     wpa-psk YOUR-PASSWORD-HERE

# Restart the service
/etc/init.d/networking restart

# Initial security precautions
apt-get install fail2ban

# Non-root useradd
adduser void sudo
mkdir /home/void/.ssh
chmod 700 /home/void/.ssh

# Lock Down ssh
vim /etc/ssh/sshd_config

# Settings
# Port 2600
# PermitRootLogin no

# Restart ssh
service ssh restart

# Install firewall
apt-get install ufw

# Basic UFW Setup
ufw allow 2600
ufw allow 80
ufw allow 443
ufw enable

# Enable automatic security updates
apt-get install unattended-upgrades

vim /etc/apt/apt.conf.d/10periodic

#APT::Periodic::Update-Package-Lists "1";
#APT::Periodic::Download-Upgradeable-Packages "1";
#APT::Periodic::AutocleanInterval "7";
#APT::Periodic::Unattended-Upgrade "1";

vim /etc/apt/apt.conf.d/50unattended-upgrades

# Install Logwatch
apt-get install logwatch

vim /etc/cron.daily/00logwatch
#/usr/sbin/logwatch --output mail --mailto michaelperrygoodman@gmail.com --detail high

# Install Ruby programming language suppot
apt-get install ruby rbenv ruby-build

# Install Python language support
apt-get install python python3 pyenv

# Installing OpenBox + GNUStep, xmonad
apt-get install xorg openbox obconf gnustep xmonad
