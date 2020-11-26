# Cinnamon

## Solving issues

Found the pattern [here](https://github.com/linuxmint/cinnamon/issues/9694).

- Cinnamon version: 4.6.7
  - Please specify if you are using the daily builds PPA
    (https://launchpad.net/~linuxmint-daily-build-team/+archive/ubuntu/daily-builds).
    No, I do not.
- Distribution: Linux Mint 20 Cinnamon
- Graphics hardware *and* driver used: Intel HD 4000, AMD HD 8750M, Mesa 21.0
- 32 or 64 bit: 64bit
- Attach /home//.xsession-errors, or /var/log/syslog
  ...

**Issue**

Desktop doesn't start Desktop window where you can show Desktop icon. It starts System Settings instead.

**Steps to reproduce**

- Install Linux Mint 20 XFCE and then install Cinnamon DE on it.

- Launch Desktop through menu or using CLI: `cinnamon-settings desktop`.

- It does not show any errors in the terminal:

  ```bash
  cinnamon-settings desktop
  Using PAM module (python3-pam)
  ```

**Expected behavior**

The Desktop window to appear.

**Solution**

It sounds like some core packages are missing, maybe they have been removed when I tried to install another one.

This helped me:

```bash
sudo apt update && sudo apt install mint-meta-cinnamon cinnamon nemo
```

In the future, I should pay very close attention when installing a package that warns about removing other packages.

**Just in case**

Try reinstalling it: 

```bash
apt install --reinstall cinnamon-common
```

If that doesn't help try starting it from the terminal

```bash
cinnamon-settings desktop
```

Does the output have any errors? You can ignore deprecation warnings.

Still no clues? Check with `apt policy cinnamon-common` that you have version 4.6.6+ulyana installed. And with `file /usr/share/cinnamon/cinnamon-settings/modules/cs_desktop.py` that this file is a Python script, ASCII text executable.

And the best solution is to install a fresh Linux Mint 20 Cinnamon.

## References

1. https://github.com/linuxmint/cinnamon/issues/9694
2. https://forums.linuxmint.com/viewtopic.php?t=284651
3. https://forums.linuxmint.com/viewtopic.php?t=324604