# Linux package managers

What is the difference between Ubuntu, Fedora, OpenSUSE, Sabayon, or Arch? Ultimately, the short answer is: package management. Each distro offers users a unique method of installing and maintaining your system, with varying degrees of user friendliness and usability.

## Apt

Apt is a dependency resolver for Debian based systems. In conjunction with dpkg, the package manager, Apt provides an easy way to update, upgrade, install and remove software.

In order to update software repositories, use `sudo apt update`.s

For a more thorough upgrade, which will also attempt to upgrade conflicting package dependencies to the newest version and removing older or unused dependencies, the command is as follows:

```bash
sudo apt-get dist-upgrade
```

or

```bash
sudo apt full-upgrade
```

These commands can be combined to perform an update and upgrade in succession like so:

```bash
sudo apt-get update && sudo apt-get upgrade
```

or

```bash
sudo apt update && sudo apt upgrade
```

To install software, the command is `sudo apt install $package`.

To remove a package, use `sudo apt remove package`.

When removing software from your system using the apt-get remove command, Apt does a good job of removing unused dependencies, however sometimes in the course of software removal or an upgrade, some straggler dependencies may remain on your system. Use the next commands in order to remove those dependencies:

```bash
sudo apt-get autoremove
```

or

```bash
sudo apt autoremove
```

Searching for an installable package:

```bash
sudo apt-cache search $packageName
```

or

```bash
sudo apt search $packageName
```

<u>Apt does not currently offer the ability to install a package from a URL</u>, meaning the user must find and download the package to be installed on their own. Ubuntu and some of its derivatives have managed to combat this with single-click apturl links, found on some websites.

### Differences between apt and apt-get

They are very similar command line tools available in [Trusty (14.04)](https://wiki.ubuntu.com/Releases) and later. `apt-get` and `apt-cache`'s most commonly used commands are available in `apt`.

`apt-get` may be considered as lower-level and "back-end", and support other APT-based tools. apt is designed for end-users (human) and its output may be changed between versions.

Note from apt(8):

```bash
DIFFERENCES TO APT-GET(8)
   The apt command is meant to be pleasant for end users and does not need
   to be backward compatible like apt-get(8). Therefore some options are
   different:

   ·   The option DPkg::Progress-Fancy is enabled.
   ·   The option APT::Color is enabled.
   ·   A new list command is available similar to dpkg --list.
   ·   The option upgrade has --with-new-pkgs enabled by default.
```

> This is the correct answer (for Debian and Ubuntu as well as other derivatives like Mint). In particular, running `sudo apt upgrade` will perform the same operations as `sudo apt-get upgrade --with-new-pkgs`. It will install new packages but, *unlike* `sudo apt-get dist-upgrade`, it will not remove old ones (except when installing a new version of the *same* package, of course--which `sudo apt-get upgrade` will also do). [`man apt`](http://manpages.ubuntu.com/manpages/xenial/en/man8/apt.8.html) further corroborates that this answer is correct.

You see, these commands are way too low level and they have so many functionalities which are perhaps never used by an average Linux user. On the other hand, the most commonly used package management commands are scattered across `apt-get`, `apt-cache` and `apt-config`.

The `apt` commands have been introduced to solve this problem. `apt` consists some of the most widely used features from `apt-get`, `apt-cache` and `apt-config` leaving aside obscure and seldom used features.

With `apt`, you don’t have to fiddle your way from `apt-get` to `apt-cache` to `apt-config`. `apt` is more structured and provides you with necessary options needed to manage packages.

**Bottom line:** `apt` = most common used command options from `apt-get`, `apt-cache` and `apt-config`.

If you need detailed information, see [difference between apt and apt-get](https://itsfoss.com/apt-vs-apt-get-difference/).

---

Currently the apt binary supports the following commands:

- **list**: which is similar to `dpkg list` and can be used with flags like `--installed` or `--upgradable`.
- **search**: works just like `apt-cache search` but sorted alphabetically.
- **show**: works like `apt-cache show` but hide some details that people are less likely to care about (like the hashes). The full record is still available via `apt-cache show` of course.
- **update**: like the regular `apt-get update` with color output enabled, but `apt update` also shows the number of upgradeable packages (if any).
- **install,remove**: adds progress output during the dpkg run.
- **upgrade**: the same as `apt-get upgrade --with-new-pkgs`.*****
- **full-upgrade**: a more meaningful name for `dist-upgrade`.
- **edit-sources**: edit `sources.list` using `$EDITOR`.
- **policy**: works just like `apt-cache policy`

You can enable/disable the install progress [bar] via:

```bash
# echo 'Dpkg::Progress-Fancy "1";' > /etc/apt/apt.conf.d/99progressbar
```

## YUM

Like Apt, YUM is a dependency resolver for the underlying package manager, RPM. YUM is the default package management system included in quite a few Red Hat based derivitaves, including Fedora 21 and below, and [CentOS](https://www.makeuseof.com/tag/dont-want-to-pay-for-red-hat-linux-try-centos-instead/). The syntax for YUM is simple, and Apt users should have no problem making the switch.

Updating and upgrading through YUM is very simple, where the following command handles both tasks:

```bash
sudo yum update
```

To install a package, the following command is used:

```bash
sudo yum install $packageName
```

Likewise, to remove a package, the command is:

```bash
sudo yum remove $packageName
```

To search for an installable package:

```bash
sudo yum search $packageName
```

YUM does not include an autoremove command for finding and removing unused dependencies, however it does include a great feature for installing a package from a URL, which Apt does not include:

```bash
sudo yum install $url
```

> ZYpp is another dependency resolver for the RPM package management system, and is the default package manager for [OpenSUSE](https://www.makeuseof.com/tag/use-opensuse-tumbleweed-new-rolling-release-version/) and SUSE Linux Enterpise. ZYpp utilizes .rpm binaries, just like YUM, but is a bit faster due to being written in C++, where YUM is written in Python. ZYpp is extremely easy to use, as it includes command shortcuts which can be used in place of the full command.
>
> Like YUM, there is no autoremove command included in ZYpp. Additionally, like Ubuntu, OpenSUSE has one-click install links for web based package installation.

## DNF, Or Dandified YUM

DNF is a rewrite of YUM which utilizes features from ZYpp, most notably, the dependency resolving capabilities. DNF is the default package manager for [Fedora 22](https://www.makeuseof.com/tag/bleeding-edge-linux-fedora-rawhide/) and higher, and should become the default system in CentOS in the future.

To update and upgrade all software:

```bash
sudo dnf update
```

To install a package:

```bash
sudo install $packageName
```

To remove a package:

```bash
sudo dnf remove $packageName
```

Search for an installable package:

```bash
sudo dnf search $packageName
```

Unlike YUM and ZYpp, DNF provides the autoremove command to search your system and remove unused dependencies:

```bash
sudo dnf autoremove
```

And DNF also allows for package installation from a URL:

```bash
sudo dnf install $url
```

## Pacman

Pacman is the default package management system for [Arch Linux](https://www.makeuseof.com/tag/install-arch-linux-easy-way-antergos/) and its derivitaves, and is a complete package manager, not relying on underlying systems or frontends to resolve dependencies. Pacman utilizes a simple compressed .pkg.tar.xz file system, which contains all information needed to build source code into a working program. Think of pacman as a system to automate the process of manually building software from source code. Pacman utilizes a "helper" program, Yaourt, to install unofficial software found in the Arch User Repository, and when doing so, the command "pacman" is replaced by "yaourt."

When working with packages, you will mostly utilize the "sync" flag (-S), which compares your system with the software repository. To refresh your software repos (-y):

```bash
sudo pacman -Sy
```

To upgrade your system, you modify your previous sync command with the sysupgrade flag (-u):

```bash
sudo pacman -Syu
```

To install a package, you must sync the package:

```bash
sudo pacman -S $packageName
```

To remove a package, pacman has a remove flag. To remove a package (-R), its configuration files (-n), and all unused dependencies, recursively, not installed explicitly by the user (-s). Note: this -s flag is different to the -s flag used in the sync command:

```bash
sudo pacman -Rns
```

To search for an installable package, you will sync and search (-s):

```bash
sudo pacman -Ss $packageName
```

Pacman does not include an autoremove command, however you can search for and remove any unused dependencies using the Query command. Note: again, these flags are not the same as the sync flags or remove flags. This command will query the database (-Q), check for orphaned dependencies (-t), restrict the search to dependencies (-d), and will not print the process out verbosely (-q, meaning "quiet").

```bash
sudo pacman -Rns $(pacman -Qtdq)
```

## References

1. https://www.makeuseof.com/tag/power-choice-power-package-management/
2. https://askubuntu.com/questions/445384/what-is-the-difference-between-apt-and-apt-get
3. https://itsfoss.com/apt-vs-apt-get-difference/