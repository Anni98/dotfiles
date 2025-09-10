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
echo ""
echo "Installing Programs.."
echo "Installing Yay"
sleep 1 && tput clear
echo "Installing Kit"
sudo pacman -S --needed base-devel git
echo ""
mkdir ~/gits
git clone https://aur.archlinux.org/yay.git ~/gits/
cd ~/gits/yay/
makepkg -si --noconfirm
echo "Yay Installed"
echo ""
clear
echo "Updating the System"
sudo pacman -Syyu --noconfirm
echo "Installing Programs"
pacman -S --needed alacritty xorg xorg-server xorg-xinit mesa xdg-utils xf86-input-libinput xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vesa ranger python rofi nvim feh htop 
echo ""
echo "Installing DWM & Setup"
git clone https://aur.archlinux.org/dwm.git ~/
cd dwm 
if sudo make clean install; then
  echo "Dwm installed configutring it"
else
  echo "Dwm installation failed!"
fi
mkdir patches
cd patches
if wget -O dwm-fullgaps-6.4.diff https://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.4.diff; then
  echo "Patch Download Successfull"
fi
cd ~/dwm/
if patch -p1 < ~/dwm/patches/dwm-fullgaps-6.4.diff; then
  echo "Patch Applied Successfully"
fi
cd ..
sudo make clean install
cd ~/dotfiles/ && cp config.h ~/dwm/
cd ~/dwm
sudo rm -rf config.def.h
if sudo make clean install; then
  echo "Dwm Setup Set!"
else
    echo "Dwm installation failed!" >&2
    exit 1
fi
echo "Setting Up The User Exp"
cd
cp -rf ~/dotfiles/.config/rofi ~/.config
cp -rf ~/dotfiles/.config/alacritty/ ~/.config
cp -rf ~/dotfiles/.config/nvim ~/.config

echo "User Exp Done!"
echo ""
echo "Now Setting Up the UI and essentials"
cd ~/gits
git clone https://aur.archlinux.org/brave-bin.git
cd ~/gits/brave-bin/
if makepkg -si; then
  echo "Browser Installed Successfully"
fi
echo "Working on xinitrc"
cd
if cp ~/dotfiles/.xinitrc ~/ ; then
  echo "All Set,Your System is Ready Now"
fi
echo "Made By AnniX"

