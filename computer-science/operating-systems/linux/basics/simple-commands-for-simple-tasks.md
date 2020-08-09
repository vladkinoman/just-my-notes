# Simple commands for simple tasks

## Check os version in Linux

The procedure to find os name and version on Linux:

1. Open the terminal application (bash shell)
2. For remote server login using the ssh: **ssh user@server-name**
3. Type any one of the following command to find os name and version in Linux:
   **cat /etc/os-release**
   **lsb_release -a**
   **hostnamectl**
4. Type the following command to find Linux kernel version:
   **uname -r**

> Also, don't forget about manual: '$ man cat'.

## Check the Kernel Version in Linux

The kernel is the core component of an operating system. It manages the system’s resources, and it is a bridge between your computer’s hardware and software.

There are various reasons why you might need to know the version of the kernel that is running on your GNU/Linux operating system. Perhaps you’re debugging a hardware related issue or learned about a new security vulnerability affecting older kernel versions and you want to find out whether your kernel is vulnerable or not. Whatever the reason, it’s quite easy to determine the Linux kernel version from the command line.

### Using the `uname` Command

The [`uname`](https://linuxize.com/post/uname-command-in-linux/) command displays several system information including, the Linux kernel architecture, name version, and release.

To find out what version of the Linux kernel is running on your system, type the following command:

```bash
$ uname -srm
Linux 4.15.0-54-generic x86_64
```

The output above shows that the Linux kernel is 64-bit and its version is `4.15.0-54`, where:

- `4` - Kernel Version.
- `15` - Major Revision.
- `0` - Minor Revision.
- `54` - Patch number.
- `generic` - Distribution specific information.

### Using `hostnamectl` command

The `hostnamectl` utility is part of systemd, and it is used to query and change the system hostname. It also displays the Linux distribution and kernel version:

```bash
$ hostnamectl
  Static hostname:  linuxize.localdomain
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: af8ce1d394b844fea8c19ea5c6a9bd09
           Boot ID: 15bc3ae7bde842f29c8d925044f232b9
  Operating System: Ubuntu 18.04.2 LTS
            Kernel: Linux 4.15.0-54-generic
      Architecture: x86-64
```

You can use the [`grep`](https://linuxize.com/post/how-to-use-grep-command-to-search-files-in-linux/) command to filter out the Linux kernel version:

```bash
$ hostnamectl | grep -i kernel
            Kernel: Linux 4.15.0-54-generic
```

### Using `/proc/version` File

The `/proc` directory contains virtual files with information about the [system memory](https://linuxize.com/post/free-command-in-linux/) , [CPU cores](https://linuxize.com/post/get-cpu-information-on-linux/) , [mounted filesystems](https://linuxize.com/post/how-to-mount-and-unmount-file-systems-in-linux/) , and more. Information about the running kernel is stored in the `/proc/version` virtual file.

Use [`cat`](https://linuxize.com/post/linux-cat-command/) or [`less`](https://linuxize.com/post/less-command-in-linux/) to display the contents of the file:

```bash
$ cat /proc/version
```

The output will look something like this:

```output
Linux version 4.15.0-54-generic (buildd@lgw01-amd64-014) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #58-Ubuntu SMP Mon Jun 24 10:55:24 UTC 2019
```

## Logs

This will show the last of the logs of the previous boot:

```bash
$ journalctl -b -1 -e
```

You don't have to wait for the next crash. `journalctl --list-boots` will list boots (and their time/date), and you can adjust the `-b #` of `journalctl -b -1 -e` to select one.

## Run programs in background from terminal

I've recently come to like `setsid`. It starts off looking like you're just running something from the terminal but you can disconnect (close the terminal) and it just keeps going.

This is because the command actually forks out and while the input comes through to the current terminal, it's owned by a completely different parent (that remains alive after you close the terminal).

An example:

```bash
$ setsid gnome-calculator
```

We can use "&" instead of setsid:

```Bash
$ gnome-calculator &
```

I think it works the same way. TODO: check it.

## Source

1.  https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
2.  https://linuxize.com/post/how-to-check-the-kernel-version-in-linux/
3.  https://askubuntu.com/questions/106351/running-programs-in-the-background-from-terminal