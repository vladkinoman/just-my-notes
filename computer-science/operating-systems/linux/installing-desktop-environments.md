# Installing desktop environments on Ubuntu 18.04

We can install various desktop environments for Ubuntu in case we don't like standard one (gdm3). The key point here is we need to distinguish the package of the desktop environment from the big package with many tools. For instance:

- If we install **xfce4**, we will just get the Xfce desktop and some basic packages included in the Xfce desktop such as [Thunar file manager](https://docs.xfce.org/xfce/thunar/start).
- If you choose to install the **xubuntu-package**, it will have Xfce desktop, all the packages in xfce4 and additional packages that are provided by Xubuntu distribution.

Do not install two packages together!!!

I want to say that the installation of these packages is really bad for the system. If we want to remove them later, we might get stuck. It's not easy to remove them all! Also, I saw on Quora that having too many of them will cause problems with the system (Ubuntu does not deal very well with having more than one desktop environment), but I didn't encounter those problems.

## Install Kubuntu desktop

> In short, Kubuntu is a little bit better than Ubuntu in terms of performance. Also, it might be more attractive from design perspective.

We need to execute the next command:

```bash
$ sudo apt install kubuntu-desktop
```

After that, we need to logout and login in a new session with Plasma desktop by selecting a gear icon.

If we reboot the system, we will get other color of GRUB and new Plymouth's screen.

## Install Xubuntu desktop

> In short, Xubuntu is much better than Ubuntu in terms of performance.

We need to execute the next command:

```bash
$ sudo apt install xubuntu-desktop
```

After that, we need to logout and login in a new session with Plasma desktop by selecting a gear icon.

Here is how we can install xfce4:

```bash
$ sudo apt install xfce4
```

## Unistall Xubuntu desktop

This is simple. According to [1] in order to remove xfce4 we need to do next:

```bash
$ sudo apt purge xubuntu-icon-theme xfce4-*

$ sudo apt autoremove
```

If you used xubuntu-desktop package to install Xfce, use the commands below:

```bash
$ sudo apt purge xubuntu-desktop xubuntu-icon-theme xfce4-*

$ sudo apt purge plymouth-theme-xubuntu-logo plymouth-theme-xubuntu-text

$sudo apt autoremove
```

> Actually, I installed two packages at the same time which is caused a problem with Plymouth — there were no changes with it. I just removed all packages as described above.

## Unistall Kubuntu desktop

This is SO HARD! It might not delete all packages, but it deletes something at least.

f you installed it via `sudo apt-get install kubuntu-desktop` you can uninstall it by

```bash
$ sudo apt-get remove kubuntu-desktop --autoremove
```

To be safe, run the reconfigure on your login manager — choose gdm3.

```bash
$ sudo dpkg-reconfigure gdm3
```

After that, you might need to reboot your machine.

To remove KDE entirely, try this:

```bash
$ sudo apt-get remove --purge kde-plasma-desktop kde-workspace kubuntu* plymouth-theme-kubuntu-logo plymouth-theme-kubuntu-text
$ sudo apt-get autoremove --purge && apt-get autoclean
```

> In this case, we also remove the Plymouth's new theme.

Also, I changed the Plymouth Splash Screen to default (if it wasn't set up correctly after removing Kubuntu's screen from Plymouth):

```bash
$ sudo update-alternatives --config default.plymouth
$ sudo update-initramfs -u
```

I saw on the Internet that it might not work correctly — not all packages were removed. To check this we can use this command:

```bash
dpkg-query -l "*kde*" "*plasma*"
```

We'll see a large number of installed KDE packages (`ii`) that we should purge. 

Sure, we can just change our display manager configuration to start Gnome and do nothing with these packages :) As a reminder, this is where you can do it — to set the default display manager:

```bash
$ sudo dpkg-reconfigure gdm3
```

## References

[Install Xfce Desktop on Ubuntu and Turn it Into Xubuntu](https://itsfoss.com/install-xfce-desktop-xubuntu/)

[Uninstall kubuntu-desktop from ubuntu 18.04](https://askubuntu.com/questions/1068643/uninstall-kubuntu-desktop-from-ubuntu-18-04)

[How to completely remove desktop?](https://askubuntu.com/questions/73993/how-to-completely-remove-desktop#answer-549041)

[Ubuntu shows 'Kubuntu' on boot](https://askubuntu.com/questions/285536/ubuntu-shows-kubuntu-on-boot)

[Unable to fully remove Kubuntu Desktop?](https://www.reddit.com/r/linuxquestions/comments/a7h1iy/unable_to_fully_remove_kubuntu_desktop/)