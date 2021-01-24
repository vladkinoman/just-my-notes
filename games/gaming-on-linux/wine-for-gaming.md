# Wine for gaming

## Why are my games so slow through Wine?

> [Source](https://askubuntu.com/questions/313670/why-are-my-games-so-slow-through-wine).

Any kind of emulation layer, and Wine *is* an emulation layer despite what people say the name stands for these days, has the potential to degrade performance.

In particular, DirectX is a big and complicated beast and providing an entire emulating API for it adds a huge amount of weight, so any 3D game is going to suffer greatly under Wine. Subroutines that are hardware-accelerated in Windows may be emulated in software under Wine, or they may be hardware-accelerated but in a different, and less efficient way. The bottom line is a lot of the time you will get severely degraded performance.

Wine is a great exercise in providing API compatibility for Windows applications, and should be admired for the success it has had in doing so, but one should never expect anything to perform as it would in Windows itself.

Note: some decent games *are* natively available for Linux, through Steam or otherwise, and should run well enough on Linux. What won't run as well are games released exclusively for Windows, particularly if they use DirectX which will be the heavier, slower emulation on Wine.

> It is worth noting that games using a lot of D3D shaders can be boosted on nVidia hardware by `winetricks glsl-disable` [source](http://wiki.winehq.org/Performance).

---

The issue with 3D performance is usually related to the poor/wrong driver, be it Windows or Linux. If you have a generic driver under Windows, you can't do much about 3D performance. If you have the right driver under Linux, 3D performance is at least as good as it would be in Windows with a good/right driver.

> ELF programs in Linux are also "emulated" in a similar way that exe programs are.

What Wine does is provide the execution platform for Windows programs under *nix. It does not emulate Windows OS, but rather translates OS API calls to *nix equivalents.

One detail though, if you run Windows x86 (32 bit) programs on an x64 Linux, you need 32bit video drivers too! Otherwise, a generic driver is used or some sort of software translation to the x64 driver takes place (not sure), which is bad for performance.

From my experience, some old games for Windows (XP) run better under Linux than under Windows 10 (eg. Half-Life), with fewer crashes. Since kernel 4.10 I don't remember any issues with video drivers on nVidia and Intel GPUs.

nVidia tends to have better drivers for Windows than for Linux though (remember why Linus Torvald showed the middle finger to nVidia?). There is an open source version of nVidia drivers called "[nouveau](https://nouveau.freedesktop.org/wiki/)", created through reverse engineering. It might be slightly slower than the proprietary one, but it has decent performance and stability.

## How to Enable Antialiasing in Wine

> [Source](https://thepcspy.com/read/how-to-enable-antialiasing-in-wine/). This information is pretty old. So, I don't think you should do this with the new versions of Wine. TODO: find out.

Wine, for those of you that haven’t made the transition yet, is a compatibility layer that allows you to run Windows software on non-Windows systems. This is great for games as it provides near-native performance without having to dual-boot.

Antialiasing (AA) is a subpixel hinting method that, effectively, smooths off lines and attempts to blend them into their background. This makes lines much seem much sharper and contributes heavily to the overall picture quality.

The technology that allows this has existed in consumer technology for approaching a decade now but by default, Wine disables AA. This is because it adds another layer of complexity to an already strenuous process (providing Windows-identical interfaces to applications). **Enabling it can cause some games to just not work.** So this might not be for everybody.

To enable AA:

1. Run `regedit` or `wine regedit` to load Wine’s version of.. erm.. Regedit!
2. Navigate to `HKEY_CURRENT_USER/Software/Wine/Direct3D`. If any of those layers don’t exist yet, create them as you go.
3. From within `Direct3D`, create a new `String` value. Call it `Multisampling` and set its value to `enabled`. All these values are case sensitive.

To disable it, just repeat the first two steps and then change `Multisampling` to anything but `enabled` or delete the key.

## Switching prefixes

[How do I create a 32-bit Wine prefix?](https://askubuntu.com/questions/177192/how-do-i-create-a-32-bit-wine-prefix)

To create a 32-bit WINE prefix on a 64-bit Ubuntu system, you need to open a terminal and run the following command:

```bash
WINEPREFIX="$HOME/prefix32" WINEARCH=win32 wine wineboot
```

- Where `WINEPREFIX` is the directory for the prefix
- **This directory must not already exist or you will [get an error!](http://bugs.winehq.org/show_bug.cgi?id=29661)** Please do not manually create it in Nautilus or with *mkdir*./

[Trying to switch to 32-bit Wineprefix from 64-bit Wine 1.6.2](https://askubuntu.com/questions/514931/trying-to-switch-to-32-bit-wineprefix-from-64-bit-wine-1-6-2-trusty-14-04).

Create a 32-bit Windows wine prefix:

```bash
env WINEPREFIX=$HOME/.wine32 WINEARCH=win32 winecfg
```

(or `win64` as winearch)

Usage of prefix - with env:

```bash
env WINEPREFIX=$HOME/.wine32 command arguments[...]
```

command is like `wine setup.exe`.

For more info, see `man env`.

`$HOME/.wine32` is your prefix name (actually, `/home/username/.wine32`) and you have to specify it always to use it.

Default WINEPREFIX is ~/.wine, you can re-create it by removing (with any changes): **unrecommended**

```bash
rm -R ~/.wine
```

You cannot change architecture of a prefix without re-creation in future. For different games I recommend a separate wine prefix (or for different game clients like EA Origin)

> I don't advise removing ~/.wine - because Wine actually recommends keeping both prefixes - one for 64bit apps, and one for 32bit apps that won't run in the 64bit prefix.

## Best policy to install game: one prefix - one game or all games - one prefix

> [Source](https://forums.lutris.net/t/best-policy-to-install-game-with-external-launchers-i-e-epic-rockstar/9355).

<u>One for each game.</u>

The reason behind this is this: every game, or game engine, has its own specific needs in terms of installed libraries. Chances are that when one game runs fine but another doesn’t and you fix the other by installing a winetrick/protontrick, you break the first one.

This issue has become less of a problem with the current releases of Wine/Proton since those are now very rich on features.

**A bit of history**
In the times before Proton the standard operation procedure was to go to the winehq site, find the game, read the experiences of other users, install the recommended Wine version and winetricks manually and then pray for it to work.

**TL;DR**
So you could certainly try to run all Epic games from one Wine/Proton bottle but when you run into issues I recommend keeping this piece of history in mind. The original goal of a Wine bottle was to make one specific Windows program work.

Even Wine Steam game installs automatically into their own wine prefix, and each game in the native Steam app that uses proton also automatically ends up in it’s own prefix.

## Third-party issues I encountered while using Wine

**Issue**. 

> Attempted to read or write protected memory. This is often an indication that other memory is corrupt.

> [Source](https://stackoverflow.com/questions/4074585/attempted-to-read-or-write-protected-memory-this-is-often-an-indication-that-ot).

**Solution** (likely path to solution).

> I have just faced this issue in VS 2013 .NET 4.5 with a MapInfo DLL. Turns out, the problem was that I changed the Platform for Build from x86 to Any CPU and that was enough to trigger this error. Changing it back to x86 did the trick. Might help someone.

So, it looks like you need to switch the prefix arch as shown above. 