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

All we have to do is to create systemd service and add it to the `etc/systemd/system` folder. [This tutorial](https://coreos.com/os/docs/latest/getting-started-with-systemd.html) helped me to write `start_and_stop.service` file:

```
[Unit]
Description=Run Scripts at Start and Stop
After=network-manager.service
Requires=network-manager.service

[Service]
Type=oneshot
RemainAfterExit=true
ExecStart=/bin/bash /home/vladkinoman/scripts/turn-on-networking-on-startup.sh
ExecStop=/bin/bash /home/vladkinoman/scripts/turn-off-networking-on-shutdown.sh

[Install]
WantedBy=multi-user.target
```

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

