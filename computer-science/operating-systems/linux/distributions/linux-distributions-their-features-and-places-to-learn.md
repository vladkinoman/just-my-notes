# Linux distributions, their features and places to learn

## Linux distributions

In fact, many people say that the best way to learn Linux is to use the "Trial and error" approach. So, you need to install the Linux distribution, use it, break it and fix it. :)

You will notice some differences between Linux versions, specifically:

- Desktop Environments.
  There are many good desktop environments for different needs with different resource requirements (e.g. RAM). Among the popular ones are GNOME 3, Cinnamon, XFCE etc. Those environments are available for Ubuntu and Linux Mint distributions. Other distros have a more modest selection of desktops available, however, often offered as "spins" that contain different desktop environments. An example distribution that does this is Fedora.
- Package managers.
  Various methods for installing software are included with each Linux distribution, but they have an underlying package manager. 
  On Debian-based distros such as Ubuntu and Linux Mint, dpkg is the choice, accessed via the apt dependency resolver. For CentOS, RPM is the package manager, subject to commands using yum.
- Display servers.
  This software coordinates data between the computer hardware and the display, enabling the user to interact with the graphical user interface (GUI). 
  Historically, the X.Org Server has been most commonly used. Various alternatives are available, however, such as Mir, and SurfaceFlinger which is used on Android (which uses the Linux Kernel). The Wayland display server is seen as the future on Linux, with most popular distros adopting it.
- Goals and aims.
  Some distributions exist because they like some aspects of an existing distro but wish to replace some software packages. Meanwhile, Linux distributions can differ in their aims.
  For example, Linux Mint is based on Ubuntu, but contains different system tools, desktop environment, and a minty-green theme. Its primary aim is to provide a simple stepping on point for Windows and macOS users to start using Linux.Similarly, Debian aims to provide an extremely stable distribution (and therefore contains older software).
  Beyond the realm of universal distributions, some Linux projects have specific purposes. For example, gaming distros like Steam OS, or multimedia distros like Fedora Design Suite.
- Open source philosophy.
  While GNU/Linux is perhaps the most famous open source project, not all distros are 100 percent open source because project leaders have differing stances on open source.
  As an example, Ubuntu doesn't have an issue with including proprietary software in its repositories. You'll find the Steam gaming client is easily available, while graphics drivers from AMD and Nvidia can be installed. Fedora, conversely, has a strong open source policy that prevents it from including any proprietary software in its repositories.
  Of course, at the end of the day you can do whatever you want with your chosen Linux distro. Regardless of the distribution project's policies, there is no block on what you install.
  In short, while many Linux distributions might have lofty aims of open source compliance, not all are open source.
- Type of the distribution.
  - Rolling distros get updates on an hourly basis. So you’ll get the newest version of each app/software you install.
  - Stable distros get updates less frequently and are considered more stable. But you won’t always get the latest versions of the software you use.

Choose a distribution according to your needs.

> - [ ] means I haven't tried this distribution.
> - [x] means I have tried this distribution (>= 3 months). 

### Distributions for beginners

- [x] Ubuntu: 
  - best Linux OS for beginners and personal machines, offers **ease of use** and a great user interface experience that has led to its wide adoption, based on Debian.
  - package manager - Debian package management tools (dpkg - low level tool, APT - high level tool).
  - desktop environment - GNOME 3 (cool and resource hungry) or Unity (very bad desktop environment manager).
  - stable distro (not rolling).
  - great for any platform, desktop, laptop and server.
  - **useful for software engineering/IT/Web**. It's the best Linux distribution for programming!

  <details><summary>Why is this the best Linux distribution for programming? (from Quora)</summary> If you want a core that is most often targeted by developers, you may want to go with Ubuntu, but I never experienced a problem developing on Arch and deploying to Ubuntu, so this shouldn't be a problem.</details>

  Website: [ubuntu.com](https://ubuntu.com/). 
  Wiki: [help by the community](https://help.ubuntu.com/community/CommunityHelpWiki).

- [x] Lubuntu — Ubuntu's flavour for old PCs; desktop environment - LXDE/LXQT (lightweight and similar to Windows XP, Lubuntu 18.04 LTS is the last release with LXDE). I use it because it's fast.
  Website: [lubuntu.net](https://lubuntu.net/).

  > I tried to install Lubuntu 20.04 LTS and encountered this [error](https://bugs.launchpad.net/ubuntu/+source/calamares/+bug/1851188). The problem is occur when I try to begin the installation after choosing the free partition (along with the 3 primary partitions already) for Lubuntu.
  
- [x] Linux Mint:

  - based on Ubuntu. It uses Ubuntu’s software repositories so the same packages are available on both distributions. **Less bloated than Ubuntu**.
  
  - package manager - Debian package manager.
    Linux Mint dropped support for [Ubuntu](https://itsubuntu.com/things-to-do-after-installing-ubuntu-20-04-lts/)‘s Snap. In Linux Mint 20, APT forbids snapd from getting installed.

    <details><summary>Lead developer of Linux Mint, Clement “Clem” Lefebvre explains.</summary> When snap was announced it was supposed to be a solution, not a problem. It was supposed to make it possible to run newer apps on top of older libraries and to let 3rd party editors publish their software easily towards multiple distributions, just like Flatpak and AppImage. What we didn’t want it to be was for Canonical to control the distribution of software between distributions and 3rd party editors, to prevent direct distribution from editors, to make it so software worked better in Ubuntu than anywhere else and to make its store a requirement. <p>
    If you’re a Fedora user and you want to install Spotify, you’re told to go tohttps://snapcraft.io/spotify. Spotify doesn’t distribute RPM packages, appimage, Flatpak or anything useful to a Fedora user who wants to download it, or to a Fedora maintainer who wants to add it to a repository. Fedora users are told to go to what is essentially a commercial store operated by a RedHat competitor where stats tell them their distribution is only 7th best. <p>
    A year later, in the Ubuntu 20.04 package base, the Chromium package is indeed empty and acting, without your consent, as a backdoor by connecting your computer to the Ubuntu Store. Applications in this store cannot be patched, or pinned. You can’t audit them, hold them, modify them or even point snap to a different store. You’ve as much empowerment with this as if you were using proprietary software, i.e. none. This is in effect similar to a commercial proprietary solution, but with two major differences: It runs as root, and it installs itself without asking you.</details>
  
  - desktop environment - KDE/GNOME/Cinnamon/MATE/ Xfce/KDE SC 4.
  
  - great for desktop and laptop.
  
  <details><summary>Comments from Wiki.</summary> Linux Mint is a community-driven Linux distribution based on Ubuntu or Debian that strives to be a "modern, elegant and comfortable operating system which is both powerful and easy to use." Linux Mint provides full out-of-the-box multimedia support by including some proprietary software, such as multimedia codecs, and comes bundled with a variety of free and open-source applications.</details>
  
  Website: [linuxmint.com](https://www.linuxmint.com/).

### Distributions for medium level users

- [ ] Debian:
  - Debian may not get the latest updates, but it's **extremely stable**. If you want a good "core" operating system, this is the one for you. Excellent choice for more professional work.
  - package manager - Debian package management tools.
  - desktop environment - GNOME/XFCE.
  - rolling distro (that's why Fedora is more user friendly than Debian).
  - Debian is an overall great operating system for any platform.
  - useful for software engineering/IT/Web.

  <details><summary>Comment from Quora.</summary> Ubuntu’s more difficult father. It is more strict on open-source software, by default, but it does have an official repository that’s not enabled by default that contains non-free software.</details>

  Website: [debian.org - user-manuals](https://www.debian.org/doc/user-manuals).

- [ ] CentOS:
  - excellent choice for professional work, based on Red Hat Linux, I heard that people use it in **enterprise** (with Red Hat Enterprise Linux).
  - package manager - Yum (command line), PackageKit (graphical), .rpm (binaries format) (rpm packager manager is also used by RHEL).
  - desktop environment - bash, GNOME Shell.
  - **servers**, desktop computers, workstations.
  - useful for software engineering/IT/Web (same for RedHat).

  <details><summary>Comment from Quora</summary> CentOS — A derivative of Fedora that uses much older software and is best reserved for servers, but some desktop users do exist. Its repositories are tiny so beware if you need a wide selection of software you may be disappointed by it.</details>

  <details><summary>Why not CentOS for programming (from Quora)</summary> I can’t tell you how many times I’ve had to build things from source on CentOS6 on my work servers. In one extreme case I had to rebuild a python pip package because of some glibc conflict to make it work on CentOS6. I wasted one or two work days figuring out how to make the pip package correctly which actually involved building multiple other things from source to create the pip package. CERN’s “devtoolset” is a life saver because if they didn’t have it I wouldn’t recommend CentOS for development at all. devtoolset will let you get the latest gcc and other things when necessary, but still it’s somewhat of a workaround. <p>
        What’s most important for me when considering a distro is productivity, and wasting a full work day compiling from source is interesting the first two or three times and then gets pretty old pretty fast. As a server to host things CentOS could do its job as it’s more “stable” feeling. However, if you want to use the latest packages to develop something, you will have to work around the countless out-of-date packages on CentOS.
        </p></details>


  Website: [centos.org](https://www.centos.org/).

- [ ] Fedora:
  - backed by Red Hat, the Fedora Project is community driven containing **open-source** and **free software**. Red Hat Enterprise Linux branches off Fedora (Fedora is based on Fedora Core, which is based on Red Hat Linux, not RHEL), so think of Fedora as an upstream RHEL operating system. Eventually RHEL will get updates from Fedora after thorough testing and quality assurance. Think of Fedora as an Ubuntu equivalent that uses a Red Hat backend instead of Debian. If you want to use a Red Hat based operating system, this is a **user friendly** version.
  - uses Red Hat package manager.
  - desktop environment - Gnome Shell.
  - sort of a “mix” between a rolling distro and a stable distro.
  - Fedora is great if you want a Red Hat based operating system **without the price tag**. Recommended for desktop and laptop.

  <details><summary>Comment from Quora.</summary> Fedora and openSUSE, in my opinion, are more challenging in part because they are strict on open-source and aside from the binary blobs on their kernels have no proprietary software in their official repositories. If your PC has hardware that’s completely compatible with open-source software (mostly Intel products are like their WiFi chips, CPUs, graphics cards, etc.) and you need no proprietary apps (including Google Chrome) Fedora will probably be easy for you to use.</details>

  Website: [getfedora.org](https://getfedora.org/).

### Distributions for advanced users

- [ ] Arch Linux:
  - minimalistic, pain to setup and keep running (if you are new, start with something easy, you can always upgrade). Arch is a **lightweight** and **flexible** Linux distribution driven 100% by the community. **You receive software in binary form** (you shouldn't compile it from source - that's why Arch is more user friendly than Gentoo - sure wiki is the main factor here). You really need to get your hands dirty to understand the system and its functions, but in turn you get complete and total control of your system. If you want a lightweight operating system and really want to understand Linux use Arch!
  - package manager - Pacman, to install, update and manage packages.
  - desktop environment - many of them.
  - Similar to Debian, Arch uses a **rolling release model** (rolling distro) so incremental updates eventually become the Stable release.
  - great for desktop and laptop. If you also have a small device such as a Raspberry Pi and need to stick a lightweight OS on it, you can’t go wrong with Arch.
  - useful for Computer Engineering/System Programming and Hardware Engineering (+ software engineering - is this the best distributive for all of these tasks?).

  <details> <summary>Comment from Quora.</summary>No official automated installer but its documentation is great and its installation process is simpler than it is for most other distros that lack an installer. It contains the bare minimum software required by a distro by default, but its repositories are some of the largest in the Linux world. It also follows a bleeding-edge rolling release model, so it has the very latest software (beware occasionally package maintainers get lazy or busy and don’t update packages, but this is true for all distros, but generally it’s bleeding-edge) just rolled out onto it.</details>

  Website: [archlinux.org](https://www.archlinux.org/).

- [ ] Gentoo Linux:
  - minimalistic, pain to setup and keep running (if you are new, start with something easy, you can always upgrade). Gentoo offers ridiculous flexibility with the operating system at a price. It’s made for advanced users who don’t mind getting their hands dirty with the system. **Compile your software from source**.
  - package manager - Portage, very modular and easy to maintain, which plays a big part in the operating system as a whole being very flexible.
  - desktop environment - Xfce/LXQt, KDE, GNOME, Fluxbox.
  - rolling distro.
  - great for desktop and laptop.
  - useful for Computer Engineering/System Programming and Hardware Engineering.

  <details><summary>Comment from Quora.</summary>The prototypical source-based  distribution, where each piece of software is compiled from source on one’s own machine (as opposed to being built on a build server and distributed as a binary package for users to install) using its package manager, Portage. Portage allows users to set several options to adjust how each package is configured and compiled. Gentoo is named after the Gentoo Penguin (the fastest known species of penguin) as theoretically by tinkering with configure and compile options it should be possible to optimize one’s system for performance and get markedly improved system speed.<p>
      The major difference between Arch and Gentoo is that Gentoo requires that you use your own customized kernel. Download the Gentoo iso file and install it while compiling and configuring your own unique kernel on the fly. If you are able to do so, then now the next step is to learn about the internal wokrings of the Linux kenel.
      </p></details>

  <details><summary>Why not Gentoo for programming (from Quora)</summary> Things like Gentoo feel cool because you compile things from source and you can use compile flags, have multiple versions, etc etc but you can add flags to
  “./configure” if you had to build from source too. Leaving my computer on for 36 hrs to build Google Chrome is not my idea of a productive work environment.</details>

  Website: [gentoo.org](https://www.gentoo.org/).

### Distributions for... gods :laughing: 

- [ ] Linux From Scratch (LFS) — excruciatingly painful to setup (if you want source, see above (Gentoo and Arc)), rolling, useful for Computer Engineering/System Programming and Hardware Engineering.
  <details><summary>Comment from Quora.</summary>Arguably the single most challenging Linux distribution to set up. It’s essentially the way the first Linux system ever was set up, by compiling and installing each piece of software from the ground up. In it the package manager is you, the user, as you must build every package manually and install it. A base LFS system for me takes > 8 hours to install. You’d be essentially insane to install this outside a VM the first time you attempt to install it. <p>LFS is both the name of a Linux distribution and a book that contains instructions for how to build a LFS system. The books is rather quite extensive and clear in how to build a LFS system it’s just putting into practice and having the patience to do it that is the tricky part. <p> As you are the package manager package updates can get annoying with time. Just think about having to manually compile each package update, especially considering even a base LFS system contains a couple of dozen of packages and most of these packages get updated fairly frequently, especially the kernel. <p> The other thing is keeping track of the files belonging to each package can be annoying, but it is necessary especially when one does package updates, as left over files can confuse packages when you’re trying to configure and compile them as they may build against previous versions of a library. There are techniques around this like GoboLinux’s method of package management, storing each package in its own unique directory and setting up symlinks to help make the other packages detect the files they depend on.</details>

  Website: [linuxfromscratch.org](http://www.linuxfromscratch.org/index.html).

---

Or, just determine where you fit on this chart:

![Bearded men: Ubuntu, Fedora, Debian, Arch, Gentoo, LFS](https://qph.fs.quoracdn.net/main-qimg-9e304ad7584dc97abaee6bcaff44d2e3.webp)

### Tiny distributions for old PCs

Tiny Linux distributions are powerful innovations: having an entire operating system drive a computer with less than 1GB of storage and half as much RAM is the ultimate software hack.

- [ ] Tiny Core:
  - Minimalistic, pain to setup. At 11MB for a text console and 16MB for a GUI, [Tiny Core Linux](http://tinycorelinux.net/) is almost impossibly small.

  - Without a GUI, Tiny Core runs well on a mere 64MB of RAM.

  - [Download Tiny Core](http://tinycorelinux.net/welcome.html) and write it to a thumb drive with **dd** or [Etcher](https://www.balena.io/etcher/).

    Installing Tiny Core is easy, once you download the **tc-install** or **tc-install-GUI** application using the **Apps** icon in the launcher bar at the bottom of the screen.

  - Since it comes with little more than a text editor and a terminal, the first thing you should do is install some applications. The **Apps** icon in the bottom launcher bar displays all the Tiny Core packages available to you. The **Apps** repository also includes important drivers, so it's useful when you're looking to get a WiFi card or a printer working.
    The application selection is a good mix between user-centric apps, like office and graphics applications, and server-centric, such as [Samba](https://www.samba.org/) and web servers.

  - Tiny Core is ideal for old computers with few resources, network boot images, and anyone who values applications over the OS. Tiny Core is a great weekend project: build the OS you want from 16MB until you have just as much of an OS as you need.

- [ ] SliTaz:
  - The [SliTaz Linux](http://www.slitaz.org/en/) image is about 51MB, about four times the size of Tiny Core, with an impressive collection of drivers and applications included. In fact, if you didn't know better, you might think you booted into a 1GB Ubuntu image because everything you'd expect from a basic starter image is there: text editor, web browser, paint program, spreadsheet application, and so on.
    At boot time, you can choose to run SliTaz without a GUI; it runs nicely on a mere 64MB of RAM.
  - The rolling release version is roughly 50MB and is updated weekly. If you fall in love with SliTaz, you can choose a download that's better for your needs—if the rolling release proves to be too fresh for you.
    Once you've downloaded your choice of SliTaz image, write it to a thumb drive with dd or Etcher and reboot.
  - The **TazPanel** application is SliTaz's control center. If you're a fan of OpenSUSE or Mageia (née Mandrake), you might find TazPanel familiar, at least in concept: it's a single application that provides access to system configuration, hardware detection, user and group management, system updates, and application installation.
    Available applications satisfy most basic requirements, meaning if you're not picky about which application you use to accomplish a task, then SliTaz's repositories probably have something for you. If you have specific requirements (GIMP 2.10 instead of GIMP 2.8, for instance), then you'll have to learn how to generate SliTaz packages. The good news is that the tazpkg command can convert from several packaging formats.
  - SliTaz is a fast, small Linux distribution with a centralized control panel that makes it easy to learn. Because its packaging tools can convert from other Linux packaging formats, its application selection is theoretically vast, making it easy for you to design your work environment with all your favorite tools. SliTaz is small but lethal, just like its arachnid logo.
- [ ] Bodhi Linux:
  - [Bodhi Linux](https://www.bodhilinux.com/) might not look tiny at first glance, with an ISO image of 740MB, but once it's installed, you'll be amazed at just how tiny it is. Bodhi runs smoothly on only 512MB of RAM but looks and feels like the desktop of tomorrow. Bodhi uses the [Enlightenment](https://www.enlightenment.org/) desktop, a beautiful user interface that's lovingly crafted to be both small and powerful.
    Bodhi doesn't just use Enlightenment, though, it adds to it. Bodhi's configuration applications and system setting panels are custom interfaces to Enlightenment's sometimes overwhelming array of options. Bodhi makes some sane default choices for you and provides a subset of options. If you're a die-hard Enlightenment user, Bodhi's interpretation might not be pure enough for you, but for many users, Bodhi brings focus to the Enlightenment desktop.
  - [Download Bodhi Linux](https://www.bodhilinux.com/download), write it to a thumb drive with **dd** or [Etcher](https://www.balena.io/etcher/), and reboot. The installation application is **Ubiquity**, so the process is the same as installing Ubuntu.
  - Bodhi is based on the latest long term support (LTS) Ubuntu Linux release, so your available software knows almost no bounds. If it's available for Ubuntu Linux, Bohdi has access to it.
  - Bodhi Linux is a step down from the size of a typical Ubuntu install and a step up from many other minimalist Ubuntu environments because it uses Enlightenment. If you're looking for a Linux distribution that runs lighter than most without resorting to overlay filesystems and application modules, then Bodhi is the distribution for you.
- [ ] Puppy Linux:
  - Before there was Tiny Core or SliTaz or [AntiX](https://antixlinux.com/) or Porteus, there was [Puppy Linux](http://puppylinux.com/). One of the original tiny Linux distributions, Puppy has endured for a decade and a half as a reliable, bootable OS for old computers and new users alike.
    Upon first boot, Puppy does its best to guide the user through any necessary steps to ensure everything works as expected. It's a lot of windows to wade through, but once you get through it all, you know without a doubt what works and what doesn't before you choose whether to install.
    Puppy is almost 300MB and failed to work on anything under 1GB RAM in my tests, so it's not exactly the tiniest Linux available. However, it's still a great, under-1GB operating system, and of the OSes in that category, it's one of the very friendliest.
  - Download Puppy Linux and write it to a thumb drive with dd or Etcher or burn it to a CD or DVD, then reboot.Puppy can install onto nearly anything that accepts data. The installer application, available from the top launcher bar, is called **Puppy Installer**, and it manages installing Puppy and applications for Puppy. Puppy can boot from a thumb drive, an optical disc, a hard drive, and even an SD card.
  - The **Puppy Installer** application is also used to install apps onto Puppy. Because Puppy is based on Ubuntu, there aren't likely to be any Linux packages missing from its repositories, and if there are, you can probably use a [Flatpak](https://docs.fedoraproject.org/en-US/fedora-silverblue/getting-started/#flatpak).
  - Puppy is the original tiny Linux. While it's not the tiniest any more, it's by far the easiest.
- [ ] Linux Lite
- [ ] AntiX Linux
- [ ] MX Linux
- [ ] Lubuntu

## References

1. https://www.makeuseof.com/tag/whats-the-difference-between-linux-distributions-if-theyre-all-linux-makeuseof-explains/
2. https://linuxjourney.com/
3. https://itsubuntu.com/linux-mint-20-dropped-ubuntus-snap/#:~:text=Linux%20Mint%20Dropped%20Ubuntu's%20Snap&text=What%20we%20didn't%20want,make%20its%20store%20a%20requirement.
4. https://opensource.com/article/19/6/linux-distros-to-try
5. https://linoxide.com/distros/lightweight-linux-distros-for-old-laptop/
6. https://www.tecmint.com/linux-distributions-for-old-computers/
7. https://embeddedinventor.com/best-lightweight-linux-distros-comparison-analysis/