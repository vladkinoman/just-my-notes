# Distro hop

Distro hop is the act of switching from one Linux distro to another (via [urbandictionary](https://www.urbandictionary.com/define.php?term=Distro%20Hop)).

**How to switch linux distros without losing data?**

In short:

1. Create a data partition and move the /home directory and contents there, including your user data.
2. Now, when you switch distributions, make sure all the different distributions recognize and accept the one /home directory.

In order to learn more about these things, you should read these two guides: [installing Fedora](https://www.makeuseof.com/tag/upgrade-switch-linux-distros-without-losing-files/), [installing Ubuntu](https://itsfoss.com/replace-linux-from-dual-boot/).

**How can I easily transfer/reinstall all these software on to the new distro?**

Not programs, only data. Programs cannot be simply moved from one distribution to another.

**Is there any way to know the list of packages/programs that I have installed, so that I can install them on the new distro?**

Yes, you can make a list. If you were using Debian or a derivative, I would suggest:

```bash
 apt list --installed > my_installed_packages.txt
```

But it's important to say that not all distributions have the same packages, and for those that do, they often go under different names. The list of installed packages cannot be simply repeated on a different version of the distribution, because packages change and their names also change. It's a list of packages <u>for your guidance</u>, not an automatic install list. Remember that, if you submit a list of packages to apt for installation, if only one of them is in error, the entire install operation fails.

Also, to install all the same packages and software from the repositories, check out **apt-clone**. Clone your installed packages from the original system and restore to the fresh install.

## References

1. https://www.urbandictionary.com/define.php?term=Distro%20Hop
2. https://www.reddit.com/r/linux4noobs/comments/9nod5k/how_to_switch_linux_distros_without_losing_data/
3. https://www.makeuseof.com/tag/upgrade-switch-linux-distros-without-losing-files/
4. https://itsfoss.com/replace-linux-from-dual-boot/