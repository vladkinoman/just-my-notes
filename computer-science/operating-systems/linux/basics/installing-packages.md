# Installing packages

## Installing deb packages

When you use apt to install a package, under the hood it uses dpkg. When you install a package using apt, it first creates a list of all the dependencies and downloads it from the repository [1].

Once the download is finished it calls dpkg to install all those files, satisfying all the dependencies.

So if you have a .deb file you can install it using:

```bash
$ sudo dpkg -i /path/to/deb/file
$ sudo apt-get install -f
```

## Installing tar archive

No need to use sudo to unpack the archive. Type this in a terminal:

```bash
$ tar -xzf archive.tar.gz
```

If this archive contains something to install in the system, then `sudo` would be useful at one point or another. Very often, such an archive contains software that must be compiled and then installed. Typically, what you then do is as follows:

```bash
$ tar -xzf archive-name.tar.gz
$ cd archive-name
$ ./configure
$ make
$ sudo make install
```


As you see, only the step actually installing the program requires superuser rights; everything else happens just in your home directory, which you own.

## References

1. [How to install a deb file, by dpkg -i or by apt?](https://unix.stackexchange.com/questions/159094/how-to-install-a-deb-file-by-dpkg-i-or-by-apt)
2. [how to use sudo command to install .tar.gz?](https://askubuntu.com/questions/191390/how-to-use-sudo-command-to-install-tar-gz/191391)