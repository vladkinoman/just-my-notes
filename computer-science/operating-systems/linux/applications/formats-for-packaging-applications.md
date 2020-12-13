# Formats for packaging applications

> In short, there are many formats. However, people say that them are unnecessary. See [Are these formats compulsory?](#Are-these-formats-compulsory?), the last paragraph.
>
> If you do choose the format, the top is as follows:
>
> 1. AppImage = Flatpak
> 2. Snap. This is the most controversial format among these.

## Table of Contents

- [AppImage](#AppImage)
- [Flatpak](#Flatpak)
  - [Pros and Cons of Flatpak](#Pros-and-Cons-of-Flatpak)
  - [Working with Flatpak](#Working-with-Flatpak)
- [Snaps](#Snaps)
  - [Pros and Cons of Snaps](#Pros-and-Cons-of-Snaps)
    - [Interesting opinions and comments on Snap](#Interesting-opinions-and-comments-on-Snap)
  - [Linux Mint drops support for Ubuntu's Snap](#Linux-Mint-drops-support-for-Ubuntu's-Snap)
- [Comparison](#Comparison)
  - [General](#General)
  - [Adoption](#Adoption)
  - [Usability](#Usability)
  - [Sandboxing / Confinement](#Sandboxing-/-Confinement)
  - [Application Installation / Execution](#Application-Installation-/-Execution)
  - [Application Distribution](#Application-Distribution)
  - [Application Updates](#Application-Updates)
  - [Linux Distribution Support](#Linux-Distribution-Support)
  - [Objectives and governance](#Objectives-and-governance)
  - [Application Size](#Application-Size)
  - [Execution speed](#Execution-speed)
  - [Package Format](#Package-Format)
  - [Project Codebase](#Project-Codebase)
- [Are these formats compulsory?](#Are-these-formats-compulsory?)

## AppImage

<img src="https://appimage.org/images/logo3.svg" width="30%">

An [AppImage](http://appimage.org/) is basically a self-mounting disk image that contains an application and everything the application needs to run on the target systems.

The AppImage format is popular with users due to its simplicity (download one file, run it, done) and with developers (one Linux file that runs on all distributions).

Again, the point of the AppImage format is: One app = one file. Simple. No root, no package manager, no app stores. Just one file that you download and run.

Snap and Flatpak allow dependencies on things other than what comes with every Linux distribution by default, and this can mean that net you need to actually download *more* stuff than with AppImage. For example, if an application needs Qt, then with Snap and Flatpak you need to download the whole Qt, whereas an AppImage comes with just *a tiny fraction of* Qt that is actually needed for the particular application.

No middle men between application developers and end users.

## Flatpak

<img src="https://flatpak.org/img/delivery_truck2-bb72338f.png" width="70%">

According to [wiki](https://www.wikiwand.com/en/Flatpak), Flatpak is a utility for software deployment and package management for Linux. It is advertised as offering a sandbox environment in which users can run application software in isolation from the rest of the system.

Flatpak was developed as part of the [freedesktop.org](https://www.wikiwand.com/en/Freedesktop.org) project (formerly known as X Desktop Group or XDG) and was originally called xdg-app.

Features:

- Applications need permissions to have access to resources such as [Bluetooth](https://www.wikiwand.com/en/Bluetooth), sound (with [PulseAudio](https://www.wikiwand.com/en/PulseAudio)), [network](https://www.wikiwand.com/en/Computer_network), and [files](https://www.wikiwand.com/en/Computer_file). These permissions are defined by the maintainer of the Flatpak and can be added or removed by users on their system.
- Flatpak allows application developers to directly provide updates to users without going through distributions, and without having to package and test the application separately for each distribution. Develop and test your application in an environment that's identical to the one users have. Flatpak makes it easy to bundle your own libraries as part of your app.
- *Flathub,* a repository (or remote source in the Flatpak terminology) located at [flathub.org](flathub.org), has become the [de facto standard](https://www.wikiwand.com/en/De_facto_standard) for getting applications packaged with Flatpak.
  Although *Flathub* is the de facto source for applications packaged with Flatpak, Flatpak can work independently of Flathub; it is possible to host a Flatpak repository that is completely independent of Flathub.
- Theoretically, Flatpak apps can be installed on any existing Linux distribution. Among the first Linux distributions which added support to Flatpak apps out-of-the-box were Endless OS, Linux Mint, Elementary OS, Fedora Silverblue, Zorin OS, and Pop! OS. Flatpak apps continue to be compatible with new versions of Linux distributions.
- Flatpak's build tools are simple and easy to use, and come with a [full set of documentation](https://docs.flatpak.org/).

### Pros and Cons of Flatpak

> [Source](https://www.reddit.com/r/linux/comments/99naxl/whats_so_good_about_flatpak/).

**Pros**

- **Availability**. It's good when you want to use applications that are not in your distributions repository or if you require a newer version of an application. Previously you had to use some kind of 3rd party repository for this (PPA, COPR, Debian Backprots, e.t.c....depending on your distribution) which could mess up your install because the packages from these repositories are not isolated from your distribution's packages. Keeping such a system updated can become a challenge.
  Flatpaks on the other hand are isolated and don't overwrite any of your distribution's programs or libraries.

  > Or perhaps newer versions of packages make other applications run badly. I assume this is why Spotify is a terrible experience on Arch, but not if using the Flatpak version.

- **Easy deployment**. Developers only have to make one flatpak and it will run on almost every distro. You wouldn't need a version compiled against every distro's specificities, package manager or repositories. 

- **You can have multiple versions of the same app installed at the same time**. You can have backwards compatibility through multiple runtimes. Runtimes refer to dependency bundles. So you can have GNOME 3.24, 3.26, 3.28, etc. all installed together, and they all get security patches while remaining [ABI](https://www.wikiwand.com/en/Application_binary_interface) stable.

  > In computer software, an **application binary interface** (**ABI**) is an interface between two binary program modules. Often, one of these modules is a library or operating system facility, and the other is a program that is being run by a user.

- **Regarding dependencies, everything works fine and out of the box**. If your app requires a ton of dependencies, rare ones or specific/older versions, instead of installing them and mess your system it will keep everything portable and pretty much in its own folder.

  > It includes all the dependencies of the program. This solves an issue i sometimes have when i want to use older applications that are not maintained anymore and depend on older libaries but the distro packages have moved on to a newer version which is not backward compatible, so i can't run that old program.

- **Flatpak *is* sandboxed**. What does it give us?

  > **Sandboxing** is the act of sectioning off a program on your hard drive so that its exposure to the rest of your apps and critical systems is minimized or eliminated.

  - It sandboxes the program, so preferred for closed source options. 

  - [Malware packages](https://www.linuxuprising.com/2018/07/malware-found-on-arch-user-repository.html) don't have root permissions when you install them. They can't even access your user's files if you don't want to. If you want to hide malware into Flatpak, user has to grant permissions to it (which isn't really secure, see below). The permissions are there in order for the apps to be practical. Unlike the mobile platforms, computer apps are not worlds into themselves and users expect them to work with their files.

  - Flatpak and snaps are isolated from the rest of the OS except for where you allow it to access the rest of the system (filesystem, I/O etc).

    > In snap-land this is done through interfaces and the user can either allow or deny access to the interfaces that the application wants access to.

    App inside will not see your host filesystem. What it can request in the manifest at install time is visibility of either your entire home directory, or selected directories there. By default, it can only access xgd cache, config and data dirs redirected to ~/.var/app/$appid.
    App can also request to see additional mount points, but not /. Some system state, like installed fonts, is a special case that's handled separately. Other system state (like enrollment into domain) is not handled at all, yet.
    You can always check, what permissions the apps required, and take some of them away (but then, it should be not surprise, that apps often need the permissions to work as intended). 
    It explicitly asks the user now:

    ```bash
    com.valvesoftware.Steam/x86_64/stable                  flathub 4cc924a6a2d8
      permissions: ipc, network, pulseaudio, system-bus, x11, devices, devel, multiarch
      file access: xdg-music:ro
      dbus access: org.freedesktop.NetworkManager, 
        org.gnome.SettingsDaemon, org.kde.StatusNotifierWatcher
      tags: proprietary
    Is this ok [y/n]: 
    ```

    But yes you manually revoke them after that. Which honestly is the only way it can be sanely done.

- **Flatpak is the future**. The advantage with flatpak (and snaps) is that, over time, more applications will be distributed as a flatpak or snap which will hopefully increase availability of applhttps://flathub.org/apps/details/org.fedoraproject.MediaWriterications on Linux as a whole.

  > I read on Reddit that "Flatpak is the future" is the phrase by Linus Torvalds.

- It also allows you to use certain programs without having to dual-boot.

- In an atomic system, where you have to reboot for updates, those flatpaks can be updated without a reboot. Both [Project Atomic/ostree](https://www.projectatomic.io/) and [OpenSUSE Transactional Updates](https://kubic.opensuse.org/blog/2018-04-04-transactionalupdates/) require reboots for updates. And just because you did not have to reboot, does not mean that you should not have rebooted.

- Someone was amazed at how quick Flatpaks were compared to snaps on Ubuntu.

**Cons**

- **Another thing on your OS**. It's another thing to keep track of, and takes up more space.
- **Flatpak isn't very secure**. Flatpak is sandboxed by default (a flatpak can do very little; it can't open windows; it can't play sound; it can't write anywhere except a private directory), applications request more permissions at install time which you accept (and can later revoke as you wish).
  The problem is that most permissions that are required (x11, pulseaudio) are **not secure**. So we all have to wait for Wayland/Pipewire to become the norm. Don't forget to revoke the permissions!
  However, Flatpak blacklists a handful of directories even if you request them.

### Working with Flatpak

> Sources: [link 1](https://flathub.org/apps/details/com.spotify.Client), [link 2](https://flathub.org/apps/details/org.fedoraproject.MediaWriter). 

**Example "Spotify"**

Suppose that you want to install Spotify on your PC. Go to the [spotify](https://flathub.org/apps/details/com.spotify.Client) page on flathub and execute the next commands in your terminal:

```bash
flatpak install flathub com.spotify.Client
```

Say "Yes" if Flatpak requires it. You can revoke the permissions later.

Launch the app:

```bash
flatpak run com.spotify.Client
```

**Example "Fedora Media Writer"**

Suppose that you want to install Fedora Media Writer in order to make a Fedora Live USB. Go to the [Fedora Media Writer](https://flathub.org/apps/details/org.fedoraproject.MediaWriter) page on flathub and execute the next commands in your terminal:

```bash
flatpak install flathub org.fedoraproject.MediaWriter
```

Say "Yes" if Flatpak requires it. You can revoke the permissions later. 

Launch the app:

```bash
flatpak run org.fedoraproject.MediaWriter
```

## Snaps

<img src="https://upload.wikimedia.org/wikipedia/en/b/b3/Snapcraft_green-red_hex-small.png?1607776736439" width="50%">

According to [wiki](https://www.wikiwand.com/en/Snap_(package_manager)), **Snap** is a software [packaging](https://www.wikiwand.com/en/Package_manager) and [deployment](https://www.wikiwand.com/en/Software_deployment) system developed by [Canonical](https://www.wikiwand.com/en/Canonical_(company)) for the [operating systems](https://www.wikiwand.com/en/Operating_system) that use the [Linux](https://www.wikiwand.com/en/Linux) kernel. The packages, called *snaps*, and the tool for using them, *snapd*, work across a range of [Linux distributions](https://www.wikiwand.com/en/Linux_distribution) and allow [upstream](https://www.wikiwand.com/en/Upstream_(software_development)) software developers to distribute their applications directly to users. Snaps are self-contained applications running in a sandbox with mediated access to the host system. Snap was originally released for [cloud](https://www.wikiwand.com/en/Cloud_computing) applications but was later ported to work for [Internet of Things](https://www.wikiwand.com/en/Internet_of_things) devices and desktop applications too.

### Pros and Cons of Snaps

> Sources: [link 1](https://discourse.ubuntu.com/t/please-do-not-use-snap-into-ubuntu-its-too-early/11206), [link 2](https://www.reddit.com/r/linuxquestions/comments/hfa5ru/eli5_why_snaps_are_so_bad_hard_numbers_please_and/).

Pros:

> Many of these benefits were said by an Ubuntu forum moderator. He may be biased. He also gave an extremely unfortunate example running a small weather utility. The loading time was less than 1 second. He should have tried running LibreOffice, which took one user about 3 minutes to load. See below.

- Developers can make **one package** that runs on **many releases of the same distro**. Also, devs can publish **one snap** which works on **multiple distros** (less interesting for Ubuntu users).

- Snaps **automatically update** so users have the latest software without manually updating.
  
  - Users who prefer manual update can override this to a great degree
  
- The Snap Store provides **delta updates**, so users don't have to download the full snap file every time

- Users get up to date releases which gives us **a shorter delivery times between developer and user**. Developers can push out **test releases** to users who can test them before they go stable.

  > It is the possibility to use tracks and choose how much on the bleeding edge you want to be. 

- Less dependency issues.

  > But the dependency hell was solved 10 years ago. 

- Way more security and privacy.

  > Is it really that secure?

- Channel switching is a nice feature.

Cons:

- **Slow startup**. The first startup up is slow. Still, a bit slower launch after, much much slower on non ssd setups. 15 seconds to open a calculator is not acceptable for a so-called modern distribution. It is an obvious loss of productivity.

  > The same Ubuntu moderator says:
  >
  > > The most noticeable downside of Snap is slowness at startup. With many libraries and other assets to load, some of the delays get compounded. This is offset by the fact that snaps are compressed on disk, so there's fewer blocks to read, which is countered by the overhead of the realtime decompression taking some CPU overhead.
  > > Further on top of this is the need to stand up the necessary directories, mounts and caches to ensure the application launches correctly. There is some overhead on doing this on first launch. It was way worse, and was improved recently. It turned out some font caches were being rebuilt on every launch of the application.
  > >
  > > So for example on someone's machine running Libreoffice from the deb takes 0.9 seconds to launch, from the snap it takes around 1.8 seconds. That's certainly a difference, but it's far from the 15s.

  > I accidentally installed LibreOffice as a snap on a coworkers machine. It was so crap, he has no idea of linux and complained. It needs literally about **3 minutes to start**. I uninstalled it, installed it with apt-get and everything was fine.
  >
  > Also I have my Nextcloud in a snap, performance wise it works fine I guess, but it's annoying that the Storage for it is in some weird snap mount I always struggle to find.

- **Space**. Since snaps and flatpaks have all the relevant dependencies bundled up inside them, you end up with wasted storage space, as opposed to the package manager way of installing libraries system-wide so that they can be used by other packages that need them, and only need to be installed once.

  > Disk space is generally not an issue, not only disks are cheap, but snaps are compressed archives, and they can re-use some special snaps of common dependencies.
  
- **Snap consumes resources**. There is a separate service that runs at all times, used to manage how snaps function. This consumes system resources (maybe if you are running a low RAM system it might make a difference).

- **Problems with integrations into some distributions**. Snap is hard to integrate into some distributions because it makes some assumptions about your system. The backend is not open, so it is harder to get it set up on a managed system than building from source and distributing it with a cache server.

- **Snap needs research, basic flaws for users are not solved**. Snap in themselves are not bad - but for a smoother UX they require a "wider view" about how people use their computers.

  > How test any and all use cases? Why pushing snap so strongly when basic flaws for users are not solved? And above all what is the meaning of LTS if it's used as a testing bed for a non mature technology? Snap for the moment covers none of my needs as a desktop user while .deb do. Safety? How am I not safe using .deb?

- **Canonical imposes snap by default**. Imposing snaps is a bad idea. Linux Mint for example integrates flatpak but it does not impose any software installed by flatpak.

  > If Ubuntu wants to propose some apps with snap as default, it's fine and no problem **if the deb package remains available and snap can be uninstalled.**
  >
  > > See this thread from last year for an insight into why Chromium is the first desktop application to be delivered to Ubuntu users as a snap only. Trusty is now EOL but presumably Xenial will be similarly affected in due course if not already.
  > > [https://discourse.ubuntu.com/t/chromium-updates-on-trusty/5905 59](https://discourse.ubuntu.com/t/chromium-updates-on-trusty/5905)
  >
  > This is unacceptable and a **very bad idea, as deb packages are well used, performant, secure.** Use snap only when it will be as effective as a deb.
  >
  > You don't need snaps when you use ppas for beta software.

- **Canonical controls Snaps, proprietary app store gives too much power to them**. The question is, do you trust Canonical? They violate the Linux philosophy.

  > One way snaps are bad is because Canonical makes its own company-controlled snapcraft the only source you can obtain snaps from.
  >
  > There's no mirrors, regional or private company servers even if you have the bandwidth to serve everything inhouse.
  >
  > Everything has to go through Canonical, which insists on packagers creating developer accounts and for the original creators of the apps to make their own - you can't create snaps for many opensource apps you normally packaged as debs before that you did not author yourself (its very rare for distro packagers to be the actual developers).
  >
  > Snapcraft is run like an app store for paid apps in preparation, not a repository of free opensource apps.

  > The way Canonical is pushing it in Ubuntu, such as forcibly installing chromium's snap, even when apt is used, is already causing me concern towards their practices, if snap becomes the leading distribution method.
  >
  > ...
  >
  > Whats the use of Linux winning the majority of marketshare, if the major distros and software end up becoming privacy nightmare, such as Windows or Android is right now? Flatpak and Flathub are fully open source. There is no reason why Snapstore can't be too. Unless Canonical wants to profit through it, and it is more or less known how profiting from software store occurs.
  >
  > > See below for more information on this :point_down:

#### Interesting opinions and comments on Snap

My only complaint is **proprietary app store**. It **gives too much power to Canonical**. The way Canonical is pushing it in Ubuntu, such as forcibly installing chromium's snap, even when apt is used, is already causing me concern towards their practices, if snap becomes the leading distribution method. They open source the store or do not make it hardcoded into snap, I am ready to ignore all the technical disadvantages they have to flatpaks and appimages.

> > The whole "snap store is proprietary" thing is fine, but I personally think it's a small price to pay to make Linux software more stable and easier to distribute.
> >
> > > No it is not a small price. Whats the use of Linux winning the majority of marketshare, if the major distros and software end up becoming privacy nightmare, such as windows or android is right now? Flatpak and flathub are fully open source. There is no reason why snapstore can't be too. Unless Canonical wants to profit through it, and it is more or less known how profiting from software store occurs.
> > >
> > > Some can argue that snap could be forked to allow for other stores, but these stores, if not endorsed by any distro, would end up not getting most software, giving rise to situation such as with android and play store. Moreover, these stores would be inaccessible from Ubuntu unless an user specifically installs the alternate version.
> > >
> > > If snaps become the de facto standard of distribution, it would be the worst thing that could happen to Linux, as well as free and open software.
> > >
> > > > Hmm, alright, you've got some solid points. While I don't necessarily agree and still think it would be a good step instead of sticking to how software is distributed right now, you're definitely right about how it would be similar to Android and the Play Store. Do you feel the Flatpak model is better thought out and should be further supported? I'm going to try and use it more from now on.
> > > >
> > > > > > While I don't necessarily agree and still think it would be a good step instead of sticking to how software is distributed right now
> > > > >
> > > > > It's not a good step if it's antithetical to the entire idea of linux. Like, what's the fucking point of using Linux if you don't care about user freedom or open source code? In that case you might as well save yourself headaches with proprietary apps/drivers, gaming, etc, and just go with Windows or OS X. This is the same argument people make for OS X's walled garden. It does not belong in Linux.
> > > > >
> > > > > It literally does not matter if snaps are less performant or more performant, because the entire premise is built on bullshit. [Canonical is not a good company](https://www.zdnet.com/article/canonical-performs-u-turn-over-amazon-search-results-in-ubuntu-12-10/). When (if) they open source snaps, then people will start making comparisons.
> > > > >
> > > > > Instead of using Ubuntu, it's better to run Debian and compile stuff yourself if you need a version that's more up to date than the repo version.
> > > > >
> > > > > > Not all of us are free software radicals. I personally consider myself a free as in beer software radical and use FOSS software on a pragmatic basis. I choose Linux consistently because it is the least worst option if I want a secure free (cost) system. I have been doing this since around 2000.
> > > > > >
> > > > > > Don't get me wrong, I highly value FOSS principles, and I have contributed to FOSS projects. Snaps are definitely a bridge too far for me and leave the aftertaste Canonical brand lube in the back of my throat. Our tent is a lot bigger now; don't assume everybody is here to worship Stallman and circlejerk about how much Balmie Asshole Era Windoze sucks. Times have changed.
> > > > > >
> > > > > > > The problem is that "free as in beer" and "free as in freedom" are closely tied...it's difficult to make concessions to one without it affecting the other.
> > > > > > >
> > > > > > > And let me be clear, I do understand where you're coming from...I'm definitely not in the 100% Stallman camp either... I may ***choose*** to run a propriety binary on my system, either because it makes my life easier or (more likely) because it's a requirement for my job.
> > > > > > >
> > > > > > > But, let's face it, the minute you close off any control of the software to the user and limit freedom, there is almost always a price being paid. It may not be in dollars and cents...it may be in data collection, or ad revenue, for example.
> > > > > > >
> > > > > > > But, to me, there's a difference between making an informed choice to run a particular piece of closed software because you've determined that the benefits outweigh the costs for you...and having an entire platform (such as Ubuntu) forcing it upon you, removing the choice that I, as an individual, would have to make that determination for myself.
> > > > > > >
> > > > > > > And sure, ultimately I do still have a choice...I can choose NOT to use Ubuntu, which I have done (for more reasons that just the Snapstore)...
> > > > > > >
> > > > > > > > Snaps are definitely a bridge too far
> > > > > > >
> > > > > > > ...and apparently you have to, which is my point.
> > > > > > >
> > > > > > > > I think we mostly agree philosophically. For instance, I make the choice to pragmatically deny a 100% FOSS system when it comes to Intel Microcode and broadcom-wl blobs. 
> > > > > > > >
> > > > > > > > My point really was that many of the new users in the Linux world do not operate on those terms. For instance, many newer users utilize things like Proton and Lutris to the point where the majority of software on their computer are proprietary blobs (Heck, even the binaries of one or two large games could surpass the amount of compiled open source binaries on a Linux machine). There are also the WSL users who basically think, "Linux prompt in Windows, what's not to love?" Then, there are the new breed of corporate Linux users, such as the Linux team head of a company I worked for who runs Windows on his home environments.
> > > > > > > >
> > > > > > > > This is both the blessing and cost of higher adoption, unfortunately. It will be interesting to see where our community stands in a decade. I think things like Snaps are an indicator of where things are headed.
> > > > > > > >
> > > > > > > > Ultimately, it should be a pragmatic goal of every user to stay ahead of the skill curve that allows Canonical to shove things like Snaps onto newbie users. It's a big reason I have stayed as far away from Ubuntu in recent years. Its a shame, really. I remember the days of the single digit Ubuntu releases where they were all about enabling people to use Linux in an effective manner. Now, its as if they're milking the "best newbie choice" perceptions of the last decade to force whatever garbage they want onto unsuspecting users.
> > > >
> > > > > Flatpaks are way better, at least for conservation of open source culture. There is no forced store. Flathub.org though is rising as the de facto library for flatpaks, but it is not enforced. Also flatpaks are more suited to desktop use, or at least snaps provide no additional advantage to desktop users over flatpaks. Snaps may be however be better for certain use cases, such as IoT.
> >
> > > The Open Source part is not trivial, it is a vital component of Linux and the majority of users' philosophy.

---

Both as a developer, and as a corporate engineer, I often publish rpm packages or container images to private repositories. As far as I know, I cannot do that with snap, and therefore I can't publish software only to users that I support. That's enough reason for me.

> Running a private repo is easy, just download the snap files and sideload them with snapd directly with `snap install --dangerous --classic $SNAPNAME.snap`

Sometimes broken packages get uploaded to public repositories. It's rare, but it does happen. A few months ago, an update to the Signal Flatpak was published, and that wouldn't run on my workstation. That's bad, but because Flatpak doesn't auto-update, I was able to tell people that I support not to update the package at that time, and they were able to continue using Signal. As far as I know, there's no way to inhibit updates for snap. That would be enough reason for me, too.

> Updates can be turned off with snapd for a certain package in the same way. Since the system keeps the current and two previous versions downloaded it's a piece of cake to keep a privileged version installed under a different alias like that. you can also use `snap download` to get a certain version (if available) like a stable version installed as a sideload while you track the git-edge version for your normal snap. Also, there are rollbacks for prior versions available in the case of broken updates like your signal-desktop example (I've used this myself before, not for signal though).

As I understand it, flatpak is tied to desktop sessions, and it can't be used for server applications where no user is logged in, and snap can. That's great, except that for that use case, snap isn't competing with flatpak, it's competing with Podman and Docker. I'm going to go with Podman or Docker, here.

> Snaps are not at all in contest with Podman (lol) or Docker. Those are deployment platforms for rolling out into big server architecture and clusters. Snap is a platform for rolling out into very very small servers, the so-called "edge" appliance server, which is why the format is designed the way it is. snaps are also a very nice way to manage languages that move very fast (like golang) or have multiple concurrent versions (nodejs).

I don't have a lot of experience with snap, but this comparison for Firefox lists startup time as < 1 second for flatpak and roughly 11 seconds for the snap. I assumed that when people talked about slow startup for snap, they meant something far less bad than [this](https://www.ctrl.blog/entry/firefox-linux-flatpak-snap.html).

> Snap startup times are still not amazing, but they're better and still improving. it is the major user-facing problem though.

---

I made a bash script to automate debloating, purging snapd, updating, and installing all my apps using the good ol apt sources.list repo or .deb executables on a fresh system installation - If the app developer only support snap then I won't be using their app at all and will go out looking for other alternatives that use PPA. I'm on Ubuntu 20.04 too. I don't do distro hoping so I'm not sure how other package managers feel like.

For example https://shotcut.org/download/

They only offer source, tar, AppImage, FlatHub, Snap, but no **official** PPA so no problem. It's not the end of the world.

https://launchpad.net/~kdenlive/+archive/ubuntu/kdenlive-stable

https://www.openshot.org/ppa/

> That's quite the absolute approach but it's your right. I understand why you might not want to use Snaps, but especially in the case of Shotcut or Kdenlive, why not use a Flatpak or AppImage? Is it just because you're on an Ubuntu base and PPAs work best or because of some other reason? I would love to hear your thoughts. And, if you haven't checked out different package managers, you're definitely missing out. It's a good idea to have spherical knowledge of what other bases offer.
>
> > Good question. I despise having to install other third-party package manager(s). But I watched an interview with Linus some time ago. **He said Flatpak should be the way to go**. This is the real drawback to GNU/Linux because they are all messed up.
> >
> > He said he preferred his Chromebook (ChromeOS) over any other distros because of their unified app store (from Google) and Android is the future of Linux. Well, you guess it right the Play Store.
> >
> > But since this topic is specifically about Desktop, it is still unclear which approach to use. Obviously, my philosophy is simple. I don't want myself to be force into believing in a company's design movement and force myself into their ecosystem. **I use GNU/Linux** (or Ubuntu to be exact) **for freedom**. Once Canonical try to force something that I'm not keen, I will certainly hop to other distro most probably Debian sid.
> >
> > Canonical is funny. Long time ago they promised to keep Ubuntu as free which it is still free now but they also started to offer Ubuntu pro. 10 years fast forward, the future is still unclear. I'm surprise Snap still survive to this date. They must have invested a lot money to that piece of garbage where u-turn is not an option.

### Linux Mint drops support for Ubuntu's Snap

> [Source](https://itsubuntu.com/linux-mint-20-dropped-ubuntus-snap/).

Linux Mint 20, like previous Mint releases, will not ship with any snaps or snapd installed. In Linux Mint 20, APT will forbid snapd from getting installed.

The reason behind why they were planning to dump Snap from last year:

> When snap was announced it was supposed to be a solution, not a problem. It was supposed to make it possible to run newer apps on top of older libraries and to let 3rd party editors publish their software easily towards multiple distributions, just like Flatpak and AppImage. What we didn't want it to be was for <u>Canonical to control the distribution of software between distributions and 3rd party editors</u>, to prevent direct distribution from editors, to make it so software worked better in Ubuntu than anywhere else and to make its store a requirement.

> If you're a Fedora user and you want to install Spotify, you're told to go tohttps://snapcraft.io/spotify. Spotify doesn't distribute RPM packages, appimage, Flatpak or anything useful to a Fedora user who wants to download it, or to a Fedora maintainer who wants to add it to a repository. Fedora users are told to go to what is essentially a commercial store operated by a RedHat competitor where stats tell them their distribution is only 7th best.

 Lead developer, Clement “Clem” Lefebvre further explained:

> A year later, in the Ubuntu 20.04 package base, the Chromium package is indeed empty and acting, without your consent, as a backdoor by connecting your computer to the Ubuntu Store. Applications in this store cannot be patched, or pinned. You can’t audit them, hold them, modify them or even point snap to a different store. You’ve as much empowerment with this as if you were using proprietary software, i.e. none. This is in effect similar to a commercial proprietary solution, but with two major differences: It runs as root, and it installs itself without asking you.

## Comparison

> I took this comparison from AppImage's [wiki](https://github.com/AppImage/AppImageKit/wiki/Similar-projects#comparison).

The purpose of this table is _not_ to show that AppImage is "better" than the other solutions. The point is to show that while similar in some aspects, there are still fundamental differences in objectives, scope, and features that justify the co-existence of AppImage with the other solutions.

### General

| **Feature**                          | **AppImage**              | **Snap**                                 | **Flatpak**       |
| ------------------------------------ | ------------------------- | ---------------------------------------- | ----------------- |
| Package desktop GUI apps             | ✅ Yes                    | ✅  Yes                                   | ✅  Yes           |
| Package terminal CLI tools           | ✅  Yes                   | ✅  Yes                                   | ✅  Yes (with App ID aliases if you edit PATH)[[1](https://github.com/flatpak/flatpak/releases/tag/0.10.2)]  |
| Package server processes             | ✅  Yes                   | ✅  Yes                                   | ⚠️ Possible but not main goal [[1](https://flatpak.org/faq/#Can_Flatpak_be_used_on_servers_too_)]                                      |
| Package system services              | :x: No                    | ✅  Yes [[1](https://snapcraft.io/pulseaudio)] | :x: No                                      |
| Package kernels                      | :x: No                    | ✅  Yes [[1](https://snapcraft.io/pi2-kernel)] | :x: No   |
| Correct Application Theming          | ✅  Yes (if done correctly) | ✅  Yes (if the current system theme has been Snapped) [[1](https://www.omgubuntu.co.uk/2020/06/change-snap-app-theme)]     | ✅  Yes (if current system theme has been Flatpak'ed) [[1](https://youtu.be/gJVKypMwJYI?t=6m20s)] [[2](http://www.omgubuntu.co.uk/2017/05/flatpak-theme-issue-fix)] [[3](https://github.com/flatpak/flatpak/issues/114)]                                         |
| Using libraries and dependencies     | From base system or bundled with appimage  | From base system, [base snap](https://snapcraft.io/docs/base-snaps), platform snap ([KDE](https://snapcraft.io/kde-frameworks-5-qt-5-14-core18), [GNOME](https://snapcraft.io/gnome-3-34-1804), [Wine](https://snapcraft.io/wine-platform-5-stable), ..) or bundled with Snap                       | From Freedesktop, GNOME, KDE main [runtimes](http://docs.flatpak.org/en/latest/available-runtimes.html) or bundled with Flatpak |
| Corporate backing                | :x:  No (Community project) | ✅  Yes (Canonical) | ✅  Yes (Endless, Red Hat) |

### Adoption

| **Feature**                              | **AppImage**                             | **Snap**         | **Flatpak**  |
| ---------------------------------------- | ---------------------------------------- | ---------------- | ------------ |
| Number of applications in main store     | 1126 (2020-08-14 [[1](https://appimage.github.io)] [history](https://github.com/AppImage/AppImageKit/wiki/AppImages)) | +6400 (2020-08-06 [[1](https://ubuntu.com/blog/infographic-ubuntu-from-2004-to-20-04-lts)])  | ~1100 (2020-08-14) |
| Brand-name commercial application vendors using the format | [Adobe](https://github.com/adobe/cryptr), [IBM](https://www.ibm.com/us-en/marketplace/ibm-db2-direct-and-developer-editions), [KDAB](https://github.com/KDAB/hotspot/releases), [Microsoft](https://github.com/PowerShell/PowerShell/releases), [Prusa](https://prusacontrol.org/), [Ultimaker](https://ultimaker.com/en/products/ultimaker-cura), ... | [Microsoft](https://snapcraft.io/azure-cli), [Spotify](https://snapcraft.io/spotify), [Slack](https://snapcraft.io/slack), [JetBrains](https://snapcraft.io/search?category=&q=jetbrains), [Skype](https://snapcraft.io/skype), [nodesource](https://snapcraft.io/node), ...                                   | [Xamarin](https://download.mono-project.com/repo/monodevelop.flatpakref), Codethink, Igalia, ... |
| Built into third-party application development tools | electron-builder   | electron-builder, GNOME Builder  | GNOME Builder   |


### Usability

**AppImage**
Download from site, then drag-and-drop a single file in the file manager to desired installation location.

![drag-and-drop](https://user-images.githubusercontent.com/2480569/44744383-926a9200-aaf4-11e8-887e-3efba3170581.gif)

**Snap**

Install via distribution app store (supported out of the box on Ubuntu, Zorin OS, KDE Neon, ..) or via CLI:

```
$ snap install gimp
```

**Flatpak**

Install via distribution app store (supported out of the box on Fedora, EndlessOS, ..) or via CLI:

```
$ flatpak install --user flathub org.gimp.GIMP
```

### Sandboxing / Confinement

| **Feature**                              | **AppImage**                             | **Snap**                                 | **Flatpak**                              |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Can run without sandboxing | ✅  Yes (Not required. Optional to the packager.)                                     | ✅  Yes (if snap was built and approved to use 'classic' confinement) [[1](https://docs.snapcraft.io/reference/confinement)] [[2](https://youtu.be/WQ9LSZ7_6QM?t=1h10m52s)]                                      | :x: No (Limiting application access's by design)                                      |
| Can be used with different sandboxes   | ✅  Yes (e.g. [Firejail](https://github.com/netblue30/firejail) [[1](https://firejail.wordpress.com/documentation-2/appimage-support/)], AppArmor [[2](https://github.com/netblue30/firejail/commit/1738bbf7181d6c3b6d9f82bfa5b3f6d21ad503c3)], [Bubblewrap](https://github.com/projectatomic/bubblewrap)) | :x: No (is tightly coupled to [AppArmor](https://en.wikipedia.org/wiki/AppArmor))       | :x: No (is tightly coupled to [Bubblewrap](https://github.com/projectatomic/bubblewrap)) |

### Application Installation / Execution

| **Feature**                              | **AppImage**                             | **Snap**                                 | **Flatpak**                              |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Can run without installation | ✅  Yes (after setting the executable bit) | :x: No (needs to be installed by snapd)    | :x: No (needs to be installed by Flatpak client-side tools) |
| Can run without root access | ✅  Yes  | ⚠️ Only after installation | ⚠️ Only after installation |
| Run from compressed source and not unpacked | ✅  Yes                                      | ✅  Yes                                      | :x: No                                       |
| Application authors can place downloadable file next to .exe (Windows) and .dmg (macOS) which	users can install on offline systems | ✅  Yes (.appimage - contains all that is needed to run the application on an offline system) | :x: No (.snap - requires snapd to be installed and the system must be online if additional snaps are required) | :x: No (.flatpakref files require Internet, .flatpak bundles require a runtime to be installed) |
| Allows application authors to self-host application with no functionality loss | ✅  Yes                                      | :x: No                                       | ✅  Yes [[1](http://docs.flatpak.org/en/latest/hosting-a-repository.html)]                                      |
| Suitable/optimized for air-gapped (offline) machines (the kind Ed Snowden uses) | ✅  Yes                                      | ✅  Yes (You can side-load apps and updates offline)                            | ✅  Yes (P2P support allows offline installs and updates)                                       |
| Can store and run applications from non-standard locations such as network shares, CD-ROM, etc. | ✅  Yes                                      | tbd                                      | ✅  Yes (requires configuration) [[1](http://docs.flatpak.org/en/latest/flatpak-command-reference.html#flatpak-installation)]                                       |

### Application Distribution

| **Feature**                              | **AppImage**                             | **Snap**                                 | **Flatpak**                              |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Central Repo / Directory                         | [AppImageHub](https://appimage.github.io/apps/) | [Snap Store](https://uappexplorer.com/snaps) | [FlatHub](https://flathub.org/apps.html) |
| Fully decentralized without central gatekeepers | ✅  Yes                                      | :x: No (one dominant app store) [[1](https://medium.com/@uriadonayherrera/nitrux-appimage-52937e286edc)]   | ✅  Yes                                      |
| Individual App Repositories                      | :x: No (not stored in repositories) | :x: No (you can only have one repo per device) | ✅  Yes                                      |
| Can have multiple versions in parallel (including historical ones) | ✅  Yes (unlimited number of arbitrary versions) | ✅  Yes (one per channel)                    | ✅  Yes (any version available in OSTree can be installed in parallel)                                      |
| Once the application is installed, it still can be easily copied to another machine (e.g., share with a friend locally) | ✅  Yes (one app=one file; there is no “installation” so the app is in the same form at all times) | ✅  Yes (but also need to copy snaps it depends on) | ✅  Yes (you can use `flatpak create-usb` to copy to USB drive) |

### Application Updates

| **Feature**                              | **AppImage**                             | **Snap**                                 | **Flatpak**                              |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Update mechanism                         | [AppImageUpdate](https://github.com/AppImage/AppImageUpdate) | From Repo                                | From Repo                                |
| Binary delta updates | ✅  Yes (using zsync with no need to generate deltas in advance) | ✅  Yes (Only if using a private server-side service that needs to generate the deltas) | ✅  Yes (using OSTree to provide atomic updates)                       |
| Applications can be self-updating        | ✅  Yes ([using embedded information](https://github.com/AppImage/AppImageSpec/blob/master/draft.md#update-information))  | ✅  Yes | ✅  Yes |

### Linux Distribution Support

| **Feature**                              | **AppImage**                             | **Snap**                                 | **Flatpak**                              |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Earliest Ubuntu Supported                | Ubuntu 10.04                             | Ubuntu 14.04                             | Ubuntu 16.04                             |
| Earliest OpenSUSE Supported              | OpenSUSE 11.3                            | Leap 42.2                                | Leap 42.1                                |
| Earliest Fedora Supported                | Fedora 12                                | Fedora 24                                | Fedora 23                                |
| Earliest Debian Supported                | Debian 6                                 | Debian 9                                 | Debian 9                                 |
| Earliest CentOS Supported                | CentOS 6                                 | CentOS 7.6                               | CentOS 7                                 |
| Runs on Ubuntu out-of-the-box            | ✅  Yes                                  | ✅  Yes                                      | :x: No                                      |
| Runs on OpenSUSE out-of-the-box          | ✅  Yes                                  | :x: No                                   | tbc                                      |
| Runs on Fedora out-of-the-box            | ✅  Yes                                  | :x: No                                      | ✅  Yes                                      |
| Runs on Debian out-of-the-box            | ✅  Yes                                  | :x: No                                      | tbc                                      |
| Runs on CentOS out-of-the-box            | ✅  Yes                                  | :x: No                                       | ✅  Yes               |
| Live systems (e.g., Live ISO, Live USB, Live CD, Live network boot) | ✅  Full                                     | ⚠️ Partial (starting with 18.04, but it is limited by a kernel limitation and "a pain to work with, we spend almost zero time with that" according to a Canonical developer)  | ⚠️ [Partial](https://github.com/flatpak/flatpak.github.io/issues/303) (Session must be restarted for exports to be picked up)|
| Can run on Chrome OS (Crostini)            | ✅  Yes (Chrome OS 73)  | ✅  Yes (Chrome OS 73)                                       | ✅  Yes  |

### Objectives and governance

| **Feature**                              | **AppImage**                             | **Snap**                                 | **Flatpak**                              |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Independent from any particular distribution maker | ✅  Yes (a community project)                | :x: No (a Canonical initiative) | ✅  Yes ([a community project](https://flatpak.org/about/)) |
| Not linked to any dominant company’s business case | ✅  Yes                                      | :x: No (central to Canonical’s business) | :x: No                                       |
| Made to decrease distributions’ influence on the desktop Linux ecosystem as central gatekeepers | ✅  Yes                                      | :x: No                                       | ✅  Yes ([Everyone can host his / her own repo](https://docs.flatpak.org/en/latest/hosting-a-repository.html))    |
| Made to empower application developers and end users | ✅  Yes                                      | ✅  Yes [[1](https://snapcraft.io/)] | ✅  Yes [[1](http://docs.flatpak.org/en/latest/introduction.html)]                                      |
| Working to unify the Desktop Linux Platform rather than continuing to split the user base into different distribution ecosystems | ✅  Yes (by [pointing out the core issues](https://gitlab.com/probono/platformissues) that need to be solved together) | :x: No (effectively placing another distribution's base snap over the underlying distribution) | :x: No (effectively placing a Yocto distribution over whatever underlying distribution) |

### Application Size

| **Feature**                              | **AppImage**                             | **Snap**                                 | **Flatpak**                              |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Application storage on disk remains compressed at all times |✅  yes | ✅  yes | :x: No (server-side is compressed, client-side is not) [[1](https://ostree.readthedocs.io/en/latest/manual/formats/)] |                                            |                                       |
| Applications use much less disk space than "traditionally installed" ones | ✅  yes | ✅  yes | tbd |
| **Example:** LibreOffice download size ([source](http://www.ubuntubuzz.com/2019/06/comparing-libreoffice-62-versions-appimage-flatpak-snap.html))| ~248 MByte | 463 MByte [July 2020 update] | 543 MByte |
| Before downloading, know exactly the size to be downloaded and stored on disk | ✅  Yes (One app = one file) | :x: No [Does not take platform snaps into account [[1](https://forum.snapcraft.io/t/get-snap-package-and-dependencies-size-before-installing/19135/3?u=galgalesh)]] | :x: [Can only estimate worst case due to de-duplication](https://twitter.com/Sesivany/status/1084022663402713088) |

### Execution speed

| **Feature**                              | **AppImage**                             | **Snap**                                 | **Flatpak**                              |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| LibreOffice start time ([source](http://www.ubuntubuzz.com/2019/06/comparing-libreoffice-62-versions-appimage-flatpak-snap.html)) | 3 seconds | 13 seconds | 7 seconds |

### Package Format

| **Feature**                              | **AppImage**                             | **Snap**                                 | **Flatpak**                              |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| File format is standardized through an official standards body | :x: No (but interested in it once the format is stabilized) | ✅  Yes (Created by the Snap format TOB[[1](https://medium.com/elementaryos/weve-joined-the-snap-format-tob-e1e46968faef)])                                      | :x: No (although experimental OCI support exists) |
| Conceptually inspired by                 | [macOS .app](https://developer.apple.com/library/content/documentation/CoreFoundation/Conceptual/CFBundles/BundleTypes/BundleTypes.html#//apple_ref/doc/uid/10000123i-CH101-SW1) inside [.dmg](https://en.wikipedia.org/wiki/Apple_Disk_Image) (tracing back to NeXT); [Rox AppDir](http://rox.sourceforge.net/desktop/AppDirs.html) | [Click](https://manpages.ubuntu.com/manpages/bionic/man1/click.1.html) (Ubuntu Touch packages) | [klik](https://www.linux.com/news/one-click-installation-klik) (former name of AppImage) |

### Project Codebase

| **Feature**                              | **AppImage**                 | **Snap**                           | **Flatpak**    |
| ---------------------------------------- | ---------------------------- | ---------------------------------- | -------------- |
| Contributors do not need to sign a CLA   | ✅  Yes                      | :x: No                             | ✅  Yes        |
| Developed since                          | 2004 (then called [klik](https://www.linux.com/news/one-click-installation-klik)) | 2010 (predecessor called Click Packages) | 2013 (predecessors called [Glick](https://people.gnome.org/~alexl/glick/) [Glick2](https://people.gnome.org/~alexl/glick2/), and [xdg-app](https://github.com/alexlarsson/xdg-app)) |

## Are these formats compulsory?

> Source: [link](https://www.reddit.com/r/linuxquestions/comments/hfa5ru/eli5_why_snaps_are_so_bad_hard_numbers_please_and/).

Here are the disadvantages of those formats:

- **It breaks the UNIX way**.

- **Wasted disk space, it duplicates files**. Since snaps and flatpaks have all the relevant dependencies bundled up inside them, you end up with wasted storage space, as opposed to the package manager way of installing libraries system-wide so that they can be used by other packages that need them, and only need to be installed once.

- **It depends on individual maintainers to be on top of all their dependencies**. So, if a distribution updates a library in the usual manner, you could still be susceptible to the bug, or vulnerable to a hack. Because whoever built that package didn't update it.

- **Formats make devs feel relaxed, they may leave security holes**. All these newer methods of distribution are really just an excuse for developers to keep outdated libraries instead of maintaining and updating their software.

  > Look at Docker, a recent study found 80% of containers supplying outdated packages with security vulnerabilities of varying degree.
  >
  > With traditional repositories, if your package doesn't compile against a secure source, it will be dropped, end of story.
  >
  > People wrote about the proprietary nature of Snaps, but ironically, you can't decide to **not** update a Snap package, if the functionality is transparent and you can handle the risks involved.
  >
  > You can just postpone updating Snaps for a certain amount of time, that's a disgusting approach close to Windows, which treats users like idiots, no matter what. 
  >
  > Flatpak is objectively a better system.
- **Package managers are more powerful**. See :point_down:

Package managers are hugely more powerful for both users and developers compared to anything AppImage / Snap / FlatPak can do.

Properly packaged software (DEB, RPM or even from AUR)

1. **Handle dependencies infinitely better** (shared where possible, updated systemwide, you can easily know if software is depending on an old version of a library with a security issue. "Dependency hell" was solved 10 years ago for anyone who has a clue. Multiple versions of shared libraries was solved 10 years ago too.)
2. **Integrate well with** other **system** resources and decades of Linux system design, and
3. have 20 years of development behind them. There's basically **nothing that *can't* be done using a well-written RPM or DEB package**, and there are *so* many helper tools that are well-tested and trusted.
   I can churn out an RPM for arbitrary software from source in 30 mins, and have it published in a repository (completely under my control) within an hour using tools like the [OBS](http://build.opensuse.org/). And this gives me (basically for free) a verifiable repeatable build, with complete knowledge of all sources used, a trust chain, etc.

Yes it is a bit intimidating to beginners, but Snaps/AppImages/Flatpaks are trying to make it *too* easy IMO, trying to take away too many important decisions from the distro and the developer, and hiding necessary complexity. There's always a trade-off between ease of use and security/functionality.

The only possible advantages I can see, but don't need, are

1. **User-only installations**. Well sure, but in a single-user system are you not admin of your own box? And on a multi-user system, do you really want each user to try and install their own version of everything? That they're then going to leave to bitrot (the deterioration of unmaintained software) as open security holes in your system?
2. And **sandbox/isolation**. However, most don't implement that correctly and there are very regularly security holes and escalation bugs discovered. Or your app is so well sandboxed it can't interact with anything else on the system. And of course traditional packages can have sandboxing/isolation capabilities too.

> I think the advantages are supposed to include:
>
> - move packaging work from distro maintainers to app devs, where it only has to be done once to work in many distros
>
>   > In some ways, I get this. If an app dev is really expected to provide binaries for *every* distro, it's a pain. But if the distro devs aren't doing packaging, what are they doing (and I say this as one)? A distro without intentionally selected packages that are tested to work with each other is basically just a wallpaper and theme.
>   > And if the app is open-source with a sensible build system, it is *easy* to put up a recipe on launchpad, koji, OBS, or AUR to build proper packages. Anyone can do it, and in fact I think it's a nice way to introduce beginners to the ecosystem and Linux way of scratching your own itches.
>   >
>   > There is one benefit I'll readily admit, which is that **app devs can push out updates much faster** on a new release than distro devs, who sometimes need reminding. But there is a downside to this too — **less scrutiny** of the app dev's output means security issues, and bugs involving multiple interacting components, are often not checked for. When I install an traditional RPM from openSUSE I know that an independent set of eyes has looked at it for both security and compatibility with everything else in the distro.
>
>   > Swiss army knife approach. Jack of all trades, master of none. This guarantees that the app is ill-fitting, theming problems are just the first thing of the top of my head.
>   >
>   > Also, I'd rather have a specialist do the work than an app developer who is expert with his app, but most likely not packaging.
>
> - allows a user to run multiple versions of app, using multiple versions of dependencies, in same system
>
>   > RPMs (in Fedora and openSUSE at least) have allowed multiversion packages and automatic, correctly versioned shared library dependencies for a while now. I agree though it's still not trivial to have multiple versions of, say, Firefox installed. So if you are really in need of something like that, sure (or you can roll your own chroot-style solution with traditional packages). Is this use case really that common?
>
> - install/remove an app without disturbing rest of system (dependencies that may be shared with other apps)
>
>   > This was never a problem for me, and with modern packaging tools, it shouldn't be. Shared dependencies just stay on, I think that issue was solved 20 years ago.
>
> - any user can install a snap, without needing root privilege
>
> - installer scripts from app dev don't run as root, and they run in a contained environment
>
> > These are good points, but definitely not a knockout blow in favour of containerized packages, IMO.
> >
> > Overall it feels like the big advantages of Snaps etc are really meant for proprietary apps. Which I avoid on principle, and feel we should think twice about twisting our systems to accommodate.

I will never install a Snap, Flatpak, or AppImage unless it is proprietary software which is absolutely necessary and cannot be made available any other way. Even then, I might try first to take apart their code and turn it into an RPM for my machines.

If I have to use one of them, AppImage is the lightest footprint; then Flatpak, and worst of all is Snap. Snap is an absolute abomination in terms of the number of layers it introduces between your system and the software, all for a very questionable increase in security.

In any case, I can guarantee you that the primary way of building distros, that is around package managers, will not change.