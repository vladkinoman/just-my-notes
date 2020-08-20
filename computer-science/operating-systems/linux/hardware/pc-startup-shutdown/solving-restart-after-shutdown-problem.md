# Solving "restart after shutdown" problem

So, my problem is next. PC restarts/launches automatically after shutdown on Linux Mint 20. 

Thanks to [this comment](https://askubuntu.com/questions/760851/ubuntu-16-reboots-seconds-after-shutdown#answer-777733), I identified that PC restarts if and only if my Wi-Fi/networking was enabled before the shutdown. That's all. Yes, you can manually press the "Wi-Fi" button every time before the shutdown, but that would be annoying. So, how did I manage to remove this problem programmatically? I thought it would be nice to enable/disable networking myself using systemd service.

So, we need to create two simple scripts and one systemd service. Let's start with scripts. I found out in [this article](https://askubuntu.com/questions/597116/how-to-disable-wireless-from-command-line#answer-597131) that `nmcli` app helps us to enable/disable networking programmatically. Now we must add the following lines to the corresponding scripts:

```bash
$ echo -e `#!/bin/bash \nnmcli networking off` > turn-off-networking-on-shutdown.sh
$ echo -e `#! /bin/bash \nnmcli networking on` > turn-on-networking-on-startup.sh
```

Next, we have to make those scripts executable:

```bash
$ sudo chmod +x turn-off-networking-on-shutdown.sh
$ sudo chmod +x turn-on-networking-on-startup.sh
```

All we have to do is to create systemd service and add it to the `etc/systemd/system` folder. [This tutorial](https://coreos.com/os/docs/latest/getting-started-with-systemd.html) helped me to write `start_and_stop.service` file. You can learn more about systemd units and unit files in [this tutorial](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files).

```bash
[Unit]
Description=Run Scripts at Start and Stop
After=NetworkManager.service
Requires=NetworkManager.service
Before=shutdown.target

[Service]
Type=oneshot
RemainAfterExit=true # RemainAfterExit=true causes systemd to believe that the service is running, thereby causing it to run ExecStop at shutdown, but not always see the explanation below). That's why I added Before. Bear in mind, the shutdown order is the reverse startup order (not precisely, but on the whole, it is).
# If we don't have ExecStart then we should write ExecStart=/bin/true.
ExecStart=/bin/bash /home/vladkinoman/scripts/turn-on-networking-on-startup.sh
ExecStop=/bin/bash /home/vladkinoman/scripts/turn-off-networking-on-shutdown.sh

[Install]
WantedBy=multi-user.target
```

---

---

<u>**Subnote**</u>

**Edit**: add `Before=shutdown.target` (found about it from [this article](https://opensource.com/life/16/11/running-commands-shutdown-linux)) because I noticed that service didn't run with `shutdown -h now` command (noticed when I used `journalctl -b-1 -e | grep "start_and_stop.service"`command). However, it worked nicely with `shutdown now`.  It somehow connected to the [runlevel](https://www.liquidweb.com/kb/linux-runlevels-explained/) considering [this answer](https://serverfault.com/questions/933052/whats-the-difference-between-shutdown-h-and-shutdown-in-centos7#:~:text=1 Answer&text=shutdown now traditionally takes the,power off to the server#answer-933053):

> `shutdown now` traditionally takes the system down to runlevel 1 (single user mode).
>
> `shutdown -h now` will take the system down to runlevel 0 (system halt). This may or may not shut the power off to the server. It depends on the system you're running it on. 

According to the [detailed answer](https://askubuntu.com/questions/578144/why-doesnt-running-sudo-shutdown-now-shut-down):

> Traditionally, the command `sudo shutdown now` will take you to the runlevel 1 (recovery mode); this will happen for both Upstart and SysV init. To get what you want, i.e., <u>to shut down the computer properly, you need to give the `-h` switch to `shutdown`</u>.
>
> One thing to note here is that `halt` will close all the processes, turn off the CPUs and return the control to a ROM monitor of the mainboard needing the user to press the power button to get the power supply turned off, whereas `poweroff` after turning off the CPUs will simply turn off the power supply resulting in a proper shutdown.
>
> The `-h` switch of `shutdown` will either `halt` or `poweroff` the computer, the decision will be taken by the system although in Ubuntu I have seen that it would normally `poweroff` the machine. To be sure of that, you can use the `-P` switch with `shutdown` to `poweroff` the computer.

According to [this answers](https://serverfault.com/questions/191537/shutdown-what-is-difference-between-power-off-and-halt#:~:text=Halting%20involves%20stopping%20all%20CPUs,PSU%20to%20disconnect%20main%20power.&text=will%20halt%20the%20system%20%2D%20meaning,something%20like%20%22System%20halted%22.) halting involves stopping all CPUs on the system. Powering off involves sending an ACPI command to signal the PSU to disconnect main power (sending an ACPI power off command to the power supply). So, we have next commands:

- `shutdown -H now`. I think this is more like a legacy command. According to [this comment](https://askubuntu.com/questions/578144/why-doesnt-running-sudo-shutdown-now-shut-down#answer-578205) it's a legacy from the days when the physical machine couldn't power off by itself. 

  > For example, the halt command `sudo halt` terminates all programs and unloads almost everything from RAM, *ready* to be powered off. However, if you run `sudo halt -p`, it will do all that, then signal the system to power off, or in the case of the `shutdown` command, you need the `-a` option, I believe, though I personally use `halt`.

  So, if I enter `shutdown -H now` it will halt the system - meaning the system will shutdown and at the end stop at a screen with the last message being something like "System halted", meaning it is safe to hit the power switch. After halt a hard power off (pressing the power button or unplugging the power supply) will not damage the system, because it is already halted in a graceful way (it means flush buffers, unmount drives, close all processes, but not power off). 

  > Well, technically speaking, you can halt the system without powering it off. So you issue a halt, wait for it to say "You can turn the computer off now" and then you can hit the power button without worrying that something is going to unmount weirdly.
  >
  > But in most modern unix's halt, shutdown, init 0, poweroff, etc, etc all do about the same thing. Halt, for example, is mapped to "shutdown -h" when the system isn't in runlevel 0 or 6.
  >
  > The redundant commands are all nods to backward compatibility with older, proprietary *nix's.

- `shutdown -P now` will power off the system - meaning the system will shutdown and at the end power off (only possible if the system actually supports it but most systems I know have for quite a while now). So, `poweroff`, naturally will halt the system and then call ACPI power off.

- `shutdown -h now` will only halt or power off the system depending on what's the default on that system (can sometimes be changed in BIOS). `poweroff` is the default option on my system. Between, these days `halt` is smart enough to automatically call `poweroff` if ACPI is enabled. In fact, they are functionally equivalent now. <u>`shutdown -h now` is the right way to turn the PC off</u>. 

- `shutdown now`. I don't really know what this command does. I just know that it is bad, because it takes the system down to runlevel 1 (single user mode) which isn't what we want. We want to be on runlevel 0 (Halt).

---

---

Notice, that this service requires `network-manager.service` and only after executing this our `start_and_stop.service` will be activated. I find out about it from [this question](https://askubuntu.com/questions/667714/networkmanager-is-not-running-error-after-manually-upgrading-nmcli-to-1-0-6).

> Somewhere around here, you can make this service executable:
>
> ```bash
> $ sudo chmod u+x /etc/systemd/system/start_and_stop.service
> ```
>
> However, the terminal tells me that this is not necessary at all :man_shrugging:

After that, we need to enable that service:

```bash
$ sudo systemctl enable /etc/systemd/system/start_and_stop.service
$ sudo systemctl start start_and_stop.service
```

To verify the unit started, we can use `systemctl` commands (the last one was found [here](https://linux-audit.com/auditing-systemd-solving-failed-units-with-systemctl/#:~:text=Services usually fail because of,mounting a particular partition failed) and [here](https://askubuntu.com/questions/919609/whats-the-difference-between-network-manager-service-and-networkmanager-service); the last example also shows that the unit file for `network-manager.service` is a symlink to `NetworkManager.service`):

```bash
$ systemctl is-enabled start_and_stop.service
enabled
$ systemctl is-active start_and_stop.service
active
$ systemctl status start_and_stop.service 
● start_and_stop.service - Run Scripts at Start and Stop
     Loaded: loaded (/etc/systemd/system/start_and_stop.service; enabled; vendor preset: en>
     Active: active (exited) since Mon 2020-08-17 10:28:12 EEST; 8h ago
   Main PID: 4567 (code=exited, status=0/SUCCESS)
      Tasks: 0 (limit: 9268)
     Memory: 0B
     CGroup: /system.slice/start_and_stop.service

Aug 17 10:28:05 HP-ProBook-450-G0 systemd[1]: Starting Run Scripts at Start and Stop...
Aug 17 10:28:12 HP-ProBook-450-G0 systemd[1]: Finished Run Scripts at Start and Stop.
lines 1-10/10 (END)
```

Also, we can read the unit's output with `journalctl`

```bash
$ journalctl -f -u start_and_stop.service
```

> Not necessarily, but after these things are done, you need to reboot your PC.

Now, you can build the plot where you can see all the services and when they start their execution on startup. Here is how you do it:

```bash
$ systemd-analyze plot > plot.svg
```

> Found the last command from [this question](https://serverfault.com/questions/617398/is-there-a-way-to-see-the-execution-tree-of-systemd).

## Problem with Plymouth that appeared after those manipulations

 [According to Archlinux Wiki](https://wiki.archlinux.org/index.php/plymouth) [Plymouth](https://www.freedesktop.org/wiki/Software/Plymouth) is a project from Fedora and now listed among the [freedesktop.org's official resources](https://www.freedesktop.org/wiki/Software/#graphicsdriverswindowsystemsandsupportinglibraries) providing a flicker-free graphical boot process. It relies on [kernel mode setting](https://wiki.archlinux.org/index.php/Kernel_mode_setting) (KMS) to set the native resolution of the display as early as possible, then provides an eye-candy splash screen leading all the way up to the login manager.

So, after enabling my `start_and_stop.service` I encountered two errors with Plymouth, or these problems were already here, and I didn't know about them. These issues are connected with `plymouth-start.service` and `plymouth-read-write.service`. These services were just failed. I found help in [this discussion](https://askubuntu.com/questions/1134720/problem-on-booting-of-linux). So, the best way to fix these problems was just to reinstall Plymouth:

```bash
$ sudo apt-get install --reinstall plymouth
```

After this, I just rebooted my PC.

## Just in case: solutions for similar problems

1. [One person recommends installing laptop-mode-tools in order to control booting-process](https://forums.linuxmint.com/viewtopic.php?t=199810#p1041344). [Laptop-mode-tools page](https://wiki.archlinux.org/index.php/Laptop_Mode_Tools) on wiki.Archilinux.org.
2. [People recommend disabling USB 3.0 support in BIOS](https://forums.linuxmint.com/viewtopic.php?t=283503#p1566002). It would be nice to disable all options with "Wake on" or "Power on" in Bios according to [this comment](https://askubuntu.com/questions/760851/ubuntu-16-reboots-seconds-after-shutdown#answer-763392).
3. [Here, someone recommends disabling Wake on LAN option in Bios](https://forums.linuxmint.com/viewtopic.php?f=46&t=282106#p1556116). It would be nice to install Bios update if you can. If all else fails you can boot with ACPI disabled, because it might be an ACPI issue (ACPI might be faulty). [ACPI](http://en.wikipedia.org/wiki/Advanced_Configuration_and_Power_Interface) is the actual system responsible for handling such power related tasks. Without ACPI support (either software or hardware), you won't be able to listen to the power button event according to [this comment](https://askubuntu.com/questions/310810/can-i-use-the-power-button-to-shut-down-my-computer-gracefully-on-ubuntu-minimal#answer-310813).

Problems with systemd:

1. [Running a script before everything else on shutdown](https://superuser.com/questions/1016827/how-do-i-run-a-script-before-everything-else-on-shutdown-with-systemd). A solution to calling a backup script (file backup to an external USB drive) BEFORE any drives are unmounted (includes RequiresMountsFor). And that's actually a perfect question. Just look at it. The Description, The Code, The Problem, and The Question (briefly formulated question).
2. [Cause a script to execute after networking has started?](https://unix.stackexchange.com/questions/126009/cause-a-script-to-execute-after-networking-has-started#answer-126146). That's actually a tutorial.
3. [systemd: Unit dependencies and order on FedoraMagazine](https://fedoramagazine.org/systemd-unit-dependencies-and-order/). There is a description of the directives `Wants` and `Requires`.
4. [Systemd way to disable wlan if wired network is available?](https://unix.stackexchange.com/questions/517919/systemd-way-to-disable-wlan-if-wired-network-is-available#answer-518782). There are classic solution (with network interfaces) and systemd alternative solutions.
5. [Systemd service runs without exiting](https://unix.stackexchange.com/questions/308311/systemd-service-runs-without-exiting). There is also an explanation of different service types (simple, forking, oneshot, etc.).

After the first installation of that service (without the directive `Before`), I noticed that my PC froze during the shutdown. It may be a problem with `halt`, but if not, then such discussions might be useful:

1. [Can't shut down](https://forums.linuxmint.com/viewtopic.php?t=311370). There is a suggestion to add `GRUB_CMDLINE_LINUX_DEFAULT="apm=power_off"`to the grub file. Also, there is a cool suggestion to use "raising elephants" reboot procedure (R E I S U O). Read about [here](http://blog.kember.net/articles/reisub-the-gentle-linux-restart/).
2. [[SOLVED] Mint 19 Does not Shut Down](https://forums.linuxmint.com/viewtopic.php?t=275160). There is an issue with Nvidia drivers. People recommended adding the Proprietary GPU Drivers PPA.
3. [system does not power off on “poweroff”, just halts](https://askubuntu.com/questions/632591/system-does-not-power-off-on-poweroff-just-halts). There are many interesting options including adding the boot parameter `acpi=noirq` to kernel.
4. [Ubuntu 16.04 hangs on shutdown/restart](https://askubuntu.com/questions/764568/ubuntu-16-04-hangs-on-shutdown-restart). It appears to be a bug in multiple distributions. People suggest adding `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi=force"` to the grub file. There is a [question on Linux Mint forum]([What does "acpi=force reboot=acpi" do ?](https://forums.linuxmint.com/viewtopic.php?f=49&t=274830)) about `"acpi=force reboot=acpi"`.
5. [Linux mint 18 hangs at shutdown](https://unix.stackexchange.com/questions/323383/linux-mint-18-hangs-at-shutdown). There are mentions of `GRUB_CMDLINE_LINUX="apm=power_off"`, `"acpi=force"`, EuP, and Nvidia driver.
6. [System freeze on reboot/shutdown](https://unix.stackexchange.com/questions/530794/system-freeze-on-reboot-shutdown). The issue was because of UEFI boot. So, the user just added `noefi` into the kernel options.