# Resources for learning Linux

## Linux distributions

In fact, many people say that the best way to learn Linux is to use the "Trial and error" approach. So, you need to install the Linux distribution, use it, break it and fix it. :)

> Notes to get started:
>
> - Rolling distros get updates on an hourly basis. So you’ll get the newest version of each app/software you install.
>
> - Stable distros get updates less frequently and are considered more stable. But you won’t always get the latest versions of the software you use.

Distributions for beginners:

- Ubuntu: 

  - best Linux OS for beginners and personal machines, offers **ease of use** and a great user interface experience that has led to its wide adoption, based on Debian.

  - package manager - Debian package management tools (dpkg - low level tool, APT - high level tool).

  - desktop environment - GNOME 3 (cool and resource hungry) or Unity (very bad desktop environment manager).

  - stable distro (not rolling).

  - great for any platform, desktop, laptop and server.

  - **useful for software engineering/IT/Web**. It's the best Linux distribution for programming!

    <details><summary>Why is this the best Linux distribution for programming? (from Quora)</summary> If you want a core that is most often targeted by developers, you may want to go with Ubuntu, but I never experienced a problem developing on Arch and deploying to Ubuntu, so this shouldn't be a problem.</details>

  Website: [ubuntu.com](https://ubuntu.com/). 
  Wiki: [help by the community](https://help.ubuntu.com/community/CommunityHelpWiki).

- Lubuntu — Ubuntu's flavour for old PCs; desktop environment - LXDE/LXQT (lightweight and similar to Windows XP). I use it because it's fast.
  Website: [lubuntu.net](https://lubuntu.net/).

- Linux Mint:

  - based on Ubuntu. It uses Ubuntu’s software repositories so the same packages are available on both distributions. **Less bloated than Ubuntu**.
  - package manager - Debian package manager.
  - desktop environment - KDE/GNOME/Cinnamon/MATE/ Xfce/KDE SC 4.
  - great for desktop and laptop.

  <details><summary>Comments from Wiki.</summary> Linux Mint is a community-driven Linux distribution based on Ubuntu or Debian that strives to be a "modern, elegant and comfortable operating system which is both powerful and easy to use." Linux Mint provides full out-of-the-box multimedia support by including some proprietary software, such as multimedia codecs, and comes bundled with a variety of free and open-source applications.</details>
  <details><summary>Why not Mint for programming (from Quora)</summary> I would’ve recommended Mint first but I had a terrible experience where an update broke my wifi driver and through some stupidity on my part I have to admit, I broke my Mint partition on my home computer. Beyond my personal issue though, while a lot of docs for Ubuntu will work for Mint this isn’t 100% the case, and since support online is so important, I must recommend Ubuntu over Mint.</details>
Website: [linuxmint.com](https://www.linuxmint.com/).

Distributions for medium level users:

- Debian:

  - Debian may not get the latest updates, but it's **extremely stable**. If you want a good "core" operating system, this is the one for you. Excellent choice for more professional work.
  - package manager - Debian package management tools.
  - desktop environment - GNOME/XFCE.
  - rolling distro (that's why Fedora is more user friendly than Debian).
  - Debian is an overall great operating system for any platform.
  - useful for software engineering/IT/Web.

  <details><summary>Comment from Quora.</summary> Ubuntu’s more difficult father. It is more strict on open-source software, by default, but it does have an official repository that’s not enabled by default that contains non-free software.</details>
Website: [debian.org - user-manuals](https://www.debian.org/doc/user-manuals).
  
- CentOS:

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
  
- Fedora:

  - backed by Red Hat, the Fedora Project is community driven containing **open-source** and **free software**. Red Hat Enterprise Linux branches off Fedora (Fedora is based on Fedora Core, which is based on Red Hat Linux, not RHEL), so think of Fedora as an upstream RHEL operating system. Eventually RHEL will get updates from Fedora after thorough testing and quality assurance. Think of Fedora as an Ubuntu equivalent that uses a Red Hat backend instead of Debian. If you want to use a Red Hat based operating system, this is a **user friendly** version.
  - uses Red Hat package manager.
  - desktop environment - Gnome Shell.
  - sort of a “mix” between a rolling distro and a stable distro.
  - Fedora is great if you want a Red Hat based operating system **without the price tag**. Recommended for desktop and laptop.

  <details><summary>Comment from Quora.</summary> Fedora and openSUSE, in my opinion, are more challenging in part because they are strict on open-source and aside from the binary blobs on their kernels have no proprietary software in their official repositories. If your PC has hardware that’s completely compatible with open-source software (mostly Intel products are like their WiFi chips, CPUs, graphics cards, etc.) and you need no proprietary apps (including Google Chrome) Fedora will probably be easy for you to use.</details>
Website: [getfedora.org](https://getfedora.org/).

Distributions for advanced users:

- Arch Linux:

  - minimalistic, pain to setup and keep running (if you are new, start with something easy, you can always upgrade). Arch is a **lightweight** and **flexible** Linux distribution driven 100% by the community. **You receive software in binary form** (you shouldn't compile it from source - that's why Arch is more user friendly than Gentoo - sure wiki is the main factor here). You really need to get your hands dirty to understand the system and its functions, but in turn you get complete and total control of your system. If you want a lightweight operating system and really want to understand Linux use Arch!
  - package manager - Pacman, to install, update and manage packages.
  - desktop environment - many of them.
  - Similar to Debian, Arch uses a **rolling release model** (rolling distro) so incremental updates eventually become the Stable release.
  - great for desktop and laptop. If you also have a small device such as a Raspberry Pi and need to stick a lightweight OS on it, you can’t go wrong with Arch.
  - useful for Computer Engineering/System Programming and Hardware Engineering (+ software engineering - is this the best distributive for all of these tasks?).

  <details> <summary>Comment from Quora.</summary>No official automated installer but its documentation is great and its installation process is simpler than it is for most other distros that lack an installer. It contains the bare minimum software required by a distro by default, but its repositories are some of the largest in the Linux world. It also follows a bleeding-edge rolling release model, so it has the very latest software (beware occasionally package maintainers get lazy or busy and don’t update packages, but this is true for all distros, but generally it’s bleeding-edge) just rolled out onto it.</details>
Website: [archlinux.org](https://www.archlinux.org/).
  
- Gentoo Linux:

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

Distributions for... gods :laughing: :

- Linux From Scratch (LFS) — excruciatingly painful to setup (if you want source, see above (Gentoo and Arc)), rolling, useful for Computer Engineering/System Programming and Hardware Engineering.

  <details><summary>Comment from Quora.</summary>Arguably the single most challenging Linux distribution to set up. It’s essentially the way the first Linux system ever was set up, by compiling and installing each piece of software from the ground up. In it the package manager is you, the user, as you must build every package manually and install it. A base LFS system for me takes > 8 hours to install. You’d be essentially insane to install this outside a VM the first time you attempt to install it. <p>LFS is both the name of a Linux distribution and a book that contains instructions for how to build a LFS system. The books is rather quite extensive and clear in how to build a LFS system it’s just putting into practice and having the patience to do it that is the tricky part. <p> As you are the package manager package updates can get annoying with time. Just think about having to manually compile each package update, especially considering even a base LFS system contains a couple of dozen of packages and most of these packages get updated fairly frequently, especially the kernel. <p> The other thing is keeping track of the files belonging to each package can be annoying, but it is necessary especially when one does package updates, as left over files can confuse packages when you’re trying to configure and compile them as they may build against previous versions of a library. There are techniques around this like GoboLinux’s method of package management, storing each package in its own unique directory and setting up symlinks to help make the other packages detect the files they depend on.</details>
Website: [linuxfromscratch.org](http://www.linuxfromscratch.org/index.html).

Or, just determine where you fit on this chart:
![Bearded men: Ubuntu, Fedora, Debian, Arch, Gentoo, LFS](https://qph.fs.quoracdn.net/main-qimg-9e304ad7584dc97abaee6bcaff44d2e3.webp)

## Websites

The best website for learning Linux is [linuxjourney.com](https://linuxjourney.com/):

- Useful for beginners.
- Has a decent amount of the information about the basic concepts and components of Linux.
- Has exercises.
- The interface and the design are great.

<details><summary>Additional advice from Quora.</summary> After a week or more of playing around, you can start writing shell scripting, which is nothing but collection of Linux command organised logically to form a program.
<p>
    Learn more Linux command , may be 50 more just search google. Know how to <b>ssh</b> in some remote computer. Get fluent in using <b>vi</b>,there are tons of time saving shortcut in <b>vi</b>. Learn how to combine argument in command like <b>ls -l , df-h, ps -auxn</b>. Master usage of pipeline <b>|</b> , which is basically used to direct command output from one to another. Refer <b>man</b> <some command> to detail about any command.
    </p>
<p>
    Let now get in into ninja phase, and learn tmux or screen. I prefer tmux. Tmux or screen is terminal multiplexer allow to create multiple tab, split pane, synchronised pane etc which can be really useful if you have to ssh remotely in some server.
    </p>
</details>

A great website with tutorials (it's not just for Linux): [digitalocean.com - linux basics](https://www.digitalocean.com/community/tutorials?primary_filter=popular&q=Linux+basics).

## Books

Books for beginners:

- [How Linux Works: What Every Superuser Should Know](https://www.goodreads.com/book/show/23802490-how-linux-works)
  ![Cover](https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442470350l/23802490._SX318_.jpg)

  >  Similar to the linuxjourney.com.

- [The Linux Command Line](https://www.goodreads.com/book/show/11724436-the-linux-command-line)
  ![Cover](https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1344692678l/11724436.jpg)

  > Bash basics.

- [Linux insides [optional]](https://0xax.gitbooks.io/linux-insides/content/index.html) 

  > The book provides basics about linux kernel and helps people who are interested in linux kernel insides, and other low-level subject matter. Not finished Internet book.

Books for medium level users:

- [Linux Bible](https://www.goodreads.com/book/show/13838572-linux-bible)
  ![Cover](https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1355106656l/13838572.jpg)

  > It's the Bible! Comprehensive book for beginners.

Books for advanced users:

- [The Linux Programming Interface: A Linux and Unix System Programming Handbook](https://www.goodreads.com/book/show/7672214-the-linux-programming-interface?ac=1&from_search=true)
  ![Cover](https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1391032547l/7672214.jpg)

  > *The Linux Programming Interface* is the definitive guide to the Linux and UNIX programming interface—the interface employed by nearly every application that runs on a Linux or UNIX system. Great book!

- [Linux Kernel Development](https://www.goodreads.com/book/show/8474434-linux-kernel-development)
  ![Cover](https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1349023910l/8474434.jpg)

  > "Linux Kernel Development" details the design and implementation of the Linux kernel, presenting the content in a manner that is beneficial to those writing and developing kernel code, as well as to programmers seeking to better understand the operating system and become more efficient and productive in their coding. This book is recommended wherever the words "for experienced users" meet.

- [Linux Device Drivers](https://www.goodreads.com/book/show/263436.Linux_Device_Drivers)
  ![Cover](https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1428606016l/263436.jpg)

  > For those who want to write drivers for this wonderful operating system!

Classic:

- [The Design of the UNIX Operating System](https://www.goodreads.com/book/show/337343.The_Design_of_the_UNIX_Operating_System)
  ![Cover](https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348774568l/337343.jpg)

  > Classic description of the internal algorithms and the structures that form the basis of the UNIX operating system and their relationship to programmer interface. The leading selling UNIX internals book on the market.