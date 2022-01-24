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

- [x] Lubuntu:
  
- Ubuntu's flavour for old PCs. 
  - Desktop environment - LXDE/LXQT (lightweight and similar to Windows XP, Lubuntu 18.04 LTS is the last release with LXDE). 
  
  - [ ] There is a nice fork of Lubuntu which is called Peppermint OS. Peppermint is a [cloud-focused Linux distribution](https://itsfoss.com/cloud-focused-linux-distros/) that doesn’t need high-end hardware. It is based on Lubuntu and uses LXDE desktop environment to give you a smoother experience.
    Originally created with the web-centric approach of netbooks in mind, Peppermint includes the [ICE application](https://peppermintos.com/guide/ice/) for integrating any website or web app as a standalone desktop app.
    You’ll find the [documentation](https://peppermintos.com/guide/) helpful as well. A [dedicated forum](https://forum.peppermintos.com/) also exists to help troubleshooting issues and answering your questions.
  
  > I tried to install Lubuntu 20.04 LTS and encountered this [error](https://bugs.launchpad.net/ubuntu/+source/calamares/+bug/1851188). The problem is occur when I try to begin the installation after choosing the free partition (along with the 3 primary partitions already) for Lubuntu.
  
  Website: [lubuntu.net](https://lubuntu.net/), [peppermintos.com](https://peppermintos.com/).
  
- [x] Linux Mint:

  - based on Ubuntu. It uses Ubuntu’s software repositories so the same packages are available on both distributions. **Less bloated than Ubuntu**.

  - package manager - Debian package manager.
    Linux Mint dropped support for [Ubuntu](https://itsubuntu.com/things-to-do-after-installing-ubuntu-20-04-lts/)‘s Snap. In Linux Mint 20, APT forbids snapd from getting installed.

    <details><summary>Lead developer of Linux Mint, Clement “Clem” Lefebvre explains.</summary> When snap was announced it was supposed to be a solution, not a problem. It was supposed to make it possible to run newer apps on top of older libraries and to let 3rd party editors publish their software easily towards multiple distributions, just like Flatpak and AppImage. What we didn’t want it to be was for Canonical to control the distribution of software between distributions and 3rd party editors, to prevent direct distribution from editors, to make it so software worked better in Ubuntu than anywhere else and to make its store a requirement. <p>
    If you’re a Fedora user and you want to install Spotify, you’re told to go tohttps://snapcraft.io/spotify. Spotify doesn’t distribute RPM packages, appimage, Flatpak or anything useful to a Fedora user who wants to download it, or to a Fedora maintainer who wants to add it to a repository. Fedora users are told to go to what is essentially a commercial store operated by a RedHat competitor where stats tell them their distribution is only 7th best. <p>
    A year later, in the Ubuntu 20.04 package base, the Chromium package is indeed empty and acting, without your consent, as a backdoor by connecting your computer to the Ubuntu Store. Applications in this store cannot be patched, or pinned. You can’t audit them, hold them, modify them or even point snap to a different store. You’ve as much empowerment with this as if you were using proprietary software, i.e. none. This is in effect similar to a commercial proprietary solution, but with two major differences: It runs as root, and it installs itself without asking you.</details>

  - desktop environment - KDE/GNOME/Cinnamon/MATE/ Xfce/KDE SC 4.

  - great for desktop and laptop, listening to music, watching videos, and even gaming.

  - I think this is the best Ubuntu distro.

  > 8: Linux Mint is in even more dire need for a security team - https://blog.linuxmint.com/?p=2994
  >
  > > **What happened?**
  > >
  > > Hackers made a modified Linux Mint ISO, with a backdoor in it, and managed to hack our website to point to it.
  >
  > There have also been various incidents where Linux Mint package versions have been unnecessarily held back without addressing important security patches.
  >
  > These could have been million dollar lessons, but they still don't publish CVEs or have a dedicated security team.
  >
  > > 5: The good news however is that they still mostly depend on Ubuntu, and that they fixed the issue with their website over the exploit in the first place. The issue was WordPress + lack of HTTPS, leading to the mess they had.
  > >
  > > I also bet that they don't hold over packages as much anymore; they decided to finally just begin pushing updates from Ubuntu anyways instead of delaying them, ever since they added in Timeshift. The idea now is to simply backup in case an update fails. Hell, for a little bit before that, they added a prompt to their updater that allowed people to pick their updater behavior, at least partly addressing the issue where people used default Mint behavior and had quite outdated packages.
  > >
  > > That said, yes Mint could benefit from a dedicated security team, I'm just saying they're not an absolute failure at security like some like to think. If we want to go down that route, Manjaro is the worst at this, for the fact that they even promoted unsafe behavior when they forget to update their SSL cert. O_o Let alone Mint-like holding back of packages on a global level and instituted from the repos themselves. Manjaro is great for many reasons, but certainly not for promotion of security.
  >
  <details><summary>Comments from Wiki.</summary> Linux Mint is a community-driven Linux distribution based on Ubuntu or Debian that strives to be a "modern, elegant and comfortable operating system which is both powerful and easy to use." Linux Mint provides full out-of-the-box multimedia support by including some proprietary software, such as multimedia codecs, and comes bundled with a variety of free and open-source applications.</details>

  Website: [linuxmint.com](https://www.linuxmint.com/).

  Honorable mention: 

  - [ ] MX Linux — midweight simple OS based on Debian with Xfce as its desktop environment, it is very stable but not that attractive.
  - [x] Pop!OS — offers a pure GNOME experience, better user exp. than Ubuntu, it isn’t flashy, perfect combo of icon/themes (however, I couldn't get used to it), great desktop wallpapers and fonts, snap isn't enabled by default.
    So, it is worth highlighting that Pop!_OS provides separate ISOs. One for the systems with NVIDIA graphics card and another for systems with/without AMD graphics. With Ubuntu 19.10, you get NVIDIA drivers on the Ubuntu ISO but there is no such thing for AMD graphics.
  - [ ] Zorin OS — it has a Windows-like graphical user interface and many programs similar to those found in Windows; so the UI is tailored for Windows users to get used to; Zorin OS also comes with an application that lets users run many Windows programs. 
    The Core, Lite, and Education editions are free for download with the Ultimate Edition going for only $39. Education and Ultimate editions ship with both GNOME and XFCE desktop environments. Core edition is only available in GNOME while Lite comes with the XFCE environment.
    Zorin is also secure with periodic security patches and feature updates to address any security flaws and improve the performance of the system.
    Zorin also comes highly recommended for old PCs or systems with low CPU and RAM specifications. Unlike Zorin, Mint has a fairly large footprint and requires a robust system with higher specifications for installation for it to run smoothly.
  - [ ] elementary OS — one of the most beautiful distros, looks like MacOS.
    It also features its own app store where you can choose to pay for the free apps while having some cool features like picture-in-picture mode and so on.
    Not just limited to the looks and features – but it is stable enough and useful for developers as well.
    LibreOffice doesn’t come pre-installed as you would expect but worry not as it’s just a simple click away in the AppCenter.
    Elementary OS is also based on Ubuntu and is stable and fast even on old and low spec PCs.
  - [ ] KDE Neon — simplified and beautiful KDE Plasma desktop and KDE applications; unlike Kubuntu or other KDE-based distributions, you don’t have to wait for months to get the new [KDE software](https://kde.org/).
  - [ ] Netrunner — OS based on Debian with KDE Plasma as its desktop environment; UI looks nice at first glance, but it's a bit complicated when you want to find something; strange shadows on desktop icon texts; it is developed by the KDE dev team which makes makes this distro the best KDE distribution for many people.
  - [ ] Raspbian is yet another useful distro based on Debian for developers/programmers using Raspberry Pi for their projects.
    It includes most of the essential software for programmers like Python, Java, Scratch, and so on.

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
  
  > Some [articles](https://www.tecmint.com/best-linux-distributions-for-beginners/) write that this distro is good for beginners.
  
  - excellent choice for professional work, based on Red Hat Linux, I heard that people use it in **enterprise** (with Red Hat Enterprise Linux). **CentOS 8** is a favourite among Linux enthusiasts who want to savour the benefits of RHEL (it offers beginners a gateway to try out an RPM-based Linux distribution at absolutely no cost).
  
    > Abbreviated as **RHEL**, [Red Hat Enterprise Linux](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux) is a Linux distro designed for Enterprise or commercial purposes. It’s one of the leading open-source alternatives to other proprietary systems such as **Microsoft**. **Red Hat** is usually a top choice for server environments given its stability and regular security patches which boost its overall security.
    >
    > You can readily set it up on physical servers, virtual environments such as **VMware**, **HyperV,** and also on the cloud. **Red Hat** has done a perfect job in containerization technology thanks to **OpenShift PaaS** (platform as a service), a hybrid cloud environment that is built around **[Docker](https://www.tecmint.com/install-docker-and-learn-containers-in-centos-rhel-7-6/)** containers and managed by [Kubernetes](https://www.tecmint.com/install-a-kubernetes-cluster-on-centos-8/).
    >
    > Redhat trains and certifies system administrators through specialist courses such as [RHCSA (Red Hat Certified System Administrators)](https://www.tecmint.com/red-hat-rhcsa-rhce-exam-certification-book/) and [RHCE (Red Hat Certified Engineer)](https://www.tecmint.com/red-hat-rhcsa-rhce-exam-certification-book/).
    >
    > Where efficiency, security, and stability are of utmost priority **RHEL** is the ideal distro to opt for. **RHEL** is subscription-based and the subscription is renewed annually. You can purchase a license for an array of subscription models such as Linux Developer Workstation, Linux developer suite, and Linux for Virtual Datacenters.
    >
    > The **AppStream** repository (**Application Stream**) provides all the software applications that you want to install on your system while the **BaseOS** provides applications only for the core functionality of the system.
    >
    > Additionally, you can also [download and try out RedHat for free](https://www.tecmint.com/download-rhel-8-for-free/) by through the [Red Hat developer program](https://developers.redhat.com/).
  - package manager - Yum (command line), PackageKit (graphical), .rpm (binaries format) (rpm packager manager is also used by RHEL). Software packages are provided for through 2 main repositories: AppStream and BaseOS. 
  - desktop environment - bash, GNOME Shell. CentOS 8 is the latest release and ships with GNOME as the default desktop environment.
    Though very commendable on stability and performance, CentOS 8 doesn’t have much to offer in the way of desktop customization. 
  - **servers**, desktop computers, workstations.
  - Even though the number of hosting providers using CentOS is significantly less compared to the last few years – it still is a great choice.
  CentOS may not come loaded with the latest software packages – but it is considered as one of the most stable distros. You should find CentOS images on a variety of cloud platforms. If you don’t, you can always opt for the self-hosted image that CentOS provides.
  - useful for software engineering/IT/Web (same for RedHat). Unlike the earlier-mentioned distributions, CentOS is more geared towards stability and performance than the visual appeal and customizations. In fact, due to its stability, it comes recommended for server environments and for beginners seeking to venture into System Administration and devesslopment.
  
  <details><summary>Comment from Quora</summary> CentOS — A derivative of Fedora that uses much older software and is best reserved for servers, but some desktop users do exist. Its repositories are tiny so beware if you need a wide selection of software you may be disappointed by it.</details>
  
  <details><summary>Why not CentOS for programming (from Quora)</summary> I can’t tell you how many times I’ve had to build things from source on CentOS6 on my work servers. In one extreme case I had to rebuild a python pip package because of some glibc conflict to make it work on CentOS6. I wasted one or two work days figuring out how to make the pip package correctly which actually involved building multiple other things from source to create the pip package. CERN’s “devtoolset” is a life saver because if they didn’t have it I wouldn’t recommend CentOS for development at all. devtoolset will let you get the latest gcc and other things when necessary, but still it’s somewhat of a workaround. <p>
        What’s most important for me when considering a distro is productivity, and wasting a full work day compiling from source is interesting the first two or three times and then gets pretty old pretty fast. As a server to host things CentOS could do its job as it’s more “stable” feeling. However, if you want to use the latest packages to develop something, you will have to work around the countless out-of-date packages on CentOS.
        </p></details>


  Website: [centos.org](https://www.centos.org/).

- [ ] Fedora:
  - backed by Red Hat, the Fedora Project is community driven containing **open-source** and **free software**. Red Hat Enterprise Linux branches off Fedora (Fedora is based on Fedora Core, which is based on Red Hat Linux, not RHEL), so think of Fedora as an [upstream](https://www.wikiwand.com/en/Upstream_(software_development)) RHEL operating system. Eventually RHEL will get updates from Fedora after thorough testing and quality assurance. Think of Fedora as an Ubuntu equivalent that uses a Red Hat backend instead of Debian. If you want to use a Red Hat based operating system, this is a **user friendly** version.
  - uses Red Hat package manager.
  - desktop environment - Gnome Shell.
  - Fedora has server edition and some people use it as well. But most sysadmins won’t prefer a server that has to be upgraded and rebooted every nine months.
    Knowing Fedora helps you in using Red Hat Enterprise Linux (RHEL). RHEL is a paid product and you’ll have to purchase a subscription. If you want an operating system for running server that is close to Fedora/Red Hat, I advise using CentOS.
- sort of a “mix” between a rolling distro and a stable distro.
  - Fedora is great if you want a Red Hat based operating system **without the price tag**. Recommended for desktop and laptop.

  <details><summary>Comment from Quora.</summary> Fedora and openSUSE, in my opinion, are more challenging in part because they are strict on open-source and aside from the binary blobs on their kernels have no proprietary software in their official repositories. If your PC has hardware that’s completely compatible with open-source software (mostly Intel products are like their WiFi chips, CPUs, graphics cards, etc.) and you need no proprietary apps (including Google Chrome) Fedora will probably be easy for you to use.</details>
  
  Website: [getfedora.org](https://getfedora.org/).
  
  > Additional notes and recommendations on the distro.
  >
  > - [What is Silverblue?](https://fedoramagazine.org/what-is-silverblue/)

Honorable mention:

- [ ] **Kali Linux** is meant for Cybersecurity experts and students who want to venture into penetration testing. In fact, Kali provides industry-standard certifications such as **[Penetration Testing with Kali](https://www.kali.org/penetration-testing-with-kali-linux/)** and [Kali Linux Certified Professional](https://www.kali.org/news/introducing-kali-linux-certified-professional/).
  **Kali** uses the **APT** package manager.
- [ ] openSUSE ([SUSE Leap](https://www.opensuse.org/#Leap)) is tailored for developers and system administrators with in-built functionalities to help you manage systems, utilize containerization technologies included, and a bunch of useful features for programmers, developers, and sysadmins.
  It has a great community, a solid development sector, and a completely professional attitude.
  If you want a rolling-release cycle, they also offer **openSUSE Tumbleweed** edition- which is a bleeding-edge distro for developers who want everything up-to-date as fast as possible.
  OpenSUSE relies on the Yast package manager for managing software packages and is recommended for developers and system administrators.

### Distributions for advanced users

- [ ] Arch Linux:
  - Minimalistic, pain to setup and keep running (if you are new, start with something easy, you can always upgrade). Arch is a **lightweight** and **flexible** Linux distribution driven 100% by the community. **You receive software in binary form** (you shouldn't compile it from source - that's why Arch is more user friendly than Gentoo - sure wiki is the main factor here). You really need to get your hands dirty to understand the system and its functions, but in turn you get complete and total control of your system. If you want a lightweight operating system and really want to understand Linux use Arch!
  
  - Has a great wiki. If you have a problem or want to install something, read the wiki. It has detailed instructions for each application, including a summary, installation, configuration and troubleshoot.
  
  - Similar to Debian, Arch uses a **a bleeding-edge rolling release model** (rolling distro) so incremental updates eventually become the Stable release. Arch’s rolling-release system means that you’ll sometimes run into weird inconsistencies when package versions update, but Ubuntu updates packages too. It’s pretty easy in Arch to lock down a specific version of your project’s dependencies. The only problem in Ubuntu is, the packages provided by the distribution are not usually up-to-date and latest. So, you’ll have to rely on 3rd party for latest updates to software that matters to you; a PPA for your IDE, a snap for a design tool, anaconda for your python setup etc.
    If outdated software in the repositories is indeed a big problem for you (it was for me, for making music), then you can consider Archlinux. Arch may also have outdated packages in their main repository, but AUR usually has the latest packages. Remember, installing stuff from AUR may be time consuming because it downloads source code and compiles it on your machine. The operating system itself is completely reliable. The rare issues regarding stability creep in when you install *unsupported packages* from the AUR (which can be avoided by being cautious while dealing with AUR). This too affects only the software in question and not the OS itself. 
    One downside of Arch is that a simple update may break the entire system. In Ubuntu, you can run automatic updates with confidence because package updates are carefully tested and patched if necessary. Nothing of that sort in Arch (so you get all latest versions).
    
  - You need a lot of patience at first. The installation is not a wizard. You need to follow the installation guide, which is a sequence of commands. Once you install the base OS you need to know what you want in your system. Arch does not install extras, only a bare bones OS. There is a manual recommending software though.
    However, it’s easy to configure. Almost everything is vanilla and configured with files. No weird customization and wizards that most often break the software than not. 
    Once you get everything working you will not want to change to another OS. This could seriously be a problem, no joke.
    
  - Package manager - Pacman, to install, update and manage packages.
  
  - Great for desktop and laptop. If you also have a small device such as a Raspberry Pi and need to stick a lightweight OS on it, you can’t go wrong with Arch.
  
  - Useful for Computer Engineering/System Programming and Hardware Engineering (+ Software Engineering - is this the best distributive for all of these tasks?).
  
  - [ ] Also, there is a nice distro based on Arch. It's Manjaro. Fret not, while Arch Linux is tailored for advanced users, Manjaro makes it easy for a newcomer. It is a simple and beginner-friendly Linux distro. The user interface is good enough and offers a bunch of useful GUI applications built-in.
    Upon installation, Manjaro auto-detects all hardware components of your system including graphic drivers and auto installs the necessary applications.
    You get options to choose a [desktop environment](https://itsfoss.com/what-is-desktop-environment/) for Manjaro while downloading it.
    Manjaro requires 4GB of memory which is a lot!
    
  - [ ] There is a nice alternative to Manjaro. It is EndeavourOS. It's an Arch distro which is even closer to Arch than Manjaro. Endeavor is a continuation of Antegros. It tries to give an easy installer, while keeping close as close to vanilla Arch as possible.
    
    Manjaro on the other hand uses (a little bit) older Arch linux packages in order to try and find more stability. They also have a few different ways of doing things. For example on arch you pretty much install "linux" and it gives you the most recent kernel, and only the most recent kernel whether you like it or not. Manjaro lets you pick a major kernel version and stick on it. There's also a few other config-helper type apps in Manjaro.
    
    GUI package manager: Both distros will have the same options. AFAIK there isn't really a great GUI for pacman, and almost everyone uses the command line.
    
    Less bloat: Probably both will be equal. Antegros uses XFCE by default and Manjaro uses KDE, so you'll get a heavier desktop with Manjaro (by default). But Neither one overloads you with extra package bloat.
    
    Development / Programming: Really I can't think of any distro that is better or worse in this respect. As long as a distro has most of the tools and libraries you want to use, they're all equal.
    So, EndeavourOS is far better than Manjaro. Just avoid pamac and be habituated in terminal, very stable os, using direct official arch repo, not like belated manjaro repo. Kalu will inform you about arch updates without sudo prevelage.
    Endeavour uses direct arch repo, whether manjaro waits few days than core arch repo.
    
    > **About Antegros**
    >
    > Antergos was a great OS when the installer worked...which was about 25% of the time I used it.
    >
    > I was sorry to see it go, but always baffled by the way the installer didn’t have some basic fallbacks in place to get a system up when it couldn’t find the default repositories.
    >
    > When the damned thing worked to install you could have a very slim and reliable XFCE system up as an audio or video workstation very quickly, and running on the latest software, even on older hardware.
    >
    > It was a very good option for throwing together a friends system built to their needs quickly without having to do things like add yourself to sudoers and install a desktop environment and other annoying finishing tasks a vanilla arch install requires.
    >
    > That damned installer though, not confirming it has access to the remote packages it needed before starting the install, was utterly frustrating.
    >
    > ---
    >
    > I miss Antergos. The default gnome themed UI was really nice and clean. I know Endeavor OS fills the gap Antergos left but I can't help but feel like it's kinda ugly. I always hop off that to Zorin (light), LiteLinux, or something else. Not sure why Manjaro bugs me so much, it just does.
    >
    > I haven't been distro hoping long but Antergos was the first distro that I really "liked" and stuck with or at least kept going back to.
    >
    > ---
    >
    > I replaced Mint on my Plex server with Endeavour OS. While I understand the advantages of a point release distro, I got tired of having to use PPAs to add newer versions of packages I needed. And when I upgraded from Mint 19 to 19.1, I ran into some problems with a critical program and it was several weeks before I got it fixed. This leads me to wanting a rolling distro. Out of all the rolling distros, I settled on Arch. I've only been using Linux for a couple of years and still consider myself a newbie. The more I work on problems, the more comfortable I get with the OS.
    >
    > Arch is, IMHO, probably one of the nicest distros out there if you're looking for a rolling distro, hands down! As for the animosity people show towards Arch based distros, I don't understand it. How can making something more appealing towards new comers be seen as a bad thing? Antergos, Manjaro, Endeavour OS, all of these distros put a lovely wrapper around Arch. I agree with lots of folks that Manjaro is TOO far off the mark with their distro. What they're doing with Arch reminds me of what Canonical did with Ubuntu. With Endeavour OS, they strive to be as close to Arch as possible, while giving the user a simple GUI installer. Antergos was close to Arch but Endeavour OS is even closer. As an example, I got very use to pamac with Antergos and with EOS, they ditched it. I understand their reasoning and agree with them. I've adapted just fine to pacman and yay.
    >
    > Now, with the "just use the guides and install Arch from the ground up" or, "use existing scripts". To that I say, I've tried that path and I -ALWAYS- ran into problems. Plus, to a newbie, the guides absolutely leave out key steps because the folks that wrote them assume you have a certain baseline knowledge of all things Linux. Plus, while cutting my teeth with Manjaro, Antergos and now Endeavour OS, there were a few times were I was testing things out and due to user error or just experimenting, I needed to blow away the system. With a GUI Arch installer, the turnaround time was 5-10 minutes? Is there a secret way to get Arch installed (by hand) in 5-10 minutes using the wiki? Installing Arch "the Arch" way is way to tedious.
    >
    > "But you learn so much while doing it the Arch way". While there is some weight to that argument, I've also learned a LOT by using the system and breaking/repairing things. Having to step through a guide and copy files for my keyboard layout? Timezone? I mean, really..... how am I smarter by spending time on copying a layout file? On top of that, counting up the hours I spent trying to get Arch installed by following the wiki..... in that same time span, I could wipe/reload a system using Endeavour OS about 100 times. Arch is SCREAMING for a GUI installer that is officially maintained. Heck, charge people $1, $5, $10 or even $20 for a link to something like that and none of these Arch based distros would exist and the person that maintains that installer would start amassing a small fortune.
    >
    > Another good one is, "well if you can't read a wiki, you aren't smart enough to use Arch". I'll tell you that I -AM- smart enough to do is....... use Endeavour OS and not go on the Arch forum and ask for help. Since it's not a 'real' install of Arch, I don't want to get yelled out so I stay out of their hair.
    >
    > I think the closet I ever got to installing Arch 'the Arch way' and being able to boot into Cinnamon must have cost me about 2 hours and the end result was a black screen. These Arch based distros will continue as people want to use Arch (for good reason..... it's an amazing rolling distro and the AUR is worth the price of admission) but they want to be able to quickly install it and get up and running with minimal fuss. I'm one of those people. As more and more folks join the ranks of the Linux world, we need welcomed with open arms and yes...... GUI installers to hold our hands from time to time! What's the big problem with a GUI installer if it brings more people, like me, into the fold?
    >
    > ---
    >
    > None of these arch forks except Parabola have a security team. Stop using them.
    >
    > > 13, 8: This is supposed to be based directly on Arch's repos, like Antergos. A security team isn't needed.
    > >
    > > AFAIK, Antergos only had a single repo for things like special theming and other little things, kinda like Linux Mint. Even Linux Mint has more independent stuff, come to think about it. The rest of the repos and the AUR are all Arch-based.
    > >
    > > > 5:
    > > >
    > > > ...
    > > >
    > > > Mint could benefit from a dedicated security team, I'm just saying they're not an absolute failure at security like some like to think (see comments in the Linux Mint section). If we want to go down that route, Manjaro is the worst at this, for the fact that they even promoted unsafe behavior when they forget to update their SSL cert. O_o Let alone Mint-like holding back of packages on a global level and instituted from the repos themselves. Manjaro is great for many reasons, but certainly not for promotion of security.
  
  Website: [archlinux.org](https://www.archlinux.org/), [manjaro.org](https://manjaro.org/), [endeavouros.com](https://endeavouros.com/).
  
  > Additional notes and recommendations on the distro:
  >
  > [How installing Arch Linux brought my old laptop back to life](https://www.freecodecamp.org/news/how-installing-arch-linux-brought-my-old-laptop-back-to-life-1c1c76dd688e/#:~:text=You%20can%20create%20the%20computer,on%20at%20the%20same%20time.)
  >
  > [Should You Install Arch Linux? 10 Reasons for Arch-Based Distros](https://www.makeuseof.com/tag/reasons-install-arch-linux/)
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

### Distributions for old PCs with 32-bit processors

> **Notes.** 32bit processors are next:
>
> - i386 is for extremely old CPU generation dating before Pentium.
>   Examples: Intel 386 and AMD 386 CPUs.
>
> - i486.
>   Examples: Intel 486 and AMD 486.
>
> - i586.
>   Examples: The First Intel Pentiums MMX, AMD-K5.
>
> - i686 is post Pentium generation (which includes all Intel 32-bit x86 processors up to and including the Pentium 4, etc. as well as processors from AMD (AMD K6) and other vendors which make compatible 32-bit chips).
>   Examples: Pentium Pro, AMD-K6.
>
>   > No one today have i386, they are at least 15 years old.
>   >
>   > That being said, i386 marks a 'compatibility' build and should work on ANY 32bit x86 CPU. i686 may or may not use MMX, SSE and more extensions.
>   >
>   > i686 can always run i386. the reverse is not always true.
>
> - Pentium M (March 12, 2003). The Pentium M represented a new and radical departure for Intel, as it was not a low-power version of the desktop-oriented [Pentium 4](https://www.wikiwand.com/en/Pentium_4), but instead a heavily modified version of the [Pentium III](https://www.wikiwand.com/en/Pentium_III) [Tualatin](https://www.wikiwand.com/en/Pentium_III#Tualatin) design. Microarchitecture — P6 variant. Instruction set — x86, MMX, SSE, SSE2.
>
>   > The processor in my old Acer laptop is next ([source](https://ark.intel.com/content/www/us/en/ark/products/27595/intel-pentium-m-processor-760-2m-cache-2-00a-ghz-533-mhz-fsb.html)):
>   >
>   > Intel® Pentium® M Processor 760
>   > 2M Cache, 2.00A GHz, 533 MHz FSB
>   > 1 core, 1 thread. Physical Address Extensions is 32-bit.
>
> [x86_64](https://en.wikipedia.org/wiki/X86-64) packages are intended to be executed on processors which are compatible with the AMD64 64-bit platform, including the AMD Athlon 64, AMD Opteron and related AMD processor families, and the [Intel 64](https://en.wikipedia.org/wiki/X86-64#cite_note-11) based processors.
>
> These 64-bit processors are fully backward compatible with their 32-bit predecessors, so if you have a AMD64 or Intel 64 processor, it's up to you whether to install the 64-bit x86_64 packages or the 32-bit i686 packages. To get the highest level of performance out of your system you may want to use the 64-bit x86_64 distribution packages.

Tiny Linux distributions are powerful innovations: having an entire operating system drive a computer with less than 1GB of storage and half as much RAM is the ultimate software hack. The next distros have 32bit versions:

- [ ] Tiny Core:
  - Minimalistic, pain to setup. At 11MB for a text console and 16MB for a GUI, [Tiny Core Linux](http://tinycorelinux.net/) is almost impossibly small.

  - The distro uses the FLTK /FKWM and busy box desktops by default. Some components for hardware graphics may be missing, but you can install them manually. Tiny Core is available in three different editions, i.e. CorePlus, Tiny Core, and Core.
  CorePlus is an image that will work well for users with a wireless network. The installation tools provide for the basic setup of which windows manager to use, wireless support through different firmware files, keyboard support, and a remastering tool.
  
- **Best Distro with the smallest RAM need.** Without a GUI, Tiny Core runs well on a mere 64MB of RAM.
  
- [Download Tiny Core](http://tinycorelinux.net/welcome.html) and write it to a thumb drive with **dd** or [Etcher](https://www.balena.io/etcher/).
  
    Installing Tiny Core is easy, once you download the **tc-install** or **tc-install-GUI** application using the **Apps** icon in the launcher bar at the bottom of the screen.

  - Since it comes with little more than a text editor and a terminal, the first thing you should do is install some applications. The **Apps** icon in the bottom launcher bar displays all the Tiny Core packages available to you. The **Apps** repository also includes important drivers, so it's useful when you're looking to get a WiFi card or a printer working.
  The application selection is a good mix between user-centric apps, like office and graphics applications, and server-centric, such as [Samba](https://www.samba.org/) and web servers.
  
  - Tiny Core is ideal for old computers with few resources, network boot images, and anyone who values applications over the OS. Tiny Core is a great weekend project: build the OS you want from 16MB until you have just as much of an OS as you need.
  
  - Minimum installation requirements:
    64 MB of RAM (128 Mb is recommended, 19 Mb is minimum).
    i486DX CPU (Pentium 2 CPU and later recommended).
    16 MB ISO
  
  - Pros: tiny, fast, smallest footprint.
    Cons: ugly UI, pain to setup, loading everything into RAM on boot is not the default behaviour (some tinkering around needed).
  
- [ ] Bodhi Linux:
  - [Bodhi Linux](https://www.bodhilinux.com/) might not look tiny at first glance, with an ISO image of 740MB (5Gb at most), but once it's installed, you'll be amazed at just how tiny it is. Bodhi runs smoothly on only 512MB of RAM but looks and feels like the desktop of tomorrow. Bodhi uses the [Enlightenment](https://www.enlightenment.org/) desktop, a beautiful user interface that's lovingly crafted to be both small and powerful.
    Bodhi doesn't just use Enlightenment, though, it adds to it. Bodhi's configuration applications and system setting panels are custom interfaces to Enlightenment's sometimes overwhelming array of options. Bodhi makes some sane default choices for you and provides a subset of options. If you're a die-hard Enlightenment user, Bodhi's interpretation might not be pure enough for you, but for many users, Bodhi brings focus to the Enlightenment desktop.
  - The package enlightenment makes this distro run faster than other window managers used in other Linux distros. You do not have to worry about using enlightenment or any other package because Bodhi Linux has user guides useful in such situations.
  - Some essential Apps such as Midori for the web, Ephoto for graphics, and ePad for editing text are available. Applications for multimedia are not available during installation but are available through the App Center.
  - [Download Bodhi Linux](https://www.bodhilinux.com/download), write it to a thumb drive with **dd** or [Etcher](https://www.balena.io/etcher/), and reboot. The installation application is **Ubiquity**, so the process is the same as installing Ubuntu.
  - Bodhi is based on the latest long term support (LTS) Ubuntu Linux release, so your available software knows almost no bounds. If it's available for Ubuntu Linux, Bohdi has access to it.
  - Bodhi Linux is a step down from the size of a typical Ubuntu install and a step up from many other minimalist Ubuntu environments because it uses Enlightenment. If you're looking for a Linux distribution that runs lighter than most without resorting to overlay filesystems and application modules, then Bodhi is the distribution for you.
  - **Notice!** The Legacy 5.1.0 image utilizes the older 4.9.0-6-686 Linux kernel that is optimized for old (15+ years old) hardware. This kernel does not include the [PAE extension](https://en.wikipedia.org/wiki/Physical_Address_Extension) which is not supported on many older systems with Non-PAE processors such as Pentium M, Pentium Pro, Celeron.
  - Minimum installation requirements:
    256 MB of RAM (512 recommended).
    500 MHz Intel processor (1.0GHz recommended)
    10 GB of hard disk space
  - Pros: tiny, fast.
    Cons: ugly UI, based on Ubuntu.
  
- [ ] Puppy Linux:
  - Before there was Tiny Core or SliTaz or [AntiX](https://antixlinux.com/) or Porteus, there was [Puppy Linux](http://puppylinux.com/). One of the original tiny Linux distributions, Puppy has endured for a decade and a half as a reliable, bootable OS for old computers and new users alike.
    Puppy Linux is regarded as one of the best lightweight Linux distros that you can find out there because of its small memory footprint, ease of use, customizability and flexibility. Everything it does is saved on RAM making the system very fast, and if you are running a live system from the USB, you can save some data on it.
  - It is essential to know that unlike other distros, Puppy Linux is not formed upon any other Linux distributions. Instead, it builds upon packages of various other Linux distributions, such as Ubuntu. Your access to additional software and packages on your 32-bit PC depends upon your choice of binaries.
  - Upon first boot, Puppy does its best to guide the user through any necessary steps to ensure everything works as expected. It's a lot of windows to wade through, but once you get through it all, you know without a doubt what works and what doesn't before you choose whether to install.
  - Puppy is almost 300MB and failed to work on anything under 1GB RAM in author's tests, so it's not exactly the tiniest Linux available. However, it's still a great, under-1GB operating system, and of the OSes in that category, it's one of the very friendliest. Users also don’t have to worry about any booting issues, as Puppy Linux boots itself entirely into the RAM. 
  - Puppy Linux uses Openbox and JWM window managers as default window managers; the two do not consume most of the system resources. You use Puppy Linux it is best not to demand much from its graphical applications, it will be best if you use what the system provides for better results. The distro is built for fast performance it does not have bundled application apart from the basic ones like AbiWord for word-processing, selected graphics editing tools, media playback programs and Gnumeric for spreadsheets.
  - Download Puppy Linux and write it to a thumb drive with dd or Etcher or burn it to a CD or DVD, then reboot.Puppy can install onto nearly anything that accepts data. The installer application, available from the top launcher bar, is called **Puppy Installer**, and it manages installing Puppy and applications for Puppy. Puppy can boot from a thumb drive, an optical disc, a hard drive, and even an SD card.
  - The **Puppy Installer** application is also used to install apps onto Puppy. Because Puppy is based on Ubuntu, there aren't likely to be any Linux packages missing from its repositories, and if there are, you can probably use a [Flatpak](https://docs.fedoraproject.org/en-US/fedora-silverblue/getting-started/#flatpak).
  - Puppy is the original tiny Linux. While it's not the tiniest any more, it's by far the easiest.
  - Minimum installation requirements:
    300 MB of RAM
    Pentium 2 (or equivalent), 900 MHz
    Hard drive (Optional as it can run quite well on any USB drive).
  - Pros: tiny, fast, runs best on old hardware.
    Cons: ugly UI, unfamiliar preinstalled apps.
  
  > Best Middleweight USB persistent distro: MX Linux
  >
  > 2nd Best Middle Weight USB persistent distro: Antix Linux
  >
  > Best Lightweight USB persistent distro: Puppy Linux
  
- [ ] AntiX Linux

  - MX Linux for old PCs.
  - [antiX](https://antixlinux.com/) is a distribution based on Debian Linux boasting of a systemd-free Linux distribution. The window manager that comes with this OS is the icewm that keeps the system on low resource demands.
  - It runs considerably fast on low-end and old PCs but is quite stripped down and ships with few applications given its small footprint of about **730MB**.
  - antiX is highly compact, as its ISO file only accumulates 700MBs of free disk space. Its compactness does, however, have a downside because it doesn’t have a lot of pre-installed applications owing to the small size. antiX provides fast booting; therefore, it also finds application in working as a live operating system on CD or USB. The lightweight distro would run smoothly on a 32-bit system with 256MB of RAM and Pentium 3.
  - No PAE distro.
  - Minimum installation requirements:
    256MB of RAM
    5 GB of hard disk space
    Pentium 2
  - Pros: fast, good support for older hardware through AntiX Magic software, based on Debian, friendly community and forum.
    Cons: hard to install some apps that don’t come directly with the OS.

- [ ] MX Linux

  - [MX Linux](https://mxlinux.org/) is a midweight Linux distribution that combines stability, high-performance, simplicity, and elegance to give you a reliable OS that works out of the box with pre-installed applications such as VLC media player, Firefox web browser, LibreOffice suite, and Thunderbird to mention a few.
  - [MX Linux](https://mxlinux.org/) is a stable and popular Linux distribution based on Debian. By default, it ships with an XFCE desktop with lots of features and customizations. The UI is quite basic and simple. This simplicity echoes the MXLinux philosophy and beginners should easily get started and Professional users can make customizations that can suit them. MX Linux is renowned for its high performance while at the same time keeping it simple on the UI.
  - It’s built on **Debian 10 Buster** and ships with an Xfce desktop environment that is low on resource usage. Like many of the lightweight edition, it’s available in both 32-bit and 64-bit versions.
  - Minimum installation requirements:
    512 MB of RAM
    A modern i486 Intel or AMD processor
    5 GB free hard drive space
  - Pros: fast, a more user friendly version of Debian stable, Xfce with a solid custom look (a few tweaks and you have a great looking Xfce desktop), no systemd by default, but you have a boot option to use it, Antix and Mepis tools that are useful, loads fast in a Virtual Machine, friendly community and forum.
    Cons: I don't know yet :)

- [ ] Peppermint

  - The original creation of [Peppermint](https://peppermintos.com/) was intended to make it look like a web-centered approach with netbooks in mind. It is a cloud-based Linux distribution with minimal hardware requirements (in other words, it is a fast and stable Linux desktop OS with a focus on cloud and web application management). The latest release, Peppermint 10 Respin, is based on an LTS codebase.
  - The desktop environment is also Ubuntu based and uses the LXDE to give its users a smoother experience. Peppermint uses an ICE application that integrates websites into a desktop app. ICE puts web applications on the same pedestal as locally installed software. This is done through transmitting to the desktop through the SSBs, hence making the web apps imitate local applications.
  - It has a perfect user guide that new users may find resourceful with a forum for troubleshooting issues.
  - It ships with an ultra-smooth Nemo file manager that provides an easy way of navigating between different file locations. It’s based off **Lubuntu**.
  - Minimum installation requirements:
    1 GB of RAM
    X86 Intel-based processor
    At least 5GB of hard disk space
  - Pros: fast, nice UI, it has a good guide and forum.
    Cons: based on Lubuntu, requires more RAM than other distros (> 1GB, it is better to have 2 GB).

  > Additional notes and recommendations on the distro.
  >
  > - [Advanced Methods page for Lubuntu](https://wiki.ubuntu.com/Lubuntu/AdvancedMethods).

- [ ] Debian

  - [Debian](https://www.debian.org/) is the foundation stone of Ubuntu, and while its successor may not support 32-bit anymore, Debian has withstood the test of time in this aspect. Containing only free software, Debian gives users access to online repositories that offer non-free software and over 51,000 packages.
  - Despite being a fundamental and rather old distribution, Linux developers have recently emphasized more security, making Debian secure to most threats. Furthermore, Debian has become Java-friendly, meaning that users can run and use almost any Java-based software and programs on Debian. Many of these programs are already available in Debian’s repositories, which is quite convenient and handy.
  - Minimum installation requirements:
    512MB of RAM (2GB recommended)
    1GHz Pentium processor.
    X86 Intel-based processor
    At least 10GB of hard disk space
  - Pros: fast, secure, stable, good for developers.
    Cons: can be difficult to install and use.

Honorable mentions: Sparky (slow, ugly UI), SliTaz.

## References

1. https://www.makeuseof.com/tag/whats-the-difference-between-linux-distributions-if-theyre-all-linux-makeuseof-explains/
2. https://linuxjourney.com/
3. https://itsubuntu.com/linux-mint-20-dropped-ubuntus-snap/
4. https://itsfoss.com/best-linux-distributions/
5. https://www.tecmint.com/best-linux-distributions-for-beginners/
6. https://www.tecmint.com/linux-distro-for-power-users/
7. https://www.quora.com/Should-I-use-ArchLinux-instead-of-Ubuntu-for-programming
8. https://www.quora.com/Is-Arch-Linux-the-best-Linux-distribution/answer/Emanuel-Couto/
9. https://www.reddit.com/r/EndeavourOS/comments/d22zyy/thinking_about_giving_endeavouros_a_shot_any_tips/
10. https://www.reddit.com/r/DistroHopping/comments/cocmmx/manjaro_vs_endeavour_os/
11. https://www.reddit.com/r/DistroHopping/comments/k1i4m7/dead_distros_antergos/
12. https://www.reddit.com/r/linux/comments/cvghw7/thoughts_on_endeavouros_a_replacement_for_antergos/
14. https://unix.stackexchange.com/questions/158244/what-is-the-difference-between-i686-and-x86-64-packages
15. https://opensource.com/article/19/6/linux-distros-to-try
16. https://linoxide.com/distros/lightweight-linux-distros-for-old-laptop/
17. https://www.tecmint.com/linux-distributions-for-old-computers/
18. https://www.fosslinux.com/43256/linux-distributions-support-32-bit-architecture.htm
19. https://embeddedinventor.com/best-lightweight-linux-distros-comparison-analysis/
20. https://www.reddit.com/r/linux/comments/cyr752/mx_linux_top_of_distrowatchcom_whats_all_the_hype/
21. https://www.quora.com/Why-is-MX-Linux-so-popular#:~:text=It's%20popular%20because%20it%20makes,which%20are%20great%20time%20savers.
22. https://www.reddit.com/r/linux/comments/b2mxot/why_is_mx_linux_so_popular/