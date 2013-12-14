#!/bin/bash
REPO="https://raw.github.com/hoprocker/wifi-setup/master"
curl -o - "$REPO/sources.list" >> /etc/apt/sources.list
apt-get update
apt-get install -y firmware-atheros hostapd wireless-tools bridge-tools
curl -o - "$REPO/interfaces" > /etc/network/interfaces
curl -o - "$REPO/hostapd.conf" > /etc/hostapd/hostapd.conf
echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"" >> /etc/default/hostapd

echo ""
echo "This system has been configured. Now run 'shutdown -r now' as root to complete install."
