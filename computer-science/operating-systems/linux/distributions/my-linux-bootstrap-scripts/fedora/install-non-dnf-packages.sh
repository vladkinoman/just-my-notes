#Installing Brave Browser. https://github.com/signalapp/Signal-Desktop/issues/2483#issuecomment-401047201
sudo apt install apt-transport-https curl gnupg
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

#Installing Lutris.
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris

#InstallingMinigalaxy
#using wget
wget --no-check-certificate https://github.com/sharkwouter/minigalaxy/releases/download/1.0.0/minigalaxy_1.0.0_all.deb
#using curl
#curl -k -O -L https://github.com/sharkwouter/minigalaxy/releases/download/1.0.0/minigalaxy_1.0.0_all.deb
sudo dpkg -i minigalaxy_1.0.0_all.deb
sudo apt install -f

#Installing Typora.
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
# install typora
sudo apt-get install typora

#Installing Steam.
wget --no-check-certificate https://steamcdn-a.akamaihd.net/client/installer/steam.deb
sudo dpkg -i steam.deb
sudo apt install -f

#Installing Skype.
wget --no-check-certificate https://go.skype.com/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb
sudo apt install -f

#Installing npm.
npm install -g tldr

#Installing CoolRetroTerm.
wget https://github.com/Swordfish90/cool-retro-term/releases/download/1.1.1/Cool-Retro-Term-1.1.1-x86_64.AppImage
chmod a+x Cool-Retro-Term-1.1.1-x86_64.AppImage
./Cool-Retro-Term-1.1.1-x86_64.AppImage

#Installing kitty. The binaries will be installed in the standard location for your OS, /Applications/kitty.app on macOS and ~/.local/kitty.app on Linux. The installer only touches files in that directory. To update kitty, simply re-run the command.
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

#Installing CopyQ.
wget --no-check-certificate https://github.com/hluk/CopyQ/releases/download/v3.13.0/copyq_3.13.0_Debian_10-1_amd64.deb
sudo dpkg -i copyq_3.13.0_Debian_10-1_amd64.deb
sudo apt install -f
