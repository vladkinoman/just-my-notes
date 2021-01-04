# Distro hop

Distro hop is the act of switching from one Linux distro to another (via [urbandictionary](https://www.urbandictionary.com/define.php?term=Distro%20Hop)).

**How to switch linux distros without losing data?**

Create a data partition and move the /home directory and contents there, including your user data.

So, if you already have a Linux installation in place and have everything (including your Home folder) on the same partition, don't worry. It only takes a few steps to achieve the setup you need. The steps are as follows:

1. Download the Live environment ISO of your favorite Linux distribution, and burn it to a CD/DVD or write it to a USB drive.
2. Boot into your newly-created media. Use a partitioning tool such as GParted to resize your ext4 partition to the size you want it to be.
3. Use the same tool to create a new ext4 partition in the empty space created by resizing the first partition. Make note of what partition it is. It should look like **/dev/sdXY**, where **X** is a letter designating the drive and **Y** is a number designating the partition. An example is /dev/sda2.
4. Mount both partitions, and copy over the contents of the home folder to the new partition. Make sure that you're copying over all of the contents of the home folder, and not the home folder itself. Otherwise, when everything is done, all of your stuff will be in "/home/home/user", which won't work.
5. Now open a terminal and run the command **gksudo gedit** to open the Gedit text editor. Now use the menus to open the file located at **/etc/fstab** in the first partition.
6. Add the following line to the end of the file: **/dev/sdXY /home ext4 errors=remount-ro 0 1**. Again, make sure to replace /dev/sdXY with the actual designation for the partition.
7. Save it, and restart. Make sure to remove the Live environment media so that you boot back into your regular installation.

Now, when you switch distributions, make sure all the different distributions recognize and accept the one /home directory. I think you can do it the same way we did with fstab.

In order to learn more about these things, you should read these two guides: [installing Fedora](https://www.makeuseof.com/tag/upgrade-switch-linux-distros-without-losing-files/), [installing Ubuntu](https://itsfoss.com/replace-linux-from-dual-boot/).

## Organizing the distro-hopping

**Is there any way to know the list of packages/programs that I have installed, so that I can install them on the new distro?**

Yes, you can make a list. If you were using Debian or a derivative, I would suggest:

```bash
 apt list --installed > my_installed_packages.txt
```

But it's important to say that not all distributions have the same packages, and for those that do, they often go under different names. The list of installed packages cannot be simply repeated on a different version of the distribution, because packages change and their names also change. It's a list of packages <u>for your guidance</u>, not an automatic install list. Remember that, if you submit a list of packages to apt for installation, if only one of them is in error, the entire install operation fails.

Also, to install all the same packages and software from the repositories, check out **apt-clone**. Clone your installed packages from the original system and restore to the fresh install.

**How to efficiently switch distros? Are there any tools to make distro hopping easier?**

Use a virtual machine. Test the distros and stick to one.

---

You could write a script that installs all what you need at fresh OS install. Obviously you'd need to change from apt to pacman and zypper, just use the "search and substitute" tool in any text editor.

Unfortunatelly, different distros have different repositories. So sometimes the script may fail to install all what you need. I don't see a better alternative other than using portable apps at this point. Appimage or snap. Snap installs under ~/snap, so it's safe from distro hopping. I am not sure about flatpak.

Then you can reuse the same user without loosing the home folder (configs included). When you install a new OS, set the actual home partition as home partition for the new OS without formatting it. Than when it asks you for the user creation, use the same username and password you used afore. I read that the hostname and the user's real name need to be the same as well but i can't tell from personal experience.

---

Everything I need is on my external drive. Everything is save that I want save. Mount and bingo all my data is assailable. Never ever made a separated partition for /home or for any other directory. It's like my external hard drive is my /home directory.

Hop by using Virtualbox or a extra internal hard drive. I always had one extra internal hard drive, just to play around.

---

> How do you guys switch between different distros without losing files or application configs?

One partiiton for '/', separate partition for /home. This way you can reinstall your existing distribution or install a new one without disturbing your data or settings.

> Are there scripts you make to install everything you need or do you do it by hand?

I install "by hand" in a basic way, then run scripts to reinstall all my required software.

> So when you are installing a new distro, can you choose to use the existing /home partition as the new OS's home?

Yes. In the Ubuntu installer, choose "something else" and make custom entries. If you select "/home" as a mount point for an existing partition, the installer will accommodate you.

Make sure to back up your data, the installer may try to create a new same-name user, which could jeopardize existing data.

> Also, I guess with this strategy you could even have multiple distros installed and they all use the same /home.

Yes, except that different distributions use different configuration layouts, so in that case you would be better off having a separate data partition and individual /home directories, one per distribution, to avoid collisions between different distributions' configuration schemes.

---

I have a external Hard Drive and Cloud Storage.

I usually just start over. 20 minutes to install, install all my drivers and restricted codecs. I have my printer driver on my external. Install anything that is missing. Config everything to my liking. I do have some .dotfile save on my external. I also have games and game save files on my external. My external is like my $HOME away from $HOME. So my external is sorta my /home base directory. Don't take me long to get things going. Yes I do have a few scripts. But if I'm moving from Debian to Arch or something like that. Then sometimes those scripts are worthless. Still I have some scripts for bash and color themes. So moving and bouncing around isn't really a big deal if you done it a few times. In my 16 years with Linux I try out 44 primary Linux distro's so it's really a cinch for me.

---

I use nextcloud to to store all my data. I also have ansible playbooks setup for ubuntu and fedora that install software and setup a service that will run the ansible playbook everyday located [here](https://gitlab.com/tiny6996/ansible-playbooks)

---

I store all my dots in source control and install all my tools/configs with a script or playbook.

`git clone` [`https://github.com/repo/dotfiles.git`](https://github.com/repo/dotfiles.git)

```bash
./dotfiles/install.sh
```

---

Because most distributions are the same except for a few details, I usually stick with one distribution. But the following would come to my mind.

- Splitting the hard disk into / and /home. So the data in /home will be preserved.
- For configuration files in general you can use GNU Stow (https://www.gnu.org/software/stow/ https://alexpearce.me/2016/02/managing-dotfiles-with-stow/). An [Ansible](https://www.ansible.com/) Playbook would also be a possibility. However, this requires some time to get used to.

---

```bash
rsync -r /home /mnt/some/other/storage
```

> Me: I heard that tarring the home directory isn't that bad. Just don't tar the ext directory and your apps. They probably won't work on another distor. Data and configuration files maybe. You will have to reinstall your distro when it suffers a crash, but for most programs, you can restore the backup configuration file. Although, finding the right configuration files to backup can be a pain.

---

configuration should be saved in some dot files or configuration files

if you ever break the install you can just copy over your dotfiles again

---

I'm late here, but, https://gitlab.com/Derek52/Linux-Bootstrap-Scripts/-/tree/master/

... the skeleton for you to build your own scripts is there. I put these together because I too distro hop a lot.

And because I use a lot of different packages, and I got tired of having to google random dependecies for a couple programs. So I made these scripts that, install all of the packages I want, creates extra directories I use in my home folder, and places my config files into the correct spot for several programs. They've been kind of a massive time saver.

---

I'm considering the same thing right now and I am looking at it in two parts:

1. Installation/configuration (identically of more than one machine)
2. Ongoing syncing between machines.

**1. Installation/configuration**:

I'm thinking provisioning tools like Ansible (Chef, Puppet, etc).

https://opensource.com/article/18/3/manage-workstation-ansible

Also, these devops tools often work well with each other, so, for example, I'm messing around with Vagrant (manages VMs for you) and Virtualbox and Ansible (what I want installed, how I want configured). So I can tell Vagrant to make VMs of practically any distros and to apply the Ansible file. And you can list a bunch of them and kick it all off. This tutorial shows a use-case where they want to set up their dev env. The first code snippet shows a Vagrantfile configured to use an ansible file for provisioning.

https://blog.jetbrains.com/pycharm/2017/12/developing-in-a-vm-with-vagrant-and-ansible/

Obviously you don't have to use VMs at all, but I'm using them to decide on which distro/Window Manager. And when I'm done I'll have the Ansible file dialed in; and can run it against a bare metal install, VM, or container. Or, I'll just keep my projects in separate VMs in my development fleet, whatever.

**2. For ongoing syncing of dotfiles and settings/etc:**:

I suspect that there is an Ansible solution; as Ansible is idempotent. But, I'm reading through everything here first:

http://dotfiles.github.io/

It would be ideal if some of my cross-platform configs could be maintained (like where your vimrc file is located in Linux versus Windows). Again, something I think relatively easy with Ansible. So, researching....

**Or, totally different way via bash scripts**

I need to stick with Debian-based because of work constraints otherwise I'd just go with this. Arch w/i3 of this via bash scripts:

https://www.youtube.com/watch?v=iO6k5_dCaqU

https://github.com/LukeSmithxyz/LARBS

I'll be interested to hear what you ended up doing. I am assuming that you looked in to it, wrote this post, promptly had Analysis Paralysis and have not settled it yet. Ergo, I hope some of this might have provided at least one good resource. Best of luck.

## References

1. https://www.urbandictionary.com/define.php?term=Distro%20Hop
2. https://www.reddit.com/r/linux4noobs/comments/9nod5k/how_to_switch_linux_distros_without_losing_data/
3. https://www.makeuseof.com/tag/upgrade-switch-linux-distros-without-losing-files/
4. https://itsfoss.com/replace-linux-from-dual-boot/
5. https://www.reddit.com/r/linuxquestions/comments/b0tlqi/tools_to_make_distro_hopping_easier/
6. https://gitlab.com/Derek52/Linux-Bootstrap-Scripts/-/tree/master
7. https://www.reddit.com/r/linuxquestions/comments/cpw8mk/how_to_efficiently_switch_distros/
8. https://www.reddit.com/r/DistroHopping/comments/859b1b/organizing_the_distrohopping_process_with_scripts/

