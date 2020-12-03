# Flatpak

![](https://flatpak.org/img/delivery_truck2-bb72338f.png)

Flatpak is a utility for software deployment and package management for Linux. It is advertised as offering a sandbox environment in which users can run application software in isolation from the rest of the system.

Flatpak was developed as part of the [freedesktop.org](https://www.wikiwand.com/en/Freedesktop.org) project (formerly known as X Desktop Group or XDG) and was originally called xdg-app.

## Features

- Applications need permissions to have access to resources such as [Bluetooth](https://www.wikiwand.com/en/Bluetooth), sound (with [PulseAudio](https://www.wikiwand.com/en/PulseAudio)), [network](https://www.wikiwand.com/en/Computer_network), and [files](https://www.wikiwand.com/en/Computer_file). These permissions are defined by the maintainer of the Flatpak and can be added or removed by users on their system.
- Flatpak allows application developers to directly provide updates to users without going through distributions, and without having to package and test the application separately for each distribution. Develop and test your application in an environment that's identical to the one users have. Flatpak makes it easy to bundle your own libraries as part of your app.
- *Flathub,* a repository (or remote source in the Flatpak terminology) located at [flathub.org](flathub.org), has become the [de facto standard](https://www.wikiwand.com/en/De_facto_standard) for getting applications packaged with Flatpak.
  Although *Flathub* is the de facto source for applications packaged with Flatpak, Flatpak can work independently of Flathub; it is possible to host a Flatpak repository that is completely independent of Flathub.
- Theoretically, Flatpak apps can be installed on any existing Linux distribution. Among the first Linux distributions which added support to Flatpak apps out-of-the-box were Endless OS, Linux Mint, Elementary OS, Fedora Silverblue, Zorin OS, and Pop! OS. Flatpak apps continue to be compatible with new versions of Linux distributions.
- Flatpak's build tools are simple and easy to use, and come with a [full set of documentation](https://docs.flatpak.org/).

## Pros and Cons

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

- **Flatpak is the future (?)**. The advantage with flatpak (and snaps) is that, over time, more applications will be distributed as a flatpak or snap which will hopefully increase availability of applications on Linux as a whole.

- It also allows you to use certain programs without having to dual-boot.

- In an atomic system, where you have to reboot for updates, those flatpaks can be updated without a reboot. Both [Project Atomic/ostree](https://www.projectatomic.io/) and [OpenSUSE Transactional Updates](https://kubic.opensuse.org/blog/2018-04-04-transactionalupdates/) require reboots for updates. And just because you did not have to reboot, does not mean that you should not have rebooted.

**Cons**

- **Another thing on your OS**. It's another thing to keep track of, and takes up more space.
- **Flatpak isn't very secure**. Flatpak is sandboxed by default (a flatpak can do very little; it can't open windows; it can't play sound; it can't write anywhere except a private directory), applications request more permissions at install time which you accept (and can later revoke as you wish).
  The problem is that most permissions that are required (x11, pulseaudio) are **not secure**. So we all have to wait for Wayland/Pipewire to become the norm. Don't forget to revoke the permissions!
  However, Flatpak blacklists a handful of directories even if you request them.

## Working with Flatpak

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

## References

1. https://www.wikiwand.com/en/Flatpak
2. https://flatpak.org
3. https://flathub.org
4. [de facto standard](https://www.wikiwand.com/en/De_facto_standard)
5. https://www.reddit.com/r/linux/comments/99naxl/whats_so_good_about_flatpak/
6. https://flathub.org/apps/details/com.spotify.Client
7. https://flathub.org/apps/details/org.fedoraproject.MediaWriter

