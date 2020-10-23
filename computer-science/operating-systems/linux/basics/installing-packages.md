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

## Uninstalling packages

What I usually do:

```bash
$ sudo apt purge _packages_
$ sudo apt autoremove
```

- `apt-get purge` will remove any package and it's configuration (`apt remove` uninstall a package only).
- `apt-get autoremove` removes packages that were installed automatically as a result of you choosing to install packages that you no longer have on your system. It won't remove packages you specifically chose to install. Previous `apt purge` will do that.

If it didn't help to uninstall or to fix a package, try all of these commands:

```bash
$ sudo apt-get autoremove
$ sudo apt-get --purge remove
$ sudo dpkg --remove --force-remove-reinstreq tspc
$ sudo apt-get autoclean
$ sudo apt-get clean
$ sudo apt-get -f install
```

These may clear or fix broken packages and try to install again.

### How to uninstall a package installed with pip install --user

(Python 3.5 and pip 7.1.2 on Linux) the situation appears to be this:

- `pip install --user somepackage` installs to `$HOME/.local`, and uninstalling it does work using `pip uninstall somepackage`.
- This is true whether or not `somepackage` is also installed system-wide at the same time.
- If the package is installed at both places, only the local one will be uninstalled. To uninstall the package system-wide using `pip`, first uninstall it locally, then run the same uninstall command again, with `root` privileges.
- In addition to the predefined user install directory, `pip install --target somedir somepackage` will install the package into `somedir`. There is no way to uninstall a package from such a place using `pip`. (But there is a somewhat old unmerged pull request on Github that implements `pip uninstall --target`.)
- Since the only places `pip` will ever uninstall from are system-wide and predefined user-local, you need to run `pip uninstall` as the respective user to uninstall from a given user's local install directory.

Be careful though, for those who using `pip install --user some_pkg` **inside a virtual environment**.

```sh
$ path/to/python -m venv ~/my_py_venv
$ source ~/my_py_venv/bin/activate
(my_py_venv) $ pip install --user some_pkg
(my_py_venv) $ pip uninstall some_pkg
WARNING: Skipping some_pkg as it is not installed.
(my_py_venv) $ pip list
# Even `pip list` will not properly list the `some_pkg` in this case
```

In this case, you have to **deactivate the current virtual environment**, then use the corresponding `python`/`pip` executable to list or uninstall the user site packages:

```sh
(my_py_venv) $ deactivate
$ path/to/python -m pip list
$ path/to/python -m pip uninstall some_pkg
```

Note that this issue [was reported few years ago](https://github.com/pypa/pip/issues/3352). And it seems that the [current conclusion](https://github.com/pypa/pip/issues/3352#issuecomment-183746948) is: `--user` is not valid inside a virtual env's `pip`, since a user location doesn't really make sense for a virtual environment.

## References

1. [How to install a deb file, by dpkg -i or by apt?](https://unix.stackexchange.com/questions/159094/how-to-install-a-deb-file-by-dpkg-i-or-by-apt)
2. [how to use sudo command to install .tar.gz?](https://askubuntu.com/questions/191390/how-to-use-sudo-command-to-install-tar-gz/191391)
3. [Linux truly uninstall package](https://stackoverflow.com/questions/34698149/linux-truly-uninstall-package)
4. [How to remove an incomplete package by using apt-get](https://stackoverflow.com/questions/27455626/how-to-remove-an-incomplete-package-by-using-apt-get)
5. [How to uninstall a package installed with pip install --user](https://stackoverflow.com/questions/33412974/how-to-uninstall-a-package-installed-with-pip-install-user)