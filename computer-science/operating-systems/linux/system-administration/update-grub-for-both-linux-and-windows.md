# Update grub for both Linux and Windows

## Fedora 38

We lost Windows after Linux installation:

- Use os-prober. Notice that this package is insecure. This is because it mounts all partitions on our disk as root using the grub-mount command to check if they contain other OSes.

> I don't think that os-prober helped in my case. I used the second command.

- `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` for the legacy BIOS mode.

> If this doesn't help and os-prober can't even find Windows check out this [link](https://www.reddit.com/r/Fedora/comments/wfn72u/guide_bring_back_windows_10_to_grub_after_install/):
>
> Ensure that Fedora cannot find windows:
>
> > sudo os-prober
>
> If this command doesn't show you any output (or anything that match with  windows) probably you have the same problem. You need to start windows  from the boot options of your computer. Write in the windows start menu **System Info**, this will start a program and you need to looking for **BIOS mode**, if the value is legacy, that probably is the problem.
>
> Ensure that your BIOS is using the UEFI boot
>
> That depend of your hardware, you need to check if your system is using the UEFI boot mode.
>
> Change windows BIOS mode
>
> In order to resolve the problem, you need to start windows in repair mode and open a cmd to execute some commands:
>
> Validate
>
> > mbr2gpt /validate
>
> Convert
>
> > mbr2gpt /convert
>
> In this [guide](https://www.maketecheasier.com/convert-legacy-bios-uefi-windows10) explain in more detail the process.
>
> if you want to ensure that the system is finding the windows boot you can run again **sudo os-prober** and the windows must appear in the shell.
>
> After change the windows BIOS mode, you need to start again Fedora and update the GRUB configuration:
>
> > sudo grub2-mkconfig -o /boot/grub2/grub.cfg
>
> This command also must show a message like **Found Windows Boot Manager on /dev/sd...**

## Ubuntu-like

We lost Linux after Windows installation:

- Boot-Repair helped me to fix grub after Windows.

> Couldn't fix grub on Fedora after installing Windows:(

## Restore MBR

> Had this problem after Linux installation when I couldn't get GRUB to show up.

testdisk restores MBR easily. Install it on Linux Live USB.

## Sources

1. https://www.baeldung.com/linux/grub-bootloader-add-new-os
2. https://www.reddit.com/r/Fedora/comments/wfn72u/guide_bring_back_windows_10_to_grub_after_install/