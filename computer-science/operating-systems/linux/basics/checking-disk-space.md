# Checking disk space

> Found this advice in [this](https://askubuntu.com/questions/911865/no-more-disk-space-how-can-i-find-what-is-taking-up-the-space) StackOverflow discussion.

As always in Linux, there's more than one way to get the job done.

```bash
du -cha --max-depth=1 / | grep -E "M|G"
```

> The grep is to limit the returning lines to those which return with values in the Megabyte or Gigabyte range. If your disks are big enough, you could add `|T` as well to include Terabyte amounts. You may get some errors on `/proc`, `/sys`, and/or `/dev` since they are not real files on disk. However, it should still provide valid output for the rest of the directories in root. After you find the biggest ones you can then run the command inside of that directory in order to narrow your way down the culprit. So for example, if `/var` was the biggest you could do it like this next:
>
> ```bash
> du -cha --max-depth=1 /var | grep -E "M|G"
> ```

---

You can use `ncdu` for this. It works very well.

```bash
sudo apt install ncdu
```

---

```bash
sudo du -aBM -d 1 . | sort -nr | head -20
```

Occasionally, you need to run it from the `/` directory.

> The first solution is actually quicker than this one.

---

If you have reason to believe that few large files are the main problem, rather than many small ones, you could use something like :

```bash
find / -size +10M
```

---

Here is the recommendations from the Unix administrator:

1. Find out which filesystem runs out of space

   ```
   df -h
   ```

   will list all filesystem, their size and their free space. You only waste time if you investigate filesystems that have enough space. Assume that the full filesystem is /myfilesystem. check the df output if there are filesystems mounted on subdirs of /myfilesystems. If so, the following speps must be adapted to this situation.

2. Find out how much space is used by the files of this filesystem

   ```
   du -sh /myfilesystem
   ```

   The -x option may be used to guarantee that only the files that are member of this filesystems are taken into account. Some Unix variants (e.g. Solaris) do not know the -x option for du. Then you have to use some workarounds to find the du of your filesystem.

3. Now check if the du of the visible files is approximately the size of the used space displayed by df. If so, you can start to find the large files/directories of the /myfilesystem filesystem to clean up.

4. to find the largest subdirectories of a directory /.../dir use

   ```
   du -sk /.../dir/*|sort -n
   ```

   the -k option forces du to output the sie in kilobyte without any unit. This may be the default on some systems. Then you can omit this option. The largest files/subdirectories will be shown at the bottom of the output.

5. If you have found a large file/directory that you don't need anymore you can remove it in an appropriate way. Don't bother about the small directories on the top of the output. It won't solve your problem if you delete them. If you still haven't enough space than you can repeat step 4 in the larges subdirectories which are displayed at the bottom of the list.
   But what happened if the du output is not approximately the available space displayed by df?
   If the du output is larger then you have missed a subdirectory where another filesystem is mounted. If the du output is much smaller, then som files are not shown in any directory tha du inspects. There can be different reasons for his phenomena.

6. Some processes are using a file that was already deleted. Therefore this files were removed from the directory and du can't see them. But for the filesystem their blocks are still in use until the proceses close the files. You can try to find out the relevant processes (e.g. with lsof) and force them to close this files (e.g by stopping the application or by killing the processes). Or you simply reboot your machine.

7. There are files in directories that aren't visible anymore because on one of their parent directories another filesystem is mounted. So if you have a file /myfilesysem/subdir/bigfile and now mount another filesystem on /myfilesystem/subdir then you cannot see this file anymore and

   ```bash
   du -shx /myfilesystem 
   ```

   will report a value that does not contain the size of /myfilesystem/subdir/bigfile. The only way to find out if such files exist is to unmount /myfilesystem/subir and check with

   ```bash
   ls -la /myfilesystem/subdir
   ```

   if it contains files.

8. There may be special types of filesystems that use/reserve space on a disk that is not visible to the ls command. You need special tools to display this.

Besides this systematic way using the du command there are some other you can use. So you can use the find command to find files that are larger then some value you supply, you can search for files that larger than some value you supply or that were newly created or have a special name (e.g. *.log, core, *.trc). But you always should do a df as described in 1 so that you work on the right filesystem

---

In case you are also interested in not using a command, here's an app: [Filelight](https://apps.ubuntu.com/cat/applications/precise/filelight/)

It lets you quickly visualize what's using disk space in any folder.

[![enter image description here](https://i.stack.imgur.com/wxahf.jpg)](https://i.stack.imgur.com/wxahf.jpg)

