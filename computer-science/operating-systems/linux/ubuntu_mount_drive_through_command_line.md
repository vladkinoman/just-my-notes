# Mount drive through command line (as if I clicked on it in nautilus) in Ubuntu

> The best solution in the second paragraph "Using Ubuntu's default app - Disks "!

## Using udisksctl application

Here is how to do this [1]:

```Bash
udisksctl mount --block-device /dev/disk/by-label/baydrive
udisksctl unmount --block-device /dev/disk/by-label/baydive
```

> Maybe if you add the `--options` flag with [this](https://askubuntu.com/questions/913252/ntfs-partition-is-mounted-as-read-only#answer-1039025) parameter, you will get the capability to write to your drive at a glance (without a probability of having an issue which is described below).

## Using Ubuntu's default app - Disks 

> Works in Lubuntu too.

You can actually auto-mount hard disks on boot. Use Disks app which is default on Ubuntu:

1. Select your disk or partition.

2. Click the gear icon (or the tick icon in Lubuntu).

3. Edit mount options.

4. Switch User Session Defaults to OFF.

5. Choose "Mount at system startup"

6. Enter your mount point in the corresponding field.

   > For example, I wrote `/media/vlad/Storage` where `Storage` was a label of my disk.

7. Next, you should fill the field "Identify As" by choosing the next value: "Label=label_of_your_disk":

   > For instance, I had the next value of this field in my system: "LABEL=Storage". 

8. Click OK.

**EDIT**: I finally figured this problem out. You won't have any of the problems below if you complete all the steps above :happy: 

### ERRNO 30: read only file system

The first problem with it is that somehow disk could change permissions and make system to be mounted read-only which is bad. ~~You need it to be mounted read-write (in that case you can apply command "chmod 777") [2]. After this problem you need to "remount" it, but it is really hard and might not work out [3].~~ **Edit**: If Linux detects a problem on the hard drive, it will switch the file system to read-only to prevent damage to the file system. It can caused by either a file system consistency issue [[link](https://askubuntu.com/questions/197459/how-to-fix-sudo-unable-to-open-read-only-file-system#answer-197468)] or an incorrect shutdown of the server or PC [[link](https://askubuntu.com/questions/1135389/how-to-fix-read-only-file-system-on-18-04#answer-1137752)]. That's where the commands like `sudo fsck.ext4 -f /dev/sda1` and `sudo mount -o rw,remount /`[[link](https://askubuntu.com/questions/287021/how-to-fix-read-only-file-system-error-when-i-run-something-as-sudo-and-try-to#answer-287024)] are useful. Sure, this could be useful if we talk about Linux system, but my problem was with Windows :) You see, Windows 8 and 10 offer a "Fast Startup" option that depends on a "non-complete" shutdown. If you shutdown your Windows system using "casual" option from menu, your system will save your data in a cash to quickly restore it after the launch. In order to fix that problem you can disable this function using [this](https://www.linuxuprising.com/2019/01/fix-windows-10-or-8-partition-mounted.html) tutorial or run this command to shutdown the system [[link](https://askubuntu.com/questions/462381/cant-mount-ntfs-drive-the-disk-contains-an-unclean-file-system)]:

```powershell
> shutdown /s
```

Also, you can try [this](https://askubuntu.com/questions/70281/why-does-my-ntfs-partition-mount-as-read-only#answer-70304) command but I didn't try it and can't say for sure.

> Do not run `ntfsfix` command in Linux to fix the problem with drive. This could be dangerous. You might lose all your data! (this might be true if there is a Windows on this disk).

### Could not remove files / folders

The second problem that I get was a very strange problem [4]. So, I couldn't remove files/folders. When I removed them, they came back instantly (WHAT?). I didn't try the solution from StackExchange. ~~I just change permissions in Windows for all users. After that, all users can modify files/folders, but they do not get ALL permissions, which administrator has~~. **Edit**: I doubt that this action fixed the problem.

## Mount disk using udisksctl command on start 

**Goal**. Execute `udisksctl` command when user enters the system. There haven't be a problem after user's logout->login.

It was a VERY hard problem which I have been able to solve in the next WEIRD way:

- Open the `.profile` file which is located in `home` directory (~).

- Insert the next lines at the bottom of the file:

  ```bash
  if [[ ! -e "/home/vlad/scripts/mounted.txt" ]]; then
      python /home/vlad/scripts/mountdrive.py
  fi
  ```

  > Do not insert `exit 0`  line, otherwise you will not be able to log in!

- Create the `mountdrive.py` file in the directory specified in the fragment above (sure, you can choose your own directory) and insert next code in it:

  ```Python
  import os
  mountdrive = 'udisksctl mount --block-device /dev/sda4'
  os.system(mountdrive)
  createfile = 'touch /home/vlad/scripts/mounted.txt'
  os.system(createfile)
  writetofile = 'echo "Do not delete or rename this file!" > /home/vlad/scripts/mounted.txt' 
  os.system(writetofile)
  ```

- Create the `remove-mountedtxt.service` service file and put it in the `/etc/systemd/system` folder [5]:

  ```Bash
  [Unit]
  Description=RemoveMountedTxt script
  DefaultDependencies=no
  RequiresMountsFor=/home
  Before=shutdown.target reboot.target halt.target
  
  [Service]
  ExecStart=/bin/bash /home/vlad/scripts/remove-mountedtxt.sh start
  Type=oneshot
  
  [Install]
  WantedBy=multi-user.target
  ```

- Run the `chmod` command to make it executable:

  ```Bash
  $ sudo chmod u+x /etc/systemd/system/remove-mountedtxt.service
  ```

- Now, enable the `remove-mountedtxt.service` by

  ```Bash
  $ systemctl enable remove-mountedtxt.service
  ```

- All we need is to create `remove-mountedtxt.sh` file and insert the next lines in it:

  ```Bash
  #! /bin/bash
  rm -f /home/vlad/scripts/mounted.txt
  ```

  > If you made a mistake in a script or a service, you can check it by viewing the `systemctl` log file in the terminal. See the "Additional links" paragraph in the "Links" section. 

**Conclusion**. So, now our drive will be mounted after we log in in our profile. In that case, our system recognizes us as a root (for example, "vlad" is a "root") and gives us permissions to execute `udisksctl` command. At least I think so :) After that, if there is no file `mounted.txt` then script `mountdrive.py` will be executed. It mounts our drive and creates `mounted.txt` which will prevent another mounting after logging in. We created the service file to remove that file before reboot. The main problem with this method is that you must not delete the `mounted.txt` file! Well, I have to admit that after all of those attempts (see below) I will stick to this approach.

## Other methods I tried

I tried (and tired :) ) these methods:

- Create `/etc/rc.local` and add `udisksctl` command mentioned above [6].

- Create the job using `crontab -e` [6].

- Create an environment variable and change it according to the state of mounting:

  - open the `etc/environment` (or `~.pam_environment`) file and add the new variable:

    ```
    IS_MOUNTED=true
    ```

  - add the next lines to the `.profile` file:

    ```Bash
    ALWAYS_FALSE=false
    if ($IS_MOUNTED && $ALWAYS_FALSE) ; then
    	IS_MOUNTED=true
    	udisksctl mount --block-device /dev/sda4
    fi
    ```

  - also, instead of true/false we can use numbers which is more safe:

    ```Bash
    #!/bin/bash
    # GNU bash, version 4.3.46
    A=0
    B=0 
    if [[ A -eq B ]] ; then
        echo "Hello, world"
    fi
    ```

    The problem with this approach is that the environment variable RESETS after logout.

    > Also I found out the execution sequence of some files that runs during the login phase: `etc/.environment` -> `~.pam_environment` -> `~.profile`. 

- Make the `mountdrive.service` configuration file with systemd [7]:

  ```Bash
  #
  [Unit]
  Description=mountdrive script
  
  [Service]
  Type=oneshot
  ExecStart=/.../mountdrive.sh
  
  [Install]
  WantedBy=multi-user.target
  ```

  > If you use systemd method, you need to add next lines to the header of your script:
  >
  > ```bas
  > #!/bin/bash
  > ### BEGIN INIT INFO
  > # Provides:          mountdrive
  > # Required-Start:    $all
  > # Required-Stop:
  > # Default-Start:     2 3 4 5
  > # Default-Stop:      0 1 6
  > # Short-Description: mount Drive Storage
  > ### END INIT INFO
  > ```

- Also, I tried this method which was successful at first time, but it failed after reboot:

  - Open the `.profile` file which is located in home directory (~).

  - Insert next lines at the bottom of the file:

    ```Bash
    $ udisksctl mount --block-device /dev/sda4
    ```

    >  Do not insert `exit 0`  line, otherwise you will not be able to log in!

  - Next we need to open the `DEFAULT` file from the `/etc/gdm3/PostSession` folder. Add next lines to the file:

    ```Bash
    #!/bin/sh
    udisksctl unmount --block-device /dev/disk/by-label/baydrive
    exit 0 
    ```

    So, now our drive will be mounted after we log in in our profile. In that case, our system recognizes us as a root (for example, "vlad" is a "root") and gives us the permissions to execute `udisksctl` command. At least I think so :) That's why we can't use GDM's PreSession or Init features or anything else [8]. But that's not all. After logout->login we will get an error message that our Drive is already mounted. In order to avoid this problem, we need to unmount it in PostSession's `DEFAULT` file. In theory it could work, but in practice it didn't work out. I think there is a problem with GDM3 logout which was described in bug description on Launchpad [9].

All of these methods were unsuccessful or partially failed (in that case you could see only Disk's icon and `root` folder). They will probably work, but not for this command.

## Links

1. [Mount drive through command line](https://askubuntu.com/questions/45241/mount-drive-through-command-line-as-if-i-clicked-on-it-in-nautilus)
2. [Help with changing permissions on an external drive?](https://ubuntuforums.org/showthread.php?t=1946755)
3. [How to fix “sudo: unable to open … Read-only file system”?](https://askubuntu.com/questions/197459/how-to-fix-sudo-unable-to-open-read-only-file-system)
4. [Problem which I get through those manipulations with disks - some people recommended fsck command which was proposed in [3]](https://askubuntu.com/questions/566474/why-do-i-get-directory-not-empty-when-i-try-to-remove-an-empty-directory)
5. [How do I get my script to run BEFORE any shutdown sequence like unmounting my external drive](https://askubuntu.com/questions/779154/how-do-i-get-my-script-to-run-before-any-shutdown-sequence-like-unmounting-my-ex?newreg=4335054b9e9d4523a7c7d33e52377ef4#answer-779653)
6. [Ubuntu 18.04 Autorun a command at log in - rc.local and crontab](https://ubuntuforums.org/showthread.php?t=2390587)
7. [Creating a Linux service with systemd](https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6)
8. [How to execute command before user login on linux - Introduction to GDM and the like](https://unix.stackexchange.com/questions/450835/how-to-execute-command-before-user-login-on-linux#answer-450836)
9. [GDM3 bug - Input devices stop working after logout or switch-user](https://bugs.launchpad.net/ubuntu/+source/gdm3/+bug/1776534)

Additional links:

- [Udisks on ArchLinux - there is some mount wrappers](https://wiki.archlinux.org/index.php/Udisks)

- [gio mount vs. udisksctl](https://askubuntu.com/questions/342188/how-to-auto-mount-from-command-line#answer-342209)
- [systemd.service — Service unit configuration](https://www.freedesktop.org/software/systemd/man/systemd.service.html)
- [How do I figure out why systemctl service “systemd-modules-load” fails?](https://superuser.com/questions/997938/how-do-i-figure-out-why-systemctl-service-systemd-modules-load-fails?newreg=4b02dcafbc3b47c0aba726ebc0caecbf#answer-1074637)

- [Automount USB drives with systemd - example with the script](https://serverfault.com/questions/766506/automount-usb-drives-with-systemd#answer-767079)

- [Automatically Run a Command Every 5 Minutes - easy method based on programming](https://askubuntu.com/questions/852070/automatically-run-a-command-every-5-minutes/852074#answer-852075)

- [18.04 LTS - GNOME - Failed to start session - maybe it is not relevant](https://ubuntuforums.org/showthread.php?t=2407864)

