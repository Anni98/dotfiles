#!/bin/bash

echo "Welcome To Your Setup"
echo ""
echo " ▄▄▄▄▄▄▄ ▄▄    ▄ ▄▄    ▄ ▄▄▄ ▄▄   ▄▄"
echo "█       █  █  █ █  █  █ █   █  █▄█  █"
echo "█   ▄   █   █▄█ █   █▄█ █   █       █"
echo "█  █▄█  █       █       █   █       █"
echo "█       █  ▄    █  ▄    █   ██     █"
echo "█   ▄   █ █ █   █ █ █   █   █   ▄   █"
echo "█▄▄█ █▄▄█▄█  █▄▄█▄█  █▄▄█▄▄▄█▄▄█ █▄▄█"
echo "      https://github.com/Anni98    "
echo""
echo "Installing Programs.."
echo "Installing Yay"
sleep 1 && clear

mkdir ~/gits
git clone https://aur.archlinux.org/yay.git ~/gits/
cd ~/gits/yay/
makepkg -si
echo "Yay Installed"
echo ""
clear
echo "Installing Programs"
pacman -S alacritty xorg xorg-server xorg-xinit mesa xdg-utils xf86-input-libinput xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vesa ranger python rofi
echo ""
echo "Installing DWM & Setup"
git clone https://aur.archlinux.org/dwm.git ~/
cd dwm 
sudo make clean Install
echo "dwm installed configutring it"
cp 
