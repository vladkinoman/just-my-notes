# Simple commands for simple tasks

## Logs

This will show the last of the logs of the previous boot:

```bash
$ journalctl -b -1 -e
```

You don't have to wait for the next crash. `journalctl --list-boots` will list boots (and their time/date), and you can adjust the `-b #` of `journalctl -b -1 -e` to select one.

### How to find out from the logs what caused system shutdown?

According to [this answer]():

> Only root privileged programs can gracefully shutdown a system. So when a system shuts down in a normal way, it is either a user with root privileges or an acpi script. In both cases you can find out by checking the logs. An acpi shutdown can be caused by power button press, overheating or low battery (laptop). I forgot the third reason, UPS software when power supply fails, which will send an alert anyway.
>
> Recently I had a system that started repeatedly to power off ungracefully, turned out that it was overheating and the mobo was configured to just power off early. The system didn't have a chance to save logs, but fortunately monitoring the system's temperature showed it was starting to increase just before powering off.
>
> So if it is a normal shutdown it will be logged, if it is an intrusion... good luck, and if it is a cold shutdown your best chance to know is to control and monitor its environment.

How to find out when shutdown occurred:

Try the following commands:

Display list of last reboot entries: `last reboot | less`

Display list of last shutdown entries: `last -x | less`

or more precisely: `last -x | grep shutdown | less`

You won't know who did it however. If you want to know who did it, you will need to add a bit of code which means you'll know next time.

It might be useful: [How to find out who or what halted my system](https://web.archive.org/web/20170904210829/http://scofaq.aplawrence.com:80/FAQ_scotec1haltcatch.html).

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

## Symbolic links

How to create symbolic links to all files (class of files) in a directory?

`ln` does take multiple arguments, but don't forget to give a target directory in that case.

So, `.` is the target directory, so it should be as easy as

```bsh
ln -s ../source/*.bar .
```

From `man ln`; the command above uses the 3rd form:

```bsh
ln [OPTION]... [-T] TARGET LINK_NAME   (1st form)
ln [OPTION]... TARGET                  (2nd form)
ln [OPTION]... TARGET... DIRECTORY     (3rd form)
ln [OPTION]... -t DIRECTORY TARGET...  (4th form)
```

> - In the 1st form, create a link to TARGET with the name LINK_NAME.
> - In the 2nd form, create a link to TARGET in the current directory.
> - In the 3rd and 4th forms, create links to each TARGET in DIRECTORY.

In my own example, I couldn't create symbolic links in the current directory (the names are identical). So, I had to create a folder for those symbolic links:

```bash 
$ mkdir Links
$ dir=$(pwd)/* # pwd helps you to get the path to the current directory
$ echo $dir
/mnt/1074261C742604D6/Images/Linux/2106257.png /mnt/1074261C742604D6/Images/Linux/25dda2c3ca716f7d23f486b46e2c0c72.png /mnt/1074261C742604D6/Images/Linux/59163.png /mnt/1074261C742604D6/Images/Linux/arch-linux-minimalism-4k-up.jpg....
$ ln -s $dir ./Links
```

## System information

### Check os version in Linux

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

### Check the Kernel Version in Linux

The kernel is the core component of an operating system. It manages the system’s resources, and it is a bridge between your computer’s hardware and software.

There are various reasons why you might need to know the version of the kernel that is running on your GNU/Linux operating system. Perhaps you’re debugging a hardware related issue or learned about a new security vulnerability affecting older kernel versions and you want to find out whether your kernel is vulnerable or not. Whatever the reason, it’s quite easy to determine the Linux kernel version from the command line.

#### Using the `uname` Command

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

#### Using `hostnamectl` command

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

#### Using `/proc/version` File

The `/proc` directory contains virtual files with information about the [system memory](https://linuxize.com/post/free-command-in-linux/) , [CPU cores](https://linuxize.com/post/get-cpu-information-on-linux/) , [mounted filesystems](https://linuxize.com/post/how-to-mount-and-unmount-file-systems-in-linux/) , and more. Information about the running kernel is stored in the `/proc/version` virtual file.

Use [`cat`](https://linuxize.com/post/linux-cat-command/) or [`less`](https://linuxize.com/post/less-command-in-linux/) to display the contents of the file:

```bash
$ cat /proc/version
```

The output will look something like this:

```
Linux version 4.15.0-54-generic (buildd@lgw01-amd64-014) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #58-Ubuntu SMP Mon Jun 24 10:55:24 UTC 2019
```

### Get all the information about the system using inxi

**Inxi** is a powerful and remarkable command line-system information script designed for both console and **IRC**(**Internet Relay Chat**). It can be employed to instantly deduce user system configuration and hardware information, and also functions as a debugging, and forum technical support tool.

It displays handy information concerning system hardware (hard disk, sound cards, graphic card, network cards, CPU, RAM, and more), together with system information about drivers, Xorg, desktop environment, kernel, GCC version(s), processes, uptime, memory, and a wide array of other useful information.

However, it’s output slightly differs between the command line and IRC, with a few default filters and color options applicable to IRC usage. The supported IRC clients include: BitchX, Gaim/Pidgin, ircII, Irssi, Konversation, Kopete, KSirc, KVIrc, Weechat, and Xchat plus any others that are capable of showing either built in or external Inxi output.

**Inix** is available in most mainstream Linux distribution repositories, and runs on BSDs as well.

```bash
$ sudo apt-get install inxi   [On Debian/Ubuntu/Linux Mint]
$ sudo yum install inxi       [On CentOs/RHEL/Fedora]
$ sudo dnf install inxi       [On Fedora 22+]
```

Before we start using it, we can run the command that follows to check all application dependencies plus recommends, and various directories, and display what package(s) we need to install to add support for a given feature.

```bash
$ inxi --recommends 
```

When run without any flags, **Inxi** will produce output to do with system CPU, kernel, uptime, memory size, hard disk size, number of processes, client used and inxi version:

```bash
$ inxi
CPU: Dual Core Intel Core i5-3230M (-MT MCP-) speed/min/max: 1197/1200/3200 MHz 
Kernel: 5.4.0-42-generic x86_64 Up: 6h 38m Mem: 4927.8/7811.9 MiB (63.1%) 
Storage: 698.64 GiB (57.3% used) Procs: 258 Shell: bash 5.0.17 inxi: 3.0.38 
```

The command below will show sample system info (hostname, kernel info, desktop environment and disto) using the -S flag:

```bash
$ inxi -S
System:    Host: HP-ProBook-450-G0 Kernel: 5.4.0-42-generic x86_64 bits: 64 
           Desktop: Xfce 4.14.2 Distro: Linux Mint 20 Ulyana 
```

To print machine data-same as product details (system, product id, version, Mobo, model, BIOS etc), we can use the option -M as follows:

```bash
$ inxi -M
Machine:   Type: Laptop System: Hewlett-Packard product: HP ProBook 450 G0 v: A2018CD200 
           serial: <superuser/root required> 
           Mobo: Hewlett-Packard model: 1949 v: KBC Version 90.0F 
           serial: <superuser/root required> BIOS: Hewlett-Packard v: 68IRF Ver. F.70 
           date: 04/11/2019 

```

We can display complete CPU information, including per CPU clock-speed and CPU max speed (if available) with the -C flag as follows:

```bash
$ inxi -C
CPU:       Topology: Dual Core model: Intel Core i5-3230M bits: 64 type: MT MCP 
           L2 cache: 3072 KiB 
           Speed: 1244 MHz min/max: 1200/3200 MHz Core speeds (MHz): 1: 1235 2: 1242 
           3: 1212 4: 1237 
```

There many different options. 

I see that people mostly use the following combination of arguments (like in [this example](https://forums.linuxmint.com/viewtopic.php?t=308312)):

```bash
$ inxi -Fxz
System:    Kernel: 5.4.0-42-generic x86_64 bits: 64 compiler: gcc v: 9.3.0 
           Desktop: Xfce 4.14.2 Distro: Linux Mint 20 Ulyana base: Ubuntu 20.04 focal 
Machine:   Type: Laptop System: Hewlett-Packard product: HP ProBook 450 G0 v: A2018CD200 
           serial: <filter> 
           Mobo: Hewlett-Packard model: 1949 v: KBC Version 90.0F serial: <filter> 
           BIOS: Hewlett-Packard v: 68IRF Ver. F.70 date: 04/11/2019 
Battery:   ID-1: BAT0 charge: 22.2 Wh condition: 22.9/22.9 Wh (100%) 
           model: Hewlett-Packard Primary status: Unknown 
CPU:       Topology: Dual Core model: Intel Core i5-3230M bits: 64 type: MT MCP 
           arch: Ivy Bridge rev: 9 L2 cache: 3072 KiB 
           flags: avx lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 20751 
           Speed: 1439 MHz min/max: 1200/3200 MHz Core speeds (MHz): 1: 1324 2: 1269 
           3: 1230 4: 1304 
Graphics:  Device-1: Intel 3rd Gen Core processor Graphics vendor: Hewlett-Packard 
           driver: i915 v: kernel bus ID: 00:02.0 
           Device-2: AMD Mars [Radeon HD 8670A/8670M/8750M] vendor: Hewlett-Packard 
           driver: radeon v: kernel bus ID: 01:00.0 
           Display: x11 server: X.Org 1.20.8 driver: ati,modesetting,radeon 
           unloaded: amdgpu,fbdev,vesa resolution: 1366x768~60Hz 
           OpenGL: renderer: Mesa DRI Intel HD Graphics 4000 (IVB GT2) 
           v: 4.2 Mesa 20.3.0-devel (git-dd003ab 2020-08-08 focal-oibaf-ppa) 
           direct render: Yes 
Audio:     Device-1: Intel 7 Series/C216 Family High Definition Audio 
           vendor: Hewlett-Packard driver: snd_hda_intel v: kernel bus ID: 00:1b.0 
           Sound Server: ALSA v: k5.4.0-42-generic 
Network:   Device-1: Ralink RT3290 Wireless 802.11n 1T/1R PCIe vendor: Hewlett-Packard 
           driver: rt2800pci v: 2.3.0 port: 3000 bus ID: 04:00.0 
           IF: wlo1 state: up mac: <filter> 
           Device-2: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet 
           vendor: Hewlett-Packard driver: r8169 v: kernel port: 2000 bus ID: 05:00.0 
           IF: enp5s0 state: down mac: <filter> 
Drives:    Local Storage: total: 698.64 GiB used: 400.53 GiB (57.3%) 
           ID-1: /dev/sda vendor: Western Digital model: WD7500BPVT-60HXZT3 
           size: 698.64 GiB temp: 38 C 
Partition: ID-1: / size: 100.43 GiB used: 67.15 GiB (66.9%) fs: ext4 dev: /dev/sda5 
Sensors:   System Temperatures: cpu: 53.0 C mobo: N/A gpu: radeon temp: 127 C 
           Fan Speeds (RPM): N/A 
Info:      Processes: 243 Uptime: 6h 44m Memory: 7.63 GiB used: 4.48 GiB (58.7%) 
           Init: systemd runlevel: 5 Compilers: gcc: 9.3.0 Shell: bash v: 5.0.17 
           inxi: 3.0.38 
```

We use the `-F` flag to show complete Inxi output. `z` is used for security reasons (i.e. in order to hide Mac address). `x` shows extra data. For instance:

```bash
-N     Show Network card information. With -x, shows PCI BusID, Port number.
```

## Log out

### Sleep/hibernate

The command for Suspend (Sleep) is

```bash
sudo pm-suspend
```

The command for Hibernate is

```bash
sudo pm-hibernate
```

> Note that Hibernation mode is not compatible with all hardware, please test this before using it.

The command for the hibrid of them both is

```bash
sudo pm-suspend-hybrid
```

The hybrid command saves the session to the Hard Disk (safer storage place), but the system will stay running, allowing for faster resume. This does **not** mean you can turn off your computer and have your session saved. You will need to use the regular hibernate command for that.

These commands are provided by the package [pm-utils](https://apps.ubuntu.com/cat/applications/pm-utils/). Man pages: [link](http://manpages.ubuntu.com/manpages/precise/man8/pm-action.8.html).

If you have problems with those commands, please see the source. It states that

> On some hardware putting the video card in the suspend state and recovering from it needs some special quirk handling. With the --quirk-* options of the pm-suspend and pm-suspend-hybrid commands you can select which quirks should be used.

A list of these quirks, and what they mean can be found [here](http://manpages.ubuntu.com/manpages/precise/man8/pm-action.8.html#contenttoc3).

## Text-Fu

### Standard I/O

By default the echo command takes the input (standard input or stdin) from the keyboard and returns the output (standard output or stdout) to the screen. So that's why when you type echo Hello World in your shell, you get Hello World on the screen. However, I/O redirection allows us to change this default behavior giving us greater file.

**stdout**: `echo "Hello, World!"` or `echo "Hello, World!" > out.txt`. The **>** is a redirection operator that allows us the change where standard output goes. The **>>** is a redirection operator that will append "Hello, World" to the end of the file.

**stdin**: `cat < peanuts.txt > banana.txt`. We know that we have stdin from devices like the keyboard, but we can use files, output from other processes and the terminal as well, just like in this example. Just like we had **>** for stdout redirection, we can use **<** for stdin redirection.

**stderr**:

```bash
ls /fake/directory > peanuts.txt 
ls : cannot access /fake/directory: No such file or directory
```

Now you're probably thinking, shouldn't that message have been sent to the file? There is actually another I/O stream in play here called standard error (stderr). By default, stderr sends its output to the screen as well, it's a completely different stream than stdout. So you'll need to redirect its output a different way.
Unfortunately the redirector is not as nice as using **<** or **>** but it's pretty close. We will have to use file descriptors. A file descriptor is a non-negative number that is used to access a file or stream. The file descriptor for stdin, stdout and stderr is 0, 1, and 2 respectively. So now if we want to redirect our stderr to the file we can do this:

```bash
ls /fake/directory 2> peanuts.txt
```

You should see just the stderr messages in peanuts.txt.
Now what if I wanted to see both stderr and stdout in the peanuts.txt file? It's possible to do this with file descriptors as well:

```bash
ls /fake/directory > peanuts.txt 2>&1
```

There is a shorter way to redirect both stdout and stderr to a file:

```bash
ls /fake/directory &> peanuts.txt
```

### Pipe and tee

The pipe operator |, represented by a vertical bar, allows us to get the stdout of a command and make that the stdin to another process.

What if I wanted to write the output of my command to two different streams? That's possible with the tee command:

```bash
ls | tee peanuts.txt
```

You should see the output of ls on your screen and if you open up the peanuts.txt file you should see the same information!

### Cut and paste

Copy and paste the following command, once you do that add a TAB in between lazy and dog (hold down Ctrl-v + TAB).

```bash
echo 'The quick brown; fox jumps over the lazy  dog' > sample.txt
```

To extract contents by a list of characters:

```bash
cut -c 5 sample.txt
```

This outputs the 5th character in each line of the file.

To extract the contents by a field, we'll need to do a little modification:

```bash
cut -f 2 sample.txt
```

The -f or field flag cuts text based off of fields, by default it uses TABs as delimiters, so everything separated by a TAB is considered a field. You should see "dog" as your output because it takes the second (starting from 1) field after the delimiter.

You can combine the field flag with the delimiter flag to extract the contents by a custom delimiter:

```bash
cut -f 1 -d ";" sample.txt
```

Let's consider other examples:

```bash
cut -c 5-10 sample.txt
cut -c 5- sample.txt
cut -c -5 sample.txt
```

The first command will give us the sequence of characters from 5 to 10 (indexing from 1).

The second command cuts out the first 5 characters and returns the remaining characters to us.

And the last command gives us only the first 5 characters.

The paste command is similar to the cat command, it merges lines together in a file. Let's consider this example:

```bash
paste -s sample2.txt
The	quick	brown	fox
```

The flag -s you use with paste to make everything go on one line. The default delimiter for paste is TAB, so now there is one line with TABs separating each word.

Let's change this delimiter (-d) to something a little more readable:

```bash
paste -d ' ' -s sample2.txt
```

Now everything should be on one line delimited by spaces.

### Expand and unexpand

Normally TABs would usually show a noticeable difference but some text files don't show that well enough. Having TABs in a text file may not be the desired spacing you want. To change your TABs to spaces, use the expand command.

```bash
expand sample.txt
```

The command above will print output with each TAB converted into a group of spaces. To save this output in a file, use output redirection like below.

```bash
expand sample.txt > result.txt
```

Opposite to expand, we can convert back each group of spaces to a TAB with the unexpand command:

```bash
unexpand -a result.txt
```

### Join and split

The join command allows you to join multiple files together by a common field (remember, indexing starts from 1). The fields have to be identical, if they are not you can sort them.

How would we join the following files?

```bash
file1.txt
John 1
Jane 2
Mary 3

file2.txt
1 Doe
2 Doe
3 Sue
```

To join this file you need to specify which fields you are joining, in this case we want field 2 on file1.txt and field 1 on file2.txt, so the command would look like this:

```bash
$ join -1 2 -2 1 file1.txt file2.txt
1 John Doe
2 Jane Doe
3 Mary Sue
```

-1 refers to file1.txt and -2 refers to file2.txt. Pretty neat. You can also split a file up into different files with the split command:

```bash
split somefile
```

If you join two files with different number of lines in each file, the join command will discard the lines that don't exist in the biggest one. Remember, the files should have identical the first fields.

This will split it into different files, by default it will split them once they reach a 1000 line limit. The files are named x** by default.

### wc and nl

The wc (word count) command shows the total count of words in a file. It display the number of lines, number of words and number of bytes, respectively. To just see just the count of a certain field, use the -l, -w, or -c respectively.

Another command you can use to check the count of lines on a file is the nl (number lines) command.

```bash
nl file1.txt
1. i
2. like
3. turtles
```

**Exercise**

How would you get the total count of lines by using the nl file without searching through the entire output? Hint: Use some of the other commands you learned in this course.

Solution:

```bash
nl -n 'ln' reading.txt | sort -r | cut -b 1 | head -n 1
```

> `nl -n 'ln'` will give us the number of lines with convenient formatting (otherwise we should start from the sixth character).
>
> `sort -r` will sort the given input recursively.
>
> `cut -b 1` allows us to get only the first characters of each line.
>
> `head -n 1` returns only the first line of the input. In this case, we only get one character.  

## References

1. https://askubuntu.com/questions/106351/running-programs-in-the-background-from-terminal
2. https://superuser.com/questions/633605/how-to-create-symbolic-links-to-all-files-class-of-files-in-a-directory
3. https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
4. https://linuxize.com/post/how-to-check-the-kernel-version-in-linux/
5. https://www.tecmint.com/inxi-command-to-find-linux-system-information/
6. https://askubuntu.com/questions/181390/what-is-the-command-for-sleep-hibernate
7. https://apps.ubuntu.com/cat/applications/pm-utils/
8. http://manpages.ubuntu.com/manpages/precise/man8/pm-action.8.html
9. https://linuxjourney.com/