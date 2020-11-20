# Boot and startup

## Table of Contents

- [An introduction to the Linux boot and startup processes](#An-introduction-to-the-Linux-boot-and-startup-processes)
- [Login issue](#Login-issue)

## An introduction to the Linux boot and startup processes

In reality, there are two sequences of events that are required to boot a Linux computer and make it usable: 

- boot (ru: загрузка ядра)
- startup (ru: запуск системы)

The *boot* sequence starts when the computer is turned on, and is completed when the kernel is initialized and systemd is launched. The *startup* process then takes over and finishes the task of getting the Linux computer into an operational state.

Boot and startup process is comprised of the following steps which will be described in more detail in the following sections:

1. **BIOS POST**. The first step of the Linux boot process really has nothing whatever to do with Linux. This is the hardware portion of the boot process and is the same for any operating system. When power is first applied to the computer it runs the POST (Power On Self Test) which is part of the BIOS (Basic I/O System).
   When IBM designed the first PC back in 1981, BIOS was designed to initialize the hardware components. POST is the part of BIOS whose task is to ensure that the computer hardware functioned correctly. If POST fails, the computer may not be usable and so the boot process does not continue.

   > BIOS POST checks the basic operability of the hardware and then it issues a BIOS [interrupt](https://en.wikipedia.org/wiki/BIOS_interrupt_call), INT 13H, which locates the boot sectors on any attached bootable devices. The first boot sector it finds that contains a valid boot record is loaded into RAM and control is then transferred to the code that was loaded from the boot sector.
   >
   > The boot sector is really the first stage of the boot loader. There are three boot loaders used by most Linux distributions, GRUB, GRUB2, and LILO. GRUB2 is the newest and is used much more frequently these days than the other older options.

2. **GRUB2** (ru: загрузка ядра). GRUB2 stands for "GRand Unified Bootloader, version 2" and it is now the primary bootloader for most current Linux distributions. GRUB2 is the program which makes the computer just smart enough to find the operating system kernel and load it into memory.
   Although GRUB2 does not officially use the stage notation for the three stages of GRUB2, it is convenient to refer to them in that way, so I will in this document:
   - Because the boot record must be so small, it is also not very smart and does not understand filesystem structures. Therefore the sole purpose of stage 1 is to locate and load stage 1.5 (ru: благодаря bootstrap коду). In order to accomplish this, stage 1.5 of GRUB must be located in the space between the boot record itself and the first partition on the drive. After loading GRUB stage 1.5 into RAM, stage 1 turns control over to stage 1.5.
   - The /boot directory must be located on a filesystem that is supported by GRUB. Not all filesystems are. The function of stage 1.5 is to begin execution with the filesystem drivers necessary to locate the stage 2 files in the /boot filesystem and load the needed drivers.
   - The function of GRUB2 stage 2 is to locate and load a Linux kernel into RAM and turn control of the computer over to the kernel. The kernel and its associated files are located in the /boot directory. The kernel files are identifiable as they are all named starting with vmlinuz

3. **Kernel initialization**. All of the kernels are in a self-extracting, compressed format to save space. The kernels are located in the /boot directory, along with an initial RAM disk image, and device maps of the hard drives.

   After the selected kernel is loaded into memory and begins executing, it must first extract itself from the compressed version of the file before it can perform any useful work. Once the kernel has extracted itself, it loads [systemd](https://en.wikipedia.org/wiki/Systemd), which is the replacement for the old [SysV init](https://en.wikipedia.org/wiki/Init#SysV-style) program, and turns control over to it.

   > A comment from Habr:
   >
   > > Ошибка в тексте: "оно загружает systemd, который является заменой старой программе SysV init, и передает ему контроль". Ядро не передаёт никому контроль, ядро запускает первый процесс, который уже управляет запуском других процессов.


4. **The startup process**. systemd is the mother of all processes and it is responsible for bringing the Linux host up to a state in which productive work can be done. What it does:
   - First, systemd mounts the filesystems as defined by **/etc/fstab**, including any swap files or partitions. At this point, it can access the configuration files located in /etc, including its own. It uses its configuration file, **/etc/systemd/system/default.target**, to determine which state or target, into which it should boot the host. The **default.target** file is only a symbolic link to the true target file. For a desktop workstation, this is typically going to be the graphical.target, which is equivalent to **runlevel** **5** in the old SystemV init. For a server, the default is more likely to be the **multi-user.target** which is like **runlevel** **3** in SystemV. The **emergency.target** is similar to single user mode.
     Each target has a set of dependencies described in its configuration file. systemd starts the required dependencies. These dependencies are the services required to run the Linux host at a specific level of functionality. When all of the dependencies listed in the target configuration files are loaded and running, the system is running at that target level.
   - systemd also looks at the legacy SystemV init directories to see if any startup files exist there. If so, systemd used those as configuration files to start the services described by the files. The deprecated network service is a good example of one of those that still use SystemV startup files in Fedora.
   - The **sysinit.target** and **basic.target** targets can be considered as checkpoints in the startup process. Although systemd has as one of its design goals to start system services in parallel, there are still certain services and functional targets that must be started before other services and targets can be started. These checkpoints cannot be passed until all of the services and targets required by that checkpoint are fulfilled.
   - So the **sysinit.target** is reached when all of the units on which it depends are completed. All of those units, mounting filesystems, setting up swap files, starting udev, setting the random generator seed, initiating low-level services, and setting up cryptographic services if one or more filesystems are encrypted, must be completed, but within the **sysinit.target** those tasks can be performed in parallel
     The **sysinit.target** starts up all of the low-level services and units required for the system to be marginally functional and that are required to enable moving on to the basic.target.
   - After the **sysinit.target** is fulfilled, systemd next starts the **basic.target**, starting all of the units required to fulfill it. The basic target provides some additional functionality by starting units that re required for the next target. These include setting up things like paths to various executable directories, communication sockets, and timers.
   - Finally, the user-level targets, **multi-user.target** or **graphical.target** can be initialized. Notice that the **multi-user.****target** must be reached before the graphical target dependencies can be met.
   - When one of these targets is reached, then startup has completed: graphical.target, multi-user.target, emergency.target, rescue-target. If the **multi-user.target** is the default, then you should see a text mode login on the console. If **graphical.target** is the default, then you should see a graphical login; the specific GUI login screen you see will depend on the default [display manager](https://opensource.com/article/16/12/yearbook-best-couple-2016-display-manager-and-window-manager) you use.
### Issues

OP recently had a need to change the default boot kernel on a Linux computer that used GRUB2.

> The grub2-set-default command did not properly set the default kernel index for me in the **/etc/default/grub** file so that the desired alternate kernel did not boot. So I manually changed /etc/default/grub **GRUB_DEFAULT=saved** to **GRUB_DEFAULT=2** where 2 is the index of the installed kernel I wanted to boot. Then I ran the command **grub2-mkconfig** **> /boot/grub2/grub.cfg** to create the new grub configuration file. This circumvention worked as expected and booted to the alternate kernel.

  ### Conclusions

GRUB2 and the systemd init system are the key components in the boot and startup phases of most modern Linux distributions. Despite the fact that there has been controversy surrounding systemd especially, these two components work together smoothly to first load the kernel and then to start up all of the system services required to produce a functional Linux system.

> Comments from Habr:
>
> > MBR сейчас отходит в мир иной. Я сейчас как-то предпочитаю выбор операционки для загрузки оставлять на откуп EFI. Плюс на EFI все таки grub+systemd грузится чуть медленней чем EFIstub+systemd.
>
> > Efistub к сожалению не даст гибкости, которую дает полноценный загрузчик. Не прописывать же все варианты загрузки в nvram. С другой стороны, grub — сложный монстр. Есть отличный загрузчик refind, который из себя представляет бинарь + опционально драйверы ФС + конфиги от пустых до любой сложности. Его невозможно сломать, в отличие от grub.

## Login issue

**Issue. Can't log in into XFCE4 (login loop).**

I broke Whisker Menu after killing this process in `top`. This led to the loop login problem.

**Solution.**

Possible solutions:

`<Ctrl>+<Alt>+<F1>` - enter CLI. `<Ctrl>+<Alt>+<F7>` - exit CLI.

1. `sudo apt clean` — that's what helped me. I found the solution in [this](https://forums.linuxmint.com/viewtopic.php?f=46&t=302293) discussion.

2. `flatpak remove --unused` or `flatpak list` plus selected `flatpak remove foo's` or `flatpak remove --all` — from that discussion.

3. `sudo timeshift --list` plus `sudo timeshift --delete --snapshot foo` or `sudo timeshift --delete-all`  —  from that discussion. This is the most frequently observed reason here: having configured Timeshift to store onto your system root and keeping too many snapshots.

4. `rm ~/.Xauthority && rm ~/.ICEautority` — did this when I found out that I don't see the login screen. Didn't help. On this action I was pushed by [this](https://askubuntu.com/questions/350692/xubuntu-13-04-x-login-loop) discussion.

5. Try resetting your XFCE configuration as suggested [here](https://superuser.com/questions/246872/cant-login-into-fedora-14-xfce-desktop-for-the-second-time).

   ```bash
   mv ~/.config/xfce4 ~/xfce-config-backup
   rm -r ~/.cache
   ```

   If that doesn't work, try starting XFCE from the command line and see if it displays any errors:

   ```bash
   startxfce4
   ```

**How to bring back the login screen?**

This can be made via the properties of the new Whisker Menu. 

**Just in case.**

[Login loop in Cinnamon](https://forums.linuxmint.com/viewtopic.php?t=274362).

[How to get a system with only `xfce4` in Bionic Beaver, 18.04 LTS and How to get a system with `xfce4` alongside standard Ubuntu with `gnome`in Bionic Beaver, 18.04 LTS](https://askubuntu.com/questions/1026862/cant-load-xfce-due-to-login-loop-other-des-work)

## References

1. https://opensource.com/article/17/2/linux-boot-and-startup
2. https://habr.com/ru/company/otus/blog/424761/
3. https://forums.linuxmint.com/viewtopic.php?f=46&t=302293
4. https://askubuntu.com/questions/350692/xubuntu-13-04-x-login-loop
5. https://superuser.com/questions/246872/cant-login-into-fedora-14-xfce-desktop-for-the-second-time
6. https://forums.linuxmint.com/viewtopic.php?t=274362
7. https://askubuntu.com/questions/1026862/cant-load-xfce-due-to-login-loop-other-des-work