# PPA

## What is PPA and how to work with it?

PPA stands for Personal Package Archive (something exclusive to a developer and is not officially endorsed by the distribution). The PPA allows application developers and Linux users to create their own repositories to distribute software. With PPA, you can easily get newer software version or software that are not available via the official Ubuntu repositories.

<u>A repository is a collection of files that has information about various software</u>, their versions and some other details like the checksum. For instance, each Ubuntu version has its own official set of four repositories: Main, Universe, Restricted, Multiverse. So <u>basically it's a web URL</u> that has information about the software.

Imagine if a software developer releases a new version of the software. Ubuntu won't make it available immediately. There is a procedure to check if the new version of the software is compatible with the system or not. This ensures the stability of the system.

But this also means that it will be some weeks or in some cases, some months before it is made available by Ubuntu. Not everyone would want to wait that long to get their hands on the new version of their favorite software.

Similarly, suppose someone develops a software and wants Ubuntu to include that software in the official repositories. It again will take months before Ubuntu makes a decision and includes it in the official repositories.

Another case would be during beta testing. Even if a stable version of the software is available in the official repositories, a software developer may want some end users to test their upcoming release. How do they enable the end user to beta test the upcoming release?

### How to use PPA?

Ubuntu provides a platform called Launchpad that enables software developers to create their own repositories. An end user i.e. you can add the PPA repository to your sources.list (`/etc/apt/sources.list` in Ubuntu) and when you update your system, your system would know about the availability of this new software and you can install it using the standard sudo apt install command like this.

```bash
sudo add-apt-repository ppa:dr-akulavich/lighttable
sudo apt-get update
sudo apt-get install lighttable-installer
```

To summarize:

- `sudo add-apt-repository <PPA_info>` — this command adds the PPA repository to the list.
- `sudo apt-get update` — this command updates the list of the packages that can be installed on the system.
- `sudo apt-get install <package_in_PPA>` — this command installs the package.

> You see that it is important to use the command sudo apt update or else your system will not know when a new package is available. Ubuntu 18.04 and higher versions automatically run the update to refresh the list of packages but I cannot vouch for other distributions. It’s a good practice to run this command.

```bash
sudo add-apt-repository ppa:dr-akulavich/lighttable
```

You would notice that this command doesn't have a URL to the repository. This is because the tool has been designed to abstract the information about URL from you.

If you add ppa:dr-akulavich/lighttable, you get Light Table. But if you add ppa:dr-akulavich, you'll get all the repository or packages mentioned in the ‘upper repository’. It's hierarchical.

Basically, when you add a PPA using add-apt-repository, it will do the same action as if you manually run these commands:

```bash
deb http://ppa.launchpad.net/dr-akulavich/lighttable/ubuntu YOUR_UBUNTU_VERSION_HERE main
deb-src http://ppa.launchpad.net/dr-akulavich/lighttable/ubuntu YOUR_UBUNTU_VERSION_HERE main
```

The above two lines are the traditional way to add any repositories to your sources.list. But PPA does it automatically for you, without wondering about the exact repository URL and operating system version.

One important thing to note here is that when you use PPA, it doesn’t change your original sources.list. Instead, it creates two files in /etc/apt/sources.d directory, a list and a back up file with suffix ‘save’.

```bash
ls /etc/apt/sources.list.d/
additional-repositories.list      nordvpn.list
atareao-telegram-focal.list       official-package-repositories.list
brave-browser-release.list        oibaf-graphics-drivers-focal.list
gezakovacs-ppa-focal.list         openjdk-r-ppa-focal.list
hluk-copyq-focal.list             skype-stable.list
libretro-stable-focal.list        spotify.list
linuxuprising-shutter-focal.list  steam.list
lutris-team-lutris-focal.list     sublime-text.list
mmstick76-alacritty-focal.list    vscode.list
```

The files with suffix ‘list’ has the command that adds the information about the repository.

```bash
cat /etc/apt/sources.list.d/additional-repositories.list 
deb https://typora.io/linux ./
deb https://dl.winehq.org/wine-builds/ubuntu/ focal main
```

This is a safety measure to ensure that adding PPAs don't mess with the original sources.list. It also helps in removing the PPA.

> About installing and removing PPA read [here](https://itsfoss.com/ppa-guide/).

### Why PPA? Why not DEB packages?

You can install deb packages using graphical interface. Why PPA?

The answer lies in the update procedure. If you install a software using a DEB package, there is no guarantee that the installed software will be updated to a newer version when you run sudo apt update && sudo apt upgrade.

It's because the apt upgrade procedure relies on the sources.list. If there is no entry for a software, it doesn't get the update via the standard software updater.

So does it mean software installed using DEB never gets an update? No, not really. It depends on how the package was created.

Some developers automatically add an entry to the sources.list and then it is updated like a regular software. Google Chrome is one such example.

Some software would notify you of availability of a new version when you try to run it. You'll have to download the new DEB package and run it again to update the current software to a newer version. Oracle Virtual Box is an example in this case.

For the rest of the DEB packages, you'll have to manually look for an update and this is not convenient, especially if your software is meant for beta testers. You need to add more updates frequently. This is where PPA come to the rescue.

### Official PPA vs unofficial PPA

When dev create PPA for their software, it is called the official PPA. But at times, individuals create PPA of projects that were created by other developers.

Why would someone do that? Because many developers just provide the source code of the software and you know that [installing software from source code in Linux](https://itsfoss.com/install-software-from-source-code/) is a pain and not everyone could or would do that.

This is why volunteers take it upon themselves to create a PPA from those source code so that other users can install the software easily.

### Is it safe to use PPA?

It is a subjective question. Purists abhor PPA because most of the time PPAs are from third-party developers. But at the same time, PPAs are popular in the Debian/Ubuntu world as they provide an easier installation option.

As far as the security is concerned, it's less likely that you use a PPA and your Linux system is hacked or injected with malware. I don't recall such an incident ever happened so far.

Official PPAs can be used without thinking twice. Using unofficial PPA is entirely your decision.

As a rule of thumb, you should avoid installing a program via a third party PPA if it the program requires sudo access to run.

## List all the PPA repositories added to the system

For those who just want to check the PPAs they have installed without actually *doing* anything with them automatically you can do:

```bash
apt-cache policy
```

This is nice and simple, however the output also includes Ubuntu base repositories. If you're going to do that you may as well use the full, final command used in the link you gave as your source:

```bash
apt-cache policy | grep http | awk '{print $2 $3}' | sort -u
```

The output is better organized and easier on the eyes.

> Note: `apt-cache policy` will only show the repos after you have run `apt-get update`. If you just added a repo with `add-apt-repository`, it will not show up with `apt-cache policy` until you run `apt-get update`

## References

1. https://itsfoss.com/ppa-guide/
2. https://itsfoss.com/install-software-from-source-code/
3. https://askubuntu.com/questions/545881/list-all-the-ppa-repositories-added-to-my-system

