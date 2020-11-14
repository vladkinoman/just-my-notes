# Installing Windows games on Linux

> In this document I work with Lutris, Proton, and Wine utilities.

It is very important that the games are installed on the ext4 file system, otherwise they won't work. However, there are some [tweaks](https://www.reddit.com/r/SteamPlay/comments/aafhcn/steam_proton_doesnt_launch_any_games/) that might help to run them on the NTFS file system:

> For NTFS you'll need something like this: `ntfs-3g defaults,exec,uid=1000,gid=1000 0 2`
>
> > Try changing gid=1000 to gid=100 (users) and see if that helps.
>
> Make sure that you are *not* using the `windows_names` flag.
>
> For ext4, something like `ext4 defaults 0 2` and make sure you give your user permissions for the drive: `sudo chown -R USERNAME:USERNAME /media/mynewdrive`.

## Deus Ex with GMDX mod

- Install Deus Ex with Steam Play. You need to have the option to install any game with Steam Play in the Steam settings.
- Download [GMDX](https://www.moddb.com/mods/gmdx) and install it with [Wine](https://www.winehq.org/). You will have to have Wine installed. Also Wine wouldn't show all my Steam directories to to get around this I copied my Deus Ex folder to my home folder for the install. It is located in /home/yourusername/.steam/steam/steamapps/common. After GMDX installs copy the folder back to it's original location.
- Right click on Deus Ex in your steam library, go to properties and copy this into your launch options:
  INI="..\GMDXv9\System\gmdx.ini" USERINI="..\GMDXv9\System\GMDXUser.ini"

> Works out of the box with Proton 5.0 (not 5.13 where I have flickering).

## GTA III

It works fine with Proton 5.0. You need to press enter a few times after the launch in order to remove black screen.

> I got flickering in Proton 5.13 and unhandled exception in Proton below

Also, I turned Trails off in order to remove the motion blur.

Other tips from [ProtonDB](https://www.protondb.com/app/12100):

> Works fine with Proton. I copied dgvoodoo2 files, enabled d3d8 as native in winecfg and then this game worked as well with DXVK (only some graphical glitches with cars).

> You have to press a button after it launches to get your screen to change to the full screen game (I press space or enter). Sometimes it makes system unresponsive when you choose to quit the game. Tab out and close from your taskbar instead. Otherwise it plays perfectly for me. Mods works as well (Silent Patch, controller support, widescreen fix). https://steamcommunity.com/sharedfiles/filedetails/?id=641839127

> Works very well. Saving the game doesn't work out of the box. You must create a folder called My Documents In (/home/username/.steam/steam/steamapps/compatdata/gameID/pfx/drive_c/users/steamuser

> Game runs flawlessly in 1920x1080. When game launches, wait for screen to blink, then click mouse button twice to start the game. Go to the video settings and change resolution, maximize draw distance and turn frame limiter off. If you are annoyed with the blur effect (it was present in win version), turn trails off. Only issue I found is that you can't save game as the GTA3 want to save it in My Documents which really sucks.

> Runs out of the box. But you should not disable vsync or disable frame limiter, because this may lead to strange effects (e.g. can't drive back when setting in car).

> Works perfectly, just install and play. (use the frame limiter (Optionally with the 60fps frame limiter mod) otherwise all the physics and menu will be broken , but that's a problem that happens on Windows too.

> **You won't have much of a problem unless you're using Wayland**
>
> Launcher:Steam
>
> Customizations:Protontricks
>
> Enabled virtual desktop.
>
> Windowing:Switching
>
> With Wayland/sway, the game freezes as soon as I switched to another workspace. Enabling the virtual desktop fixes this. This is was not an issue with XFCE.
>
> Input:Bounding
>
> With Wayland/sway, the mouse input will sometimes get "bounded", so I can't rotate the camera too much. A single mouse click fixes this.
>
> Make sure to keep the frame limiter on, otherwise you get physics glitches (known bug that affects Windows as well).

> Had to use Protontricks to set up a virtual desktop for the game to start

> Launcher:Steam
>
> Customizations:Custom Proton
>
> Proton-5.9-GE-1-NR from GloriousEggroll [GloriousEggroll](https://github.com/GloriousEggroll/proton-ge-custom/releases)
>
> This custom Proton version enables intro video (no need to skip it)

> Launcher:Steam
>
> Customizations:Custom Proton
>
> 5.11-GE-3-MF [GloriousEggroll](https://github.com/GloriousEggroll/proton-ge-custom/releases)
>
> Audio:Other
>
> Sometimes the voices sound like they come from a tin can
>
> Black screen at start (the intro cutscenes with rockstar logos) can be skipped pressing enter. Using this proton version allowed me to change resolution with no problems.

> **Game runs without issues out of the box.**
> I was also able to install mods like widescreen patch and proper xinput mod. (Used winedlloverrides commands)

## Super Meat Boy

**Issue 1. Can't launch the game.**

**Solution.**

In my case, I had to disable DXVK/VKD3D in Lutris settings.

> DXVK/VKD3D enables support for Direct3D 12 and increase compatibility and performance in Direct3D 11, 10 and 9 applications by translating their calls to Vulkan.

**Issue 2. The audio plays but sometimes sounds distorted/corrupted (in my case, it is music).**

**Solution.**

Install [Faudio](https://github.com/FNA-XNA/FAudio) as an application in the winetricks. After reading [this](https://github.com/flibitijibibo/flibitBounties/issues/4) issue, I thought that it might help me. And it helped! However, I get the next issue.

**Issue 3. After launching the game again, I get this: "Could not create XAudio2 Device".**

**Solution.**

How to fix this? You need to install [Microsoft DirectX End-User Runtimes (June 2010)](https://www.microsoft.com/download/en/details.aspx?id=8109). It seems that if you are running DirectX 9 you will not get this error, but if you are running Windows 7 with the newest DirectX 11 you might get this error when installing games that use the XAudio2 engine.

Or you can just download Directx 2010 framework from Lutris.

To fix the problem, you need to download an installation file from Microsoft from June 2010, it contains a lot of updates to the DirectX 11 package, among them the XAudio2 engine.

For other recommendations see these links: [a nice guide on Reddit](https://www.reddit.com/r/Supermeatboy/comments/6pi80k/tutorial_getting_super_meat_boy_beta_to_work_on/), [a link about Emulation mode](https://appdb.winehq.org/objectManager.php?sClass=version&iId=22177), [a notes about virtual desktop](https://appdb.winehq.org/objectManager.php?sClass=version&iId=22216).

## References

1. https://www.reddit.com/r/SteamPlay/comments/aafhcn/steam_proton_doesnt_launch_any_games/
2. https://www.reddit.com/r/linux_gaming/comments/9mwh26/guide_how_to_install_deus_ex_with_gmdx_and_steam/
3. https://www.protondb.com/app/12100
4. https://github.com/FNA-XNA/FAudio
5. https://github.com/flibitijibibo/flibitBounties/issues/4
6. http://newsandguides.com/solution-how-to-install-xaudio2-and-fix-could-not-find-xaudio2-error-on-windows-7/
7. [Microsoft DirectX End-User Runtimes (June 2010)](https://www.microsoft.com/download/en/details.aspx?id=8109)
8. https://www.reddit.com/r/Supermeatboy/comments/6pi80k/tutorial_getting_super_meat_boy_beta_to_work_on/
9. https://appdb.winehq.org/objectManager.php?sClass=version&iId=22177
10. https://appdb.winehq.org/objectManager.php?sClass=version&iId=22216