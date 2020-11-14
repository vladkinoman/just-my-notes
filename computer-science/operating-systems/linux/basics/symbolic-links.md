# Symbolic links

A symbolic link, ***\*also known as a symlink or a soft link\****, is a special type of file that simply points to another file or directory just like shortcuts in Windows. Creating symbolic link is like [creating alias to an actual file](https://linuxhandbook.com/linux-alias-command/).

If you try to access the symbolic link, you actually access the target file to which the symlink points to. Changes performed on the content of the link file changes the content of the actual target file.

If you [use the ls command with option -l](https://linuxhandbook.com/ls-command/), this is what a symbolic link looks like:

```bash
lrwxrwxrwx 1 abhishek abhishek 23 Jul  2 08:51 link_prog -> newdir/test_dir/prog.py
```

Symbolic links offer a convenient way to organize and share files. They provide quick access to long and confusing directory paths. They are heavily used in linking libraries in Linux.

Now that you know a little about the symbolic links, let’s see how to create them.

## Example of creating symlinks

I encountered this example when tried to use IntelliJ IDEA features from the command line. You can't do this if you installed it from the **.tar** archive. So, this is what you need to do, according to Jetbrains tutorial.

You can create a symbolic link to the launcher script **idea.sh** in a directory from the `PATH` environment variable. For example, if you installed IntelliJ IDEA to **/opt/idea** and want to create a link named **idea** in **/usr/local/bin**, run the following command:

```bash
sudo ln -s /opt/idea/bin/idea.sh /usr/local/bin/idea
```

Since **/usr/local/bin** should be in the `PATH` environment variable by default, you should be able to run the `idea` command from anywhere in the shell.

## References

1. https://linuxhandbook.com/symbolic-link-linux/
2. https://www.jetbrains.com/help/idea/working-with-the-ide-features-from-command-line.html