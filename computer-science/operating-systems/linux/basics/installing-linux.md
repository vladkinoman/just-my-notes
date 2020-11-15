# Installing Linux

## Installing Windows after Linux

**Issue. We lost Linux and grub after installing Windows.**

**Solution. My old notes, using command line in Linux.**

> This solution is based on my old notes from ~ 2017. Could be outdated. TODO: check this later.

So, we have to bring it back:

1. Launch Linux Live distribution.

2. Press `<Ctrl>` + `<Alt>` + `<T>` in order to open the terminal.

3. Write the next command to list the partition table:

   ```bash
   sudo fdisk -l
   ```

4. Mount the partition with your Linux system into `mnt` (in my case, it's `sda5`):

   ```bash
   sudo mount /dev/sda5 /mnt
   ```

5. Install grub under the directory `mnt/grub` instead of the `boot/grub` directory:

   ```bash
   sudo grub-install --boot-directory=/mnt /dev/sda
   ```

   > In my old notes, --boot-directory was `--root-directory`.

6. Reboot your PC:

   ```bash
   sudo reboot
   ```

**Solution. Using command line in Linux and chroot.**

Essentially the steps are:

1. Using Linux distribution live cd to boot in Try Linux distribution mode.

2. Use gparted to verify the correct Linux partition (e.g. `/dev/sda5`).

3. Mount the Linux partition:

   ```bash
   sudo mount /dev/sda5 /mnt  #Replace sda5 with your partition number
   ```

4. Mount all other Linux system folders:

   ```bash
   for i in /sys /proc /run /dev; do sudo mount --bind "$i" "/mnt$i"; done
   ```

   If you are running an UEFI system, you will also have to mount your EFI directory using the following command:

   ```bash
   sudo mount /dev/sda1 /mnt/boot/efi
   ```

5. chroot into your install

   ```bash
   sudo chroot /mnt
   ```

6. Now that you are logged in your installation (not the Ubuntu Live) just do

   ```bash
   update-grub
   grub-install /dev/sda
   update-grub
   exit
   sudo reboot
   ```

Long answer can be found [here](https://askubuntu.com/questions/88384/how-can-i-repair-grub-how-to-get-ubuntu-back-after-installing-windows).

**Solution. Doing this in Windows.**

You have to run this in Windows as an administrator:

```powershell
bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi
```

Or, if you are using PowerShell:

```powershell
bcdedit /set "{bootmgr}" path \EFI\ubuntu\grubx64.efi
```

> The final argument to this command depends on your particular system configuration. You can use this command to determine the correct path for your system:
>
> ```powershell
> bcdedit /enum firmware
> ```
>
> This will list all the installed boot managers and associated EFI paths, and grub should be somewhere in the list.

**Solution. Use Boot Repair tool.**

The Windows installer doesn't care about other OS in the system. So it writes own code over the master boot record. Fortunately the solution is easy too.

You need to repair the MBR. Do the following

Boot using a live usb/cd of ubuntu. Use `boot-repair` to fix the problem.

After booting with live usb/cd, run following command in terminal:

```bash
sudo add-apt-repository ppa:yannubuntu/boot-repair && sudo apt-get update
sudo apt-get install -y boot-repair && boot-repair
```

Use `Boot Repair`.

More info can be found [here](https://help.ubuntu.com/community/Boot-Repair).

## References

1. https://askubuntu.com/questions/655011/windows-10-upgrade-kills-grub-and-boot-repair-doesnt-help
2. https://askubuntu.com/questions/88384/how-can-i-repair-grub-how-to-get-ubuntu-back-after-installing-windows
3. https://help.ubuntu.com/community/Boot-Repair