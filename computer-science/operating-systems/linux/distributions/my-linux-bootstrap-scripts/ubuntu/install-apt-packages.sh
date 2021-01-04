#!/bin/bash
#Notice! I took this from Derek Briggs's repository on GitLab to automate the process of installing my desired software. I thank him!

#this file installs a ton of software packages. delete any you don't need, and add whatever you think I missed.
#I don't use all of this software, but I use a lot of it, and I wanted to cover as many bases as possible.
#They are broken into categories for easy readability. This entire script could have been a long one-liner.

#I've tested this script on Pop_OS!, elementaryOS, and Linux Mint, so it will probably work on anything Ubuntu based. Some package names may be different though. I had to modify a few package names for this to work on Debian

#install some programming languages. I have some of these for playing around with. Others are simply here for compiling or running random bits of software I sometimes use.
#None of these take up a bunch of space, but you can delete any you know you'll never need.
sudo apt install -y \
	gobjc++ \
	gcc-multilib \
	gcc \
	g++ \
	clisp \
	nodejs \
	npm \

#the fun stuff. A list of graphic software, delete the line for any software you don't need or want. I don't use all of these things, but I tried to cover as many bases as I could.
sudo apt install -y \
	firefox \
	chromium-browser \
	deluge \
	gimp \
	inkscape \
	krita \
	blender \
	openscad \
	freecad \
	kicad \
	audacity \
	libreoffice libreoffice-gtk \
	vlc \
	tilda \
	terminology

#super useful commandline tools and utilities. These are what I spend most of my time using.
sudo apt install -y \
	tmux \
	vim \
	ffmpeg \
	mplayer \
	feh \
	wordgrinder \
	htop \
	git \
	xboxdrv \
	screen \
	curl \
	wget
	xrandr \
	ssh \
	rsync
	lolcat #This one is just fun. Test it out with something like "cat *.sh | lolcat"

#this is a set of dependencies for compiling the godot engine from source.
sudo apt install -y build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev \
    libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libfreetype6-dev libssl-dev libudev-dev \
    libxi-dev libxrandr-dev

#dependencies for Steam
sudo apt install -y python-apt xterm

#installs ranger, a file manager, and w3m, a web browser. w3m is needed to display images in ranger. The rest of the programs are other packages that go with ranger
sudo apt install -y ranger w3m w3m-img highlight atool caca-utils poppler-utils

#dconf-editor is useful on a lot of systems, I only ever use it in elementary to customize pantheon a little bit though. If you don't know you need this, you probably don't.
#software-properties-common lets you add PPA's on elementaryOS. If you're running elementary I definitely recommend this. You shouldn't need this on any other system.
#sudo apt install -y dconf-editor software-properties-common

#this is only needed on a gnome system. I don't use gnome too much, but gnome-tweak-tool is a requirement when I do.
#sudo apt install -y gnome-tweak-tool

#python, and some python utilities
sudo apt install -y python3 python3-setuptools python3-dev

#these are requirements for installing ruby/rails. RVM installs these automatically, but this step still saves me time
sudo apt install -y autoconf automake bison libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev sqlite3 libgmp-dev

#these are essentials for building/compiling certain types of projects. I use these semi-frequently, and would recommend just installing them if you've ever compiled something from source.
#you may need them down the road. I'm lazy and like to just go ahead and install them.
sudo apt install -y make cmake build-essential

#I don't use emacs. But to please Stallman and the church of Emacs, I'm including this here.
#sudo apt install -y emacs

#MySQL and utilities. I used to use mysql in my Rails apps.
#sudo apt install -y mysql-workbench libmysqlclient-dev mysql-server mysql-utilities libaio1 #libaio1 is a needed library for mysql.

#postgresql and utilities. I use postgresql in my Rails apps.
#sudo apt install -y postgresql postgresql-contrib libpq-dev

#this is used for developing gtk3 apps. You may also need it to compile a project from source, if it uses gtk3. I couldn't find a better group to throw this into.
#sudo apt install -y libgtk-3-dev

#These are 32 bit compatibility libraries that are needed to develop android apps on a 64bit system.
#sudo apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

#requirements for compiling the R programming language. This script doesn't compile the R langauge. But, I compile R on all of my machines, so it was convient for me to put this stuff here.
#sudo apt install -y libreadline-dev libcurl4-openssl-dev libpcre3-dev libbz2-dev liblzma-dev libx11-dev libblas-dev xorg-dev #gobjc++ gfortran fort77 curl build-essential # are also all required

#dependencies to compile and install i3-gaps.
#sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev dh-autoreconf

#installs dependencies needed to compile qutebrowser
#sudo apt install -y libglib2.0-0 libgl1 libfontconfig1 libx11-xcb1 libxi6 libxrender1 libdbus-1-3

#dependencies to compile and install suckless terminal st
#sudo apt install -y libx11-dev libxft-dev libxext-dev

#dependencies for compiling polybar, which i prefer over i3's default status bar
#sudo apt-get install python-xcbgen libxcb-ewmh-dev libxcb-icccm4-dev libxcb1-dev xcb-proto libxcb-util-dev libxcb-image0-dev libxcb-randr0-dev libxcb-xkb-dev libalsaplayer-dev wireless-tools libcurlpp-dev  libcairo2-dev
