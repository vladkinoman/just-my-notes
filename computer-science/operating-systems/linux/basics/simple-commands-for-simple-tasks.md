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
2. https://askubuntu.com/questions/106351/running-programs-in-the-background-from-terminal