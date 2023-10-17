#!/bin/bash

sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf -y update

sudo dnf -y install ffmpeg-libs --allowerasing # in order to remove lib codes ffmpeg has conflicts with

sudo dnf -y install \
    ranger \
    deluge \
    neofetch \
    mpv \
    chromium \
    foliate \
    apostrophe \
    btop \
    steam \
    discord \
    legendary \
    minigalaxy \
    wine \
    @xfce-desktop-environment \
    lm_sensors \
    gnome-disk-utility # for the automount option

# flatpak & flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub io.typora.Typora
sudo flatpak install -y flathub org.onlyoffice.desktopeditors
sudo flatpak install -y flathub org.telegram.desktop
sudo flatpak install -y flathub com.ampl.ide
sudo flatpak install -y flathub com.spotify.Client

# if this fails, then try to download files from the website and launch them w/ flatpak install

# code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf -y install code

# didn't find
# collision (no in dnf)
# commit (no in dnf)
# gaphor (no in dnf)
# dconf (for Gnome)
