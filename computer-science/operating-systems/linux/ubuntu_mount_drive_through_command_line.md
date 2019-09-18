# Mount drive through command line (as if I clicked on it in nautilus) in Ubuntu

Here is how to do this:

```Bash
udisksctl mount --block-device /dev/disk/by-label/baydrive
udisksctl unmount --block-device /dev/disk/by-label/baydive
```

## Source

[Link](https://askubuntu.com/questions/45241/mount-drive-through-command-line-as-if-i-clicked-on-it-in-nautilus)

