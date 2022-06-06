# Python 2 and porting to Python 3

**Issue. The unicode keyword.**

**Solution.**

Renamed it to str.

> [Source](https://stackoverflow.com/questions/19877306/nameerror-global-name-unicode-is-not-defined-in-python-3). 

Python 3 renamed the `unicode` type to `str`, the old `str` type has been replaced by `bytes`.

```python
if isinstance(unicode_or_str, str):
    text = unicode_or_str
    decoded = False
else:
    text = unicode_or_str.decode(encoding)
    decoded = True
```

You may want to read the [Python 3 porting HOWTO](http://docs.python.org/dev/howto/pyporting.html) for more such details. There is also Lennart Regebro's [Porting to Python 3: An in-depth guide](http://python3porting.com/), free online.

Last but not least, you could just try to use the [`2to3` tool](http://docs.python.org/3/library/2to3.html) to see how that translates the code for you.

## Set default python version to python 3

> [Source 1](https://linuxconfig.org/how-to-change-from-default-to-alternative-python-version-on-debian-linux), [Source 2](https://stackoverflow.com/questions/41986507/unable-to-set-default-python-version-to-python3-in-ubuntu).

### Change python version system-wide

To change python version system-wide we can use `update-alternatives` command. Logged in as a root user, first list all available python alternatives:

```bash
update-alternatives --list python
update-alternatives: error: no alternatives for python
```

The above error message means that no python alternatives has been recognized by `update-alternatives` command. For this reason we need to update our alternatives table and include both `python2.7` and `python3.4`:

```bash
update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
update-alternatives: using /usr/bin/python2.7 to provide /usr/bin/python (python) in auto mode
update-alternatives --install /usr/bin/python python /usr/bin/python3.4 2
update-alternatives: using /usr/bin/python3.4 to provide /usr/bin/python (python) in auto mode
```

The `--install` option take multiple arguments from which it will be able to create a symbolic link. The last argument specified it priority means, if no manual alternative selection is made the alternative with the highest priority number will be set. In our case we have set a priority 2 for `/usr/bin/python3.4` and as a result the `/usr/bin/python3.4` was set as default python version automatically by `update-alternatives` command.

```bash
python --version
Python 3.4.2
```

Next, we can again list all python alternatives:

```bash
update-alternatives --list python
/usr/bin/python2.7
/usr/bin/python3.4
```

From now on, we can anytime switch between the above listed python alternative versions using below command and entering a selection number:

```bash
update-alternatives --config python
```