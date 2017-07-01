#!/bin/bash

# UPDATE OS
sudo apt-get update

# UPGRADE PACKAGES
sudo apt-get upgrade

# UPDATE FIRMWARE
sudo rpi update

# REMOVE UNUSED PACKAGES
sudo apt-get purge sonic-pi
sudo apt-get purge minecraft-pi
sudo apt-get purge libreoffice*
sudo apt-get purge wolfram-engine
sudo apt-get purge Scratch
sudo apt-get clean
sudo apt-get autoremove

# INTEGRATE Z-RAM
sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/novaspirit/rpi_zram/master/zram.sh
sudo chmod +x /usr/bin/zram.sh
cp /etc/rc.local /tmp
sed -i -e 's/exit 0/usr\/bin\/zram.sh \& exit 0/g' /tmp/rc.local
cat /tmp/rc.local > /etc/rc.local
sudo rm -rf /tmp/rc.local

# Reboot
sudo reboot
