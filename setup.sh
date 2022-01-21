#!/bin/bash

# Update
sudo apt update && apt upgrade -y && apt autoremove -y

# Install PulseAudio and OBS-Studio
sudo apt install -y pulseaudio obs-studio

# Set keyboard layout
L='de' && sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'$L'\"/g' /etc/default/keyboard

# Configure firefox
sudo mv /home/vagrant/policies.json /usr/lib/firefox-esr/distribution/policies.json

# Configure autologin
sudo mv /home/vagrant/60-lightdm-gtk-greeter.conf /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf

# Configure Autostart
mkdir -p /home/vagrant/.config/autostart
cp -f /usr/share/applications/firefox-esr.desktop /home/vagrant/.config/autostart/firefox-esr.desktop
cp -f /usr/share/applications/com.obsproject.Studio.desktop /home/vagrant/.config/autostart/com.obsproject.Studio.desktop

# Reboot
sudo reboot
