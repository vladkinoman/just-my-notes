# Mount drive through command line (as if I clicked on it in nautilus) in Ubuntu

Here is how to do this:

```Bash
udisksctl mount --block-device /dev/disk/by-label/baydrive
udisksctl unmount --block-device /dev/disk/by-label/baydive
```

---

You can actually auto-mount hard disks on boot. Use Disks app which is default on Ubuntu:

1. Select your disk or partition.
2. Click the gear icon.
3. Edit mount options.
4. Switch User Session Defaults to OFF.
5. Click OK.

The first problem with it is that somehow disk could change permissions and make system to be mounted read-only which is bad. You need it to be mounted read-write (in that case you can apply command "chmod 777"). After this problem you need to "remount" it, but it is really hard and might not work for you :(

The second problem that I get was a very strange problem [4]. So, I couldn't remove files/folders. When I removed them, they came back instantly (WHAT?). I didn't try solution from StackExchange. I just change permissions in Windows for all users. After that, all users can modify files/folders, but they do not get ALL permissions, which administrator has.

## Source

1. [Mount drive through command line](https://askubuntu.com/questions/45241/mount-drive-through-command-line-as-if-i-clicked-on-it-in-nautilus)
2. [How to fix “sudo: unable to open … Read-only file system”?](https://askubuntu.com/questions/197459/how-to-fix-sudo-unable-to-open-read-only-file-system)
3. [Help with changing permissions on an external drive?](https://ubuntuforums.org/showthread.php?t=1946755)
4. [Problem which I get through those manipulations with disks](https://askubuntu.com/questions/566474/why-do-i-get-directory-not-empty-when-i-try-to-remove-an-empty-directory)

> 4: some people recommended fsck command which was proposed in [2].

