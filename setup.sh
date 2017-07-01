#!/bin/bash

# UPDATE OS
sudo apt-get -y update

# UPGRADE PACKAGES
sudo apt-get -y upgrade

# UPDATE FIRMWARE
sudo rpi update

# REMOVE UNUSED PACKAGES
sudo apt-get -y purge sonic-pi
sudo apt-get -y purge minecraft-pi
sudo apt-get -y purge libreoffice*
sudo apt-get -y purge wolfram-engine
sudo apt-get -y purge Scratch
sudo apt-get -y clean
sudo apt-get -y autoremove

# INTEGRATE Z-RAM
sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/kevalpatel2106/rpi-setup/master/zram.sh
sudo chmod +x /usr/bin/zram.sh
cp /etc/rc.local /tmp
sed -i -e 's/exit 0/usr\/bin\/zram.sh \& exit 0/g' /tmp/rc.local
cat /tmp/rc.local > /etc/rc.local
sudo rm -rf /tmp/rc.local

#Apply rasbpian configs
sudo amixer cset numid=3 2
sudo sh -c "echo 'hdmi_group=2' >> /boot/config.txt"
sudo sh -c "echo 'hdmi_mode=35' >> /boot/config.txt"

#INTSTALLING OTHER PACKAGES
sudo apt-get -y install ntfs-3g

# Reboot
sudo reboot
