# Mount drive through command line (as if I clicked on it in nautilus) in Ubuntu

## Using udisksctl application

Here is how to do this:

```Bash
udisksctl mount --block-device /dev/disk/by-label/baydrive
udisksctl unmount --block-device /dev/disk/by-label/baydive
```

## Using Ubuntu's default app - Disks 

You can actually auto-mount hard disks on boot. Use Disks app which is default on Ubuntu:

1. Select your disk or partition.
2. Click the gear icon.
3. Edit mount options.
4. Switch User Session Defaults to OFF.
5. Click OK.

The first problem with it is that somehow disk could change permissions and make system to be mounted read-only which is bad. You need it to be mounted read-write (in that case you can apply command "chmod 777"). After this problem you need to "remount" it, but it is really hard and might not work for you :(

The second problem that I get was a very strange problem [4]. So, I couldn't remove files/folders. When I removed them, they came back instantly (WHAT?). I didn't try solution from StackExchange. I just change permissions in Windows for all users. After that, all users can modify files/folders, but they do not get ALL permissions, which administrator has.

## Mount disk using udisksctl command on start 

**Goal**. Execute `udisksctl` command when user enters the system. There haven't be a problem after user's logout->login.

It was a very hard problem which I have been able to solve in the next way:

- Open the `.profile` file which is located in home directory (~).

- Insert next lines at the bottom of the file:

  ```bash
  udisksctl mount --block-device /dev/sda4
  ```

  > Do not insert `exit 0`  line, otherwise you will not be able to log in!

- Next we need to open the `DEFAULT` file from the `/etc/gdm3/PostSession` folder. Add next lines to the file:

  ```Bash
  #!/bin/sh
  udisksctl unmount --block-device /dev/disk/by-label/baydrive
  exit 0 
  ```

**Conclusion**. So, now our drive will be mounted after we log in in our profile. In that case, our system recognizes us as a root (for example, "vlad" is a "root") and gives us permissions to execute `udisksctl` command. At least I think so :) That's why we can't use GDM's PreSession or Init features or anything else [5]. But that's not all. After logout->login we will get an error message that our Drive is already mounted. In order to avoid this problem, we need to unmount it in PostSession's `DEFAULT` file.

## Other methods I tried

I tried these methods:

- create `/etc/rc.local` and add `udisksctl` command mentioned above [6].

- create job using `crontab -e` [6].

- also I tried to make the `mountdrive.service` configuration file with systemd [7]:

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

All of these methods were unsuccessful or partially failed (in that case you could see only Disk's icon and `root` folder). They will probably work, but not for this command.

## Links

1. [Mount drive through command line](https://askubuntu.com/questions/45241/mount-drive-through-command-line-as-if-i-clicked-on-it-in-nautilus)

2. [How to fix “sudo: unable to open … Read-only file system”?](https://askubuntu.com/questions/197459/how-to-fix-sudo-unable-to-open-read-only-file-system)

3. [Help with changing permissions on an external drive?](https://ubuntuforums.org/showthread.php?t=1946755)

4. [Problem which I get through those manipulations with disks](https://askubuntu.com/questions/566474/why-do-i-get-directory-not-empty-when-i-try-to-remove-an-empty-directory)

   > 4: some people recommended fsck command which was proposed in [2]. 

5. [How to execute command before user login on linux - Introduction to GDM and the like](https://unix.stackexchange.com/questions/450835/how-to-execute-command-before-user-login-on-linux#answer-450836)

6. [Ubuntu 18.04 Autorun a command at log in - rc.local and crontab](https://ubuntuforums.org/showthread.php?t=2390587)

7. [Creating a Linux service with systemd](https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6)

Additional links:

1. [Udisks on ArchLinux - there is some mount wrappers](https://wiki.archlinux.org/index.php/Udisks)
2. [gio mount vs. udisksctl](https://askubuntu.com/questions/342188/how-to-auto-mount-from-command-line#answer-342209)
3. [Automount USB drives with systemd - example with the script](https://serverfault.com/questions/766506/automount-usb-drives-with-systemd#answer-767079)
4. [Automatically Run a Command Every 5 Minutes - easy method based on programming](https://askubuntu.com/questions/852070/automatically-run-a-command-every-5-minutes/852074#answer-852075)
5. [18.04 LTS - GNOME - Failed to start session - maybe it is not relevant](https://ubuntuforums.org/showthread.php?t=2407864)