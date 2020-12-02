# Installing desktop environments

## Change the Desktop Environment in POP!_OS and Ubuntu

> Most of the information in this (and the next) paragraph was taken from [this](https://support.system76.com/articles/desktop-environment/) article.

Pop!_OS and Ubuntu both include the GNOME desktop environment by default. A desktop environment is responsible for the look and feel of the graphical desktop, and includes many of the key programs that get used every day.

You can install an alternative desktop environment using the instructions below. If you run into trouble while using an alternative desktop environment, you may wish to revert to the default environment. To ensure the default GNOME desktop environment is installed in Pop!_OS, install the `pop-desktop` package:

```bash
sudo apt install pop-desktop
```

For Ubuntu, install the `ubuntu-desktop` package instead:

```bash
sudo apt install ubuntu-desktop
```

The desktop environment is basically the top graphical layer of the OS. The desktop environment is launched by a display manager; Pop!_OS and Ubuntu both use GDM (GNOME Display Manager) by default.

If multiple desktop environments are installed, GDM will display a gear icon, which will allow you to select the desktop environment you want to launch. You will need to either reboot or restart your display manager using `sudo systemctl restart gdm` before a newly-installed desktop environment will show up in the list of options.

### MATE

This command will install MATE and its dependencies:

```bash
sudo apt install mate-desktop-environment mate-desktop-environment-extras ubuntu-mate-themes
```

### Cinnamon

Cinnamon is installed with:

```bash
sudo apt install cinnamon-desktop-environment
```

### GNOME

While Pop and Ubuntu contain GNOME by default, both include a number of customizations to GNOME. You can also install a vanilla GNOME session to get the upstream GNOME experience.

You can install the vanilla GNOME session using this command:

```bash
sudo apt install gnome-session
```

### KDE Plasma

The KDE Plasma desktop and its dependencies can be installed with this command:

```bash
sudo apt install kde-standard
```

While installing KDE, you'll be prompted to choose a display manager:

![Display Manager Section](https://support.system76.com/images/desktop-environment/sddm-1.png)

Press Enter to select the OK option. (If the OK option is not selected, press Tab to select it.) At the list, press Enter again to keep gdm3 as your display manager:

![Display Manager Section](https://support.system76.com/images/desktop-environment/sddm-2.png)

### UKUI

UKUI is a lightweight desktop environment based on a pluggable framework for Linux and other UNIX-like distributions. It provides a simple experience for browsing, searching, and managing your computer. It is developed using GTK and Qt.

![UKUI](https://support.system76.com/images/desktop-environment/UKUI.png)

UKUI can be installed with:

```bash
sudo apt install ukui-desktop-environment
```

### XFCE

XFCE embodies the traditional UNIX philosophy of modularity and re-usability. This environment provides a good amount of conformity for the programs written for it. XFCE also provides a highly customizable environment, while being leaner on resources.

You can install XFCE and its dependencies with this command:

```bash
sudo apt install xfce4 xfce4-goodies
```

### LXDE

The Lightweight X11 Desktop Environment is a fast and energy-saving desktop environment. It looks similar to older versions of Windows. This is a lean desktop environment and can help extend battery life in laptops.

LXDE can be installed with:

```bash
sudo apt install lxde
```

### LXQt

LXQt can be installed with:

```bash
sudo apt install lxqt
```

## Troubleshooting

Desktop environments can interfere with each other or change system-wide settings. Issues with a desktop environment's appearance can generally be fixed by changing the theme in the Appearance control panel.

### Change Notification Dialog

Xfce will change the notification dialog to its own. It can be configured with this command:

```bash
xfce4-notifyd-config
```

Or changed back to Unity's with this command:

```bash
sudo gedit /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service
```

And replace this line:

> Exec=/usr/lib/xfce4/notifyd/xfce4-notifyd

With this one:

> Exec=/usr/lib/x86_64-linux-gnu/notify-osd

### Fix Broken Desktop Background

If your background turns to black or white, or stops changing when you select a new background, re-enable it with this command:

```bash
gsettings set org.gnome.settings-daemon.plugins.background active true
```

### Remove Duplicate Options From Login Screen

Many desktop environments supply both a bare-bones environment, a full featured environment, or other options. Cinnamon provides both a 2d and 3d environment. Some of the extra options aren’t needed, and don’t have to be presented as options. The options available at login are in the `/usr/share/xsessions` folder. Simply rename or delete the files to remove them as options.

Lubuntu’s extra options:

```
/usr/share/xsessions/Lubuntu-Netbook.desktop
/usr/share/xsessions/LXDE.desktop
/usr/share/xsessions/openbox.desktop
```

Xubuntu’s extra option:

```
/usr/share/xsessions/xfce.desktop
```

Cinnamon’s extra option:

```
/usr/share/xsessions/cinnamon2d.desktop
```

### Change Automatic Startup Programs

Some desktop environments add addition programs to be started at boot. To change them, run the Startup Applications program, and turn off any additional startup programs that were undesirably added.

### Double Lock Screen Passwords

Sometimes the GNOME screensaver presents a second password unlock screen after suspending or locking the screen. It can be disabled with this command:

```bash
gsettings set org.gnome.desktop.screensaver lock-enabled false
```

Or, if that doesn't stop the 2nd prompt, the screensaver can be removed with this command:

```bash
sudo apt purge gnome-screensaver
```

When using GNOME, the lock screens will still function normally even with the screensaver disabled.

### Enable Cinnamon Lock Screen

If Cinnamon's desktop lock screen isn't functioning, this command will re-enable it:

```bash
gsettings set org.cinnamon.desktop.lockdown disable-lock-screen false
```

### Managing Multiple Desktop Environments

Ubuntu's unity greeter signing screen will only accommodate a certain number of desktop environments. If the list is too large, then extra options can be deleted from this folder:

```
/usr/share/xsessions/
```

Another solution is to switch to the lightdm-gtk-greeter following the instructions above. This secondary greeter is installed with GNOME, or can be installed manually with this command:

```bash
sudo apt install lightdm-gtk-greeter
```

### Removing Desktop Environments

If you no longer want to use a desktop environment, it can be removed by using:

```bash
sudo apt purge ...
sudo apt autoremove
```

For example, to remove KDE:

```bash
sudo apt purge kde-*
sudo apt autoremove
```

Or to remove Unity:

```bash
sudo apt purge ubuntu-desktop
sudo apt autoremove
```

## Installing DE on Ubuntu 18.04

We can install various desktop environments for Ubuntu in case we don't like standard one (gdm3). The key point here is we need to distinguish the package of the desktop environment from the big package with many tools. For instance:

- If we install **xfce4**, we will just get the Xfce desktop and some basic packages included in the Xfce desktop such as [Thunar file manager](https://docs.xfce.org/xfce/thunar/start).
- If you choose to install the **xubuntu-package**, it will have Xfce desktop, all the packages in xfce4 and additional packages that are provided by Xubuntu distribution.

Do not install two packages together!!!

I want to say that the installation of these packages is really bad for the system. If we want to remove them later, we might get stuck. It's not easy to remove them all! Also, I saw on Quora that having too many of them will cause problems with the system (Ubuntu does not deal very well with having more than one desktop environment), but I didn't encounter those problems.

### Install Kubuntu desktop

> In short, Kubuntu is a little bit better than Ubuntu in terms of performance. Also, it might be more attractive from design perspective.

We need to execute the next command:

```bash
sudo apt install kubuntu-desktop
```

After that, we need to logout and login in a new session with Plasma desktop by selecting a gear icon.

If we reboot the system, we will get other color of GRUB and new Plymouth's screen.

### Install Xubuntu desktop

> In short, Xubuntu is much better than Ubuntu in terms of performance.

We need to execute the next command:

```bash
sudo apt install xubuntu-desktop
```

After that, we need to logout and login in a new session with Plasma desktop by selecting a gear icon.

Here is how we can install xfce4:

```bash
sudo apt install xfce4
```

### Unistall Xubuntu desktop

This is simple. According to [this](https://itsfoss.com/install-xfce-desktop-xubuntu/) post in order to remove xfce4 we need to do next:

```bash
sudo apt purge xubuntu-icon-theme xfce4-*
sudo apt autoremove
```

If you used xubuntu-desktop package to install Xfce, use the commands below:

```bash
sudo apt purge xubuntu-desktop xubuntu-icon-theme xfce4-*
sudo apt purge plymouth-theme-xubuntu-logo plymouth-theme-xubuntu-text
sudo apt autoremove
```

> Actually, I installed two packages at the same time which is caused a problem with Plymouth — there were no changes with it. I just removed all packages as described above.

### Unistall Kubuntu desktop

This is SO HARD! It might not delete all packages, but it deletes something at least.

f you installed it via `sudo apt-get install kubuntu-desktop` you can uninstall it by

```bash
sudo apt-get remove kubuntu-desktop --autoremove
```

To be safe, run the reconfigure on your login manager — choose gdm3.

```bash
sudo dpkg-reconfigure gdm3
```

After that, you might need to reboot your machine.

To remove KDE entirely, try this:

```bash
sudo apt-get remove --purge kde-plasma-desktop kde-workspace kubuntu* plymouth-theme-kubuntu-logo plymouth-theme-kubuntu-text
sudo apt-get autoremove --purge && apt-get autoclean
```

> In this case, we also remove the Plymouth's new theme.

Also, I changed the Plymouth Splash Screen to default (if it wasn't set up correctly after removing Kubuntu's screen from Plymouth):

```bash
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u
```

I saw on the Internet that it might not work correctly — not all packages were removed. To check this we can use this command:

```bash
dpkg-query -l "*kde*" "*plasma*"
```

We'll see a large number of installed KDE packages (`ii`) that we should purge. 

Sure, we can just change our display manager configuration to start Gnome and do nothing with these packages :) As a reminder, this is where you can do it — to set the default display manager:

```bash
sudo dpkg-reconfigure gdm3
```

## References

1. [Change the Desktop Environment in POP!_OS](https://support.system76.com/articles/desktop-environment/)
2. [Install Xfce Desktop on Ubuntu and Turn it Into Xubuntu](https://itsfoss.com/install-xfce-desktop-xubuntu/)
3. [Uninstall kubuntu-desktop from ubuntu 18.04](https://askubuntu.com/questions/1068643/uninstall-kubuntu-desktop-from-ubuntu-18-04)
4. [How to completely remove desktop?](https://askubuntu.com/questions/73993/how-to-completely-remove-desktop#answer-549041)
5. [Ubuntu shows 'Kubuntu' on boot](https://askubuntu.com/questions/285536/ubuntu-shows-kubuntu-on-boot)
6. [Unable to fully remove Kubuntu Desktop?](https://www.reddit.com/r/linuxquestions/comments/a7h1iy/unable_to_fully_remove_kubuntu_desktop/)