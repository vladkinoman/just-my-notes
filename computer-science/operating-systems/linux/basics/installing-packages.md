# Installing packages

## Table of Contents

- [Differences between Linux and Windows you should know](#Differences-between-Linux-and-Windows-you-should-know)
- [In short, where do I install the programs?](#In-short-where-do-I-install-the-programs?)
- [Where I can find applications and updates for them?](#Where-I-can-find-applications-and-updates-for-them?)
- [Installing deb packages](#Installing-deb-packages)
- [Installing tar archive](#Installing-tar-archive)
- [Uninstalling packages](#Uninstalling-packages)
  - [Uninstalling packages that were installed from the tar archives](#Uninstalling-packages-that-were-installed-from-the-tar-archives)
  - [How to uninstall a package installed with pip install --user](#How-to-uninstall-a-package-installed-with-pip-install---user)
- [Updating packages](#Updating-packages)
  - [How to update everything in Ubuntu?](#How-to-update-everything-in-Ubuntu?)
- [References](#References)

## Differences between Linux and Windows you should know

- There is no one single (default) place where programs are installed like C:\Program Files\ "per se" because of security reasons.

- Many Linux programs installs all over the place, parts of them installs in different folders.

  > Actually, the same thing happens in Windows too, when some big programs are installing files in ProgramData or CommonFiles folders. Many specific user data may install in C:\Users\Documents\.

- That's happening not only for safety, but also for performance optimization - one of many reasons why Linux runs faster than Windows.

For all path-related questions, the [Linux Filesystem Hierarchy Standard](http://www.pathname.com/fhs/) is the definitive reference.

## In short, where do I install the programs?

- Best practice is to allow the program to install wherever it wants. Volume fragmentation is virtually non-existent in Linux.

- Trusted applications (verified by the Software Center) may install in more sensitive places like **/bin** (=binaries) or even **/sbin** (=superbinaries).

- When a program (untrusted) uses many per-user options and files, it usually installs to secure and secluded **/usr/share**.

  > You could say that **/usr** is the equivalent of Users folder from Windows.

- When it does not (also untrusted), it usually installs to secure and secluded **/opt**.

  > **/opt** stands for optional software (that doesn't come bundled with the Ubuntu original disk).

- Usually you would put unarchived programs in **/usr**, binaries in **/usr/bin** if it's something bigger it would go to **/opt**. Avoid placing your local binaries <u>directly under</u> **/usr**, because according to the [FHS](http://www.pathname.com/fhs/), that hierarchy is reserved for the software provided by the Linux distribution (in this case, Ubuntu). If the program needs to create a folder, then **/usr/local** (I think this is the best folder for archive installation) is the directory of choice; according to the [FHS](http://www.pathname.com/fhs/):

  > The **/usr/local** hierarchy is for use by the system administrator when installing software locally.

- Note that, placing a binary in **/usr/local/bin** (or any other **bin** directory) will *not* create a menu entry; for that you have to provide [a .desktop file](http://standards.freedesktop.org/desktop-entry-spec/latest/) and install it in the appropriate directory with the [xdg-desktop-menu](http://portland.freedesktop.org/xdg-utils-1.0/xdg-desktop-menu.html) command.

For in-depth details of where and how Linux programs are installed, please see this topic: [Where are my installed applications](https://askubuntu.com/questions/9024/where-are-my-installed-applications).

## Where I can find applications and updates for them?

- It is always preferable to install through the native Package Management as the Package Manager will handle the location, updates, paths and the launchers (shortcuts) for you. You should ideally search for the package in the Software Center or Synaptic.
- PPAs can be used if the software is not in the default repos.
- Official websites, where you will find archives or deb packages. I think this is a more professional way to do it.

## Installing deb packages

When you use `apt` to install a package, under the hood it uses `dpkg`. When you install a package using `apt`, it first creates a list of all the dependencies and downloads it from the repository.

Once the download is finished it calls `dpkg` to install all those files, satisfying all the dependencies.

So if you have a .deb file you can install it using:

```bash
sudo dpkg -i /path/to/deb/file
sudo apt-get install -f
```

## Installing tar archive

No need to use `sudo` to unpack the archive. Type this in a terminal:

```bash
tar -xzf archive.tar.gz
```

If this archive contains something to install in the system, then `sudo` would be useful at one point or another. Very often, such an archive contains software that must be compiled and then installed. Typically, what you then do is as follows:

```bash
tar -xzf archive-name.tar.gz
cd archive-name
./configure
make
sudo make install
```


As you see, only the step actually installing the program requires superuser rights; everything else happens just in your home directory, which you own.

## Uninstalling packages

What I usually do:

```bash
sudo apt purge packagename
sudo apt autoremove
```

- `apt purge` or `apt remove --purge packagename` will remove any package and it's configuration (`apt remove` will uninstall a package (binaries) only).
  Particularly useful when you want to 'start all over' with an application because you messed up the configuration. However, it does not remove configuration or data files residing in users home directories, usually in hidden folders there. There is no easy way to get those removed as well. These you will have to remove manually.
- `apt autoremove` removes packages (dependencies) that were installed automatically as a result of you choosing to install packages that you no longer have on your system. It won't remove packages you specifically chose to install. Previous `apt purge` will do that.

Instead of those two commands we can run a single command:

```bash
sudo apt purge --auto-remove packagename
```

Though this is the correct way to remove a package, but one can also use (this is more a more convenient way to do it):

```bash
sudo apt-get --purge autoremove packagename
```

More detailed explanation of this command can be found [here](https://askubuntu.com/a/151943/20362).

> Do not use `packagename*` as that can delete unintended packages and cause more problems than it solves. Or if you must, at least run it with a `-s`, `--simulate`, `--dry-run` flag first to see exactly what it will do without doing it.
>
> Probably, the command that was meant is really
>
> ```bash
>  sudo apt-get remove "^application.*"
> ```
>
> (note the quotes and the dot) which will remove all packages whose name starts with `application`.

If it didn't help to uninstall or to fix a package, try all of these commands:

```bash
sudo apt-get autoremove
sudo apt-get --purge remove
sudo dpkg --remove --force-remove-reinstreq tspc
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get -f install
```

These may clear or fix broken packages and try to install again.

Also, we can use [synaptic](https://apps.ubuntu.com/cat/applications/synaptic) to fix broken/incomplete packages on Ubuntu. Open synaptic. Then go to status and choose Broken. Then remove completely the broken packages.

If you don't know to which package a file belongs, try this:

```bash
dpkg -S /path/to/file
```

Yes, lower-level `dpkg`-commands can be used (advanced), or GUI tools like Muon, Synaptic, Software Center, etc. **There's no single 'correct way' of removing applications or performing other tasks interacting with your package management.**

### Uninstalling packages that were installed from the tar archives

> TL;DR: with your own hands! :laughing:

#### Telegram example

This Telegram app just installs a `.desktop` file, its icon and a folder where it saves its data:

Remove the folder with the Telegram and Updater file.

Then run:

```bash
rm -Rf \
  ~/.local/share/icons/telegram.png \ 
  ~/.local/share/applications/telegramdesktop.desktop \
  ~/.local/share/TelegramDesktop
```

#### An easy way to remove programs installed from source in Linux

> TODO: check [this](https://ostechnix.com/an-easy-way-to-remove-programs-installed-from-source-in-linux/) link.

### How to uninstall a package installed with pip install --user

(Python 3.5 and pip 7.1.2 on Linux) the situation appears to be this:

- `pip install --user somepackage` installs to `$HOME/.local`, and uninstalling it does work using `pip uninstall somepackage`.
- This is true whether or not `somepackage` is also installed system-wide at the same time.
- If the package is installed at both places, only the local one will be uninstalled. To uninstall the package system-wide using `pip`, first uninstall it locally, then run the same uninstall command again, with `root` privileges.
- In addition to the predefined user install directory, `pip install --target somedir somepackage` will install the package into `somedir`. There is no way to uninstall a package from such a place using `pip`. (But there is a somewhat old unmerged pull request on Github that implements `pip uninstall --target`.)
- Since the only places `pip` will ever uninstall from are system-wide and predefined user-local, you need to run `pip uninstall` as the respective user to uninstall from a given user's local install directory.

Be careful though, for those who using `pip install --user some_pkg` **inside a virtual environment**.

```sh
path/to/python -m venv ~/my_py_venv
source ~/my_py_venv/bin/activate
(my_py_venv) $ pip install --user some_pkg
(my_py_venv) $ pip uninstall some_pkg
WARNING: Skipping some_pkg as it is not installed.
(my_py_venv) $ pip list
# Even `pip list` will not properly list the `some_pkg` in this case
```

In this case, you have to **deactivate the current virtual environment**, then use the corresponding `python`/`pip` executable to list or uninstall the user site packages:

```sh
(my_py_venv) $ deactivate
path/to/python -m pip list
path/to/python -m pip uninstall some_pkg
```

Note that this issue [was reported few years ago](https://github.com/pypa/pip/issues/3352). And it seems that the [current conclusion](https://github.com/pypa/pip/issues/3352#issuecomment-183746948) is: `--user` is not valid inside a virtual env's `pip`, since a user location doesn't really make sense for a virtual environment.

## Updating packages

### How to update everything in Ubuntu?

We can have a one-liner command (no need to scripts, just copy-paste):

```bash
sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y
```

- `update` - updates the list of packages but do not install
- `upgrade` - install new versions of packages if new versions are available
- `full-upgrade` - performs the function of upgrade but will remove currently installed packages if this is needed to upgrade the system as a whole (fixing bad dependencies then)
- `autoremove`, `autoclean` and `clean` - clean old packages which are not needed any more
- option `-y` does not request for permission on every step
- `&&` states that it just runs the next command if the previous was successfully executed

## References

1. [Where to install programs - 1](https://askubuntu.com/questions/775607/where-to-install-programs)
2. [Where to install programs - 2](https://askubuntu.com/questions/6897/where-to-install-programs)
3. [Linux FHS documentation](http://www.pathname.com/fhs/)
4. [a .desktop file](http://standards.freedesktop.org/desktop-entry-spec/latest/)
5. [xdg-desktop-menu](http://portland.freedesktop.org/xdg-utils-1.0/xdg-desktop-menu.html)
6. [Where are my installed applications - for in-depth details](https://askubuntu.com/questions/9024/where-are-my-installed-applications)
7. [How to install a deb file, by dpkg -i or by apt?](https://unix.stackexchange.com/questions/159094/how-to-install-a-deb-file-by-dpkg-i-or-by-apt)
8. [how to use sudo command to install .tar.gz?](https://askubuntu.com/questions/191390/how-to-use-sudo-command-to-install-tar-gz/191391)
9. [What is the correct way to completely remove an application?](https://askubuntu.com/questions/187888/what-is-the-correct-way-to-completely-remove-an-application)
10. [How to remove an incomplete package by using apt-get](https://stackoverflow.com/questions/27455626/how-to-remove-an-incomplete-package-by-using-apt-get)
11. [How do I uninstall Telegram which was installed from the tar.xz obtained from the official website?](https://askubuntu.com/questions/1182849/how-do-i-uninstall-telegram-which-was-installed-from-the-tar-xz-obtained-from-th)
12. [How to uninstall a package installed with pip install --user](https://stackoverflow.com/questions/33412974/how-to-uninstall-a-package-installed-with-pip-install-user)
13. [How to update everything in Ubuntu?](https://askubuntu.com/questions/733434/one-single-command-to-update-everything-in-ubuntu?rq=1)