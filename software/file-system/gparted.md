# gparted

**gparted** is a useful tool for partitioning your disk. I used it to give more space for my ext4 file system (Linux Mint). So, I took some free space from my NTFS (Windows 10) partition. I couldn't do that in Windows 10 because I cannot shrink a volume beyond the point where any unmovable files were located (see the "defrag" even in the Application log for detailed information).

So, the easiest way was just to use a Live USB with [GParted](http://gparted.org/livecd.php) on it since that will allow you to move Windows protected files around: [link](https://stackoverflow.com/questions/43242327/unable-to-shrink-partition-size). However, I used gparted on my Linux Mint flash drive.

Working with gparted: [link](https://www.howtogeek.com/114503/how-to-resize-your-ubuntu-partitions/).

It took me 16 hours to finish this process of partitioning.

**You can’t create more than 4 primary partitions**

You can’t create more than 4 primary partitions, but you can create extended partition from your primary partition: [link](https://askubuntu.com/questions/316315/create-partition-from-free-space-cannot-create-more-than-4-partitions).

**Merge two unallocated partitions**

In order to do that you need to move around your disk: [link](https://askubuntu.com/questions/392763/how-to-merge-two-unallocated-partitions-using-gparted).

**Where does 1mb of free space come from after expansion of the partition?**

[Answer 1](https://askubuntu.com/questions/948837/why-does-gparted-force-1mb-free-space-preceeding), [Answer 2](https://superuser.com/questions/847775/gparted-leaves-1mb-unallocated-space-at-end-of-external-hdd-override-alternativ).

## Recover partition after GParted resizing interrupted by unexpected shutdown

> [Source](https://askubuntu.com/questions/218847/recover-partition-after-gparted-resizing-interrupted-by-unexpected-shutdown).

Your data is pretty much toast.  At this point you need to restore from  backup.  If you don't have backups, let this be a lesson to you to start making them.  If there are still files you want to attempt to recover,  pray, and try the `photorec` utility from the testdisk package.

> I didn't believe it. My computer has only about 4GB of RAM, and the  partition being moved was around 350GB. If we assume that the "move  partition" operation of GParted is correct, 4GB should be a limit on the amount of data that could have been lost. (Otherwise, the "move  partition" operation likely could not complete without loss of data).
>
> Indeed, I was able to recover my directory tree, albeit a bit  shuffled (since the move operation had been interrupted, a strange  directory configuration resulted, where about half of my home directory  was inside one folder).
>
> The answer was *testdisk*, which was able to detect the  filesystem in question. After this was detected, I copied the files onto an external HD. This learning experience has brought me closer to  enlightenment via http://www.taobackup.com/.