# Solving problems with games on Linux

## A network of points appears while shooting in Max Payne 1

**Issue**

A network of points appears while shooting in Max Payne 1. It is connected to the display resolution. My monitor is 1366x768. There is a mode 1366x768x16 in the game, but you need the 32 bit version.

**Solution**

The easiest solution is to install ["Max Payne - FixItAll"](https://steamcommunity.com/sharedfiles/filedetails/?id=1184013727) patch by community. It includes ThirteenAG's widescreen fix which makes the game 16:9 compatible. Install it with Wine.

## CPU and GPU problems in the games made by Croteam

**Issue #1**

After a launch the game in terminal I've noticed a warning:

```bash
"WRN: CPU Power saving is enabled and performance governor is not used."
```

So, their games are launched in power saving mode.

**Solution**

In order to fix this you can install cpufreq utilities:

```bash
$ sudo apt-get install cpufrequtils
```


and switched CPUs to performance mode:

```bash
$ sudo cpufreq-set -g performance
```

And you can play!

> Thats why devs recommend to disable all cpu power saving modes in bios.

The other options could be:

**thermald**

[thermald](https://www.archlinux.org/packages/?name=thermald) is a Linux daemon used to prevent the overheating of platforms. This daemon monitors temperature and applies compensation using available cooling methods.

By default, it monitors CPU temperature using available CPU digital temperature sensors and maintains CPU temperature under control, before HW takes aggressive correction action. If there is a skin temperature sensor in thermal sysfs, then it tries to keep skin temperature under 45C.

The associated systemd unit is `thermald.service`, which should be [started](https://wiki.archlinux.org/index.php/Start) and [enabled](https://wiki.archlinux.org/index.php/Enable).

**i7z**

[i7z](https://www.archlinux.org/packages/?name=i7z) is an i7 (and now i3, i5) CPU reporting tool for Linux. It can be launched from a Terminal with the command `i7z` or as GUI with `i7z-gui`.

**cpupower**

[cpupower](https://www.archlinux.org/packages/?name=cpupower) is a set of userspace utilities designed to assist with CPU frequency scaling. The package is not required to use scaling, but is highly recommended because it provides useful command-line utilities and a [systemd](https://wiki.archlinux.org/index.php/Systemd) service to change the governor at boot.

The configuration file for *cpupower* is located in `/etc/default/cpupower`. This configuration file is read by a bash script in `/usr/lib/systemd/scripts/cpupower` which is activated by *systemd* with `cpupower.service`. You may want to [enable](https://wiki.archlinux.org/index.php/Enable) `cpupower.service` to start at boot.

**cpupower-gui**

It's described in detail here: [link](https://wiki.archlinux.org/index.php/CPU_frequency_scaling#cpupower).

---

**Issue #2** 

The games don't launches on a discrete video card. I have a laptop with hybrid graphics. Intel 4000 and AMD Radeon 8750M are cards I have.

**Solution**

The problem is not only that the games work on an integrated video card, but that the latest version of The Talos Principle only supports Vulkan, not OpenGL. So, there are two solutions:

- In Steam properties switch the game to the "legacy - pre se2017" 'beta'. 

  > Current patch removed dx9 and open gl support (and 32 bit) which I assume is going to be pretty important when you don't have a proper gpu.

  Actually, there are many different versions. I think the legacy Linux version is the best. He here is my tests:

  ```reStructuredText
  ================================
  Testing the legacy Linux version
  --------------------------------
  The android goes somewhere when the gamepad is on. (?)
  
  With DRI_PRIME=1
      FPS ~ 60
            56 while moving
  
  Without DRI_PRIME=1
      FPS ~ 45
            35 while moving
  ==================================
  Testing the original Linux version
  ----------------------------------
  The android goes somewhere when the gamepad is on. (?)
  
  With DRI_PRIME=1
      FPS ~ 20
            15 while moving
  
  Without DRI_PRIME=1
      FPS ~ 10
            5 while moving
  ==================================
  Testing the pre-SE2017 Linux version
  ----------------------------------
  
  With DRI_PRIME=1
      FPS ~ 60
            50 while moving
  
  Without DRI_PRIME=1
      FPS ~ 28
            10
  ```

- Use Prime. GPU-intensive applications should be rendered on the more powerful discrete card. The command xrandr --setprovideroffloadsink provider sink can be used to make a render offload provider send its output to the sink provider (the provider which has a display connected). The provider and sink identifiers can be numeric (0x7d, 0x56) or a case-sensitive name (Intel, radeon).Example:

  ```bash
  $ xrandr --setprovideroffloadsink radeon Intel
  ```

  You may also use provider index instead of provider name:

  ```bash
  $ xrandr --setprovideroffloadsink 1 0
  ```

  Now, you can use your discrete card for the applications who need it the most (for example games, 3D modellers...) by prepending the `DRI_PRIME=1` environment variable:

  ```bash
  $ DRI_PRIME=1 glxinfo | grep "OpenGL renderer"
  OpenGL renderer string: Gallium 0.4 on AMD TURKS
  ```

  Then we need to launch steam with the `DRI_PRIME=1` parameter:

  ```bash
  $ DRI_PRIME=1 steam
  ```

## References

1. https://steamcommunity.com/sharedfiles/filedetails/?id=1184013727 
2. https://steamcommunity.com/app/221410/discussions/0/828934913344641612/
3. https://wiki.archlinux.org/index.php/CPU_frequency_scaling#cpupower
4. https://www.reddit.com/r/TheTalosPrinciple/comments/dwgbcd/help_playing_the_game/