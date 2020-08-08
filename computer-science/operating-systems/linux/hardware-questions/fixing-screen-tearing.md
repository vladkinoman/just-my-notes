# Fixing screen tearing

## Fixing screen tearing on Linux Mint 20 xfce

How to check if there is a screen tearing on your screen? Just watch [this video](https://www.youtube.com/watch?v=MfL_JkcEFbE) and if you have horizontal lines on your screen then you have a screen tearing.

In order to fix this I found the solution on [this page](https://forums.linuxmint.com/viewtopic.php?f=90&t=282166&start=20):

> All i had to do was first do the updates,then use xfwm4+compositor 

xfwm is the window manager for the Xfce environment. You can find out about its installation and configuration [here](https://wiki.archlinux.org/index.php/Xfwm). I'm interested in the video tearing problem, so I looked into the corresponding section. 

If you experience video tearing, you could try to change the `--vblank` mode option of xfwm (*glx*, *xpresent* or *off*), try it whith this command:

```bash
$ xfwm4 --replace --vblank=glx &
```

in order to save it:

```bash
$ xfconf-query -c xfwm4 -p /general/vblank_mode -s glx
```

If you use Intel graphics and you have already enabled "TearFree" option in Xorg config as described in [Intel graphics#Tearing](https://wiki.archlinux.org/index.php/Intel_graphics#Tearing), then disable *Synchronize drawing to the vertical blank* option.

If this does not fix the tearing, consider disabling Xfwm's compositor and using an alternative [composite manager](https://wiki.archlinux.org/index.php/Composite_manager).

### Solutions of other problems

1. [How to Fix AMD GPU Radeon Screen Tearinsg in Debian, Linux Mint and Ubuntu](https://www.youtube.com/watch?v=WWg8q_f7nI4)
2. [How to Fix Linux screen tearing on Intel graphics](https://www.pcsuggest.com/fix-linux-screen-tearing/)
3. [Intel HD Graphics Diagonal Tear](https://forums.linuxmint.com/viewtopic.php?p=1197801#p1197801)

## References

1. https://www.youtube.com/watch?v=MfL_JkcEFbE
2. https://forums.linuxmint.com/viewtopic.php?f=90&t=282166&start=20
3. https://wiki.archlinux.org/index.php/Xfwm
4. https://www.youtube.com/watch?v=WWg8q_f7nI4
5. https://www.pcsuggest.com/fix-linux-screen-tearing/
6. https://forums.linuxmint.com/viewtopic.php?t=226953