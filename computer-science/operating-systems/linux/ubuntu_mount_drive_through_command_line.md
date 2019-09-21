# Mount drive through command line (as if I clicked on it in nautilus) in Ubuntu

Here is how to do this:

```Bash
udisksctl mount --block-device /dev/disk/by-label/baydrive
udisksctl unmount --block-device /dev/disk/by-label/baydive
```

You can actually auto-mount hard disks on boot. Use Disks app which is default on Ubuntu:

1. Select your disk or partition.
2. Click the gear icon.
3. Edit mount options.
4. Switch User Session Defaults to OFF.
5. Click OK.

Problem with it is that somehow disk could change permissions and make system to be mounted read-only which is bad. You need it to be mounted read-write (in that case you can apply command "chmod 777"). After this problem you need to "remount" it, but it is really hard and might not work for you :(

## Source

[Link](https://askubuntu.com/questions/45241/mount-drive-through-command-line-as-if-i-clicked-on-it-in-nautilus)

