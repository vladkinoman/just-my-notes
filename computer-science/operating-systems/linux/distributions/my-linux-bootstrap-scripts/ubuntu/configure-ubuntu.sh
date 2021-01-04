#/bin/bash
#Notice: I took this from Derek Briggs's repository on GitLab to automate the process of installing my desired software. I thank him!
sudo apt update
sudo apt upgrade -y

#installs all the programs in the install-apt-packages script. Edit that file to your liking.
sudo ./ubuntu/install-apt-packages.sh

#installs these just incase they were accidentally removed from the install-apt-packages script
sudo apt install python3 python3-setuptools

#this installs pip and some pip packages. I can't live without youtube-dl. You probably don't need the other ones.

sudo easy_install3 pip

pip install --upgrade pip

pip install \
	youtube-dl \
	virtualenvwrapper \
	flask \
	flask_sqlalchemy \
	django \
	mysqclient

#this installs some requirements for atom-text-editor. They are placed here just incase I forget I need them and delete them from the other script
sudo apt install -y nodejs npm

#this line installs any debs that you have downloaded and left in your downloads folder. I use it for Atom and random stuff like the vivaldi web browser
#I could have included a PPA to install atom from. But, that would have involved having to watch the script and hit enter. And PPA's can have dated software.
#downloading the deb for Atom guarantees me the latest version. I also do this with libreoffice.
sudo apt install -y ~/Downloads/*.deb

#Apt will download certain packages, necessary to install other packages, but not needed after that process.
#this line lets Apt remove them.
sudo apt autoremove
