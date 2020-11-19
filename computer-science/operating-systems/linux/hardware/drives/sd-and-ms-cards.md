# SD and MD cards

**Issue. Linux Mint doesn't recognize SD and MD cards. It sees the Realtek memory card driver sometimes.**

**Solution.**

I could solve this issue only for SD cards.

Linux Mint can read SD cards. If you're having problems consider:

- Can Linux Mint see your SD card reader? `lsusb` aught to tell you if it has connected. If that hangs or doesn't show it though, that suggests that there's a problem. The practical solution is to try another.

  SD card readers are almost famously cheap. I've had some that are so poor they hang BIOS if they're plugged in at boot, or cause USB bus failures if left in too long. I've never experienced such a wide range of suck in any other hardware.

- Can Linux Mint read the filesystem? Does `sudo fdisk -l` show the partition on the SD card? Is it supported by the Kernel? Run `less /proc/filesystems` to see what are supported. Practical solution: pick a better format that your devices *and* your computer can read!

- Is is just not mounting? If you can see the reader and see a mountable partition, try mounting it manually (`sudo mount /dev/sdX1 /mnt` — replace the `sdX1` with the right designation from `fdisk`). There's a fairly complicated udisks/udev chain for mounting these things so perhaps there's a bug in the combination of your reader and format. [This is a known issue](https://askubuntu.com/questions/95391/how-do-i-mount-an-sd-card) you you step around with:

  ```bash
  echo 1 > sudo tee /sys/bus/pci/rescan
  ```

How I found my device. I used `lspci` in order to list all PCI devices:

```bash
sudo lspci -v -nn
```

What I got:

```bash
03:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5229 PCI Express Card Reader [10ec:5229] (rev 01)
	Subsystem: Hewlett-Packard Company RTS5229 PCI Express Card Reader [103c:1949]
```

Check your SD card. Maybe you have physical write protection:

![](https://i.stack.imgur.com/Oic5s.png)



What helped me. That was probably an installation-issue which can be resolved with re-installation? This would concern package `udisks2`.

1. Reinstall [package `udisks2`](https://www.freedesktop.org/wiki/Software/udisks)

   ```bash
   sudo apt-get install --reinstall udisks2
   ```

2. Reboot the machine

   ```bash
   systemctl reboot
   ```

SD cards should be recognized then, after inserting them (in and out and in cautiously).

After that, I used `sudo fdisk -l` and got the next message:

```bash
Disk /dev/mmcblk0: 121,26 MiB, 127139840 bytes, 248320 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000
```

So, it works!

**Just in case.**

Here is a good article on how to find out what hardware I have: [link](https://www.linuxjournal.com/content/what-hardware-do-i-have).

## References

1. https://askubuntu.com/questions/469030/seems-ubuntu-cannot-read-sd-cards
2. https://askubuntu.com/questions/213889/microsd-card-is-set-to-read-only-state-how-can-i-write-data-on-it
3. https://askubuntu.com/questions/787088/sd-card-reader-not-detected-in-ubuntu-16-04
4. https://www.linuxjournal.com/content/what-hardware-do-i-have

