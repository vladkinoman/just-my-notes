# Troubleshooting Fedora

## Fedora 35

**Issue 1**. Laggy video playback in Firefox (Twitter mostly).

**Solution**.

> It turns out the solution was to  install ffmpeg-libs, that same as I did to make video playback work on  Fedora 33. In order to do this you have enable the RPM-fusion free repo:
>
> ```bash
> sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
> ```
>
> And then you can install the package:
>
> ```bash
> sudo dnf install ffmpeg-libs
> ```

**Issue 2**. Picture in Picture is not retained when you go to another page.

**Solution** (kinda). 

> That's a [Wayland](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/Wayland/) limitation, you need to right-click on the window and manually toggle Always on Top.

**Issue 3**. How to remove the "Add World Clock" in the notification area?

**Solution**. See the references.

**Issue 4**. Enable the discrete graphics as it was mentioned [here](https://github.com/ValveSoftware/Proton/wiki/For-AMD-users-having-issues-with-non-OpenGL-games). I have to do this on every Linux distribution, but things got trickier on Fedora. Somehow you need to update grub when there is no `update-grub`.

**Solution**. The easiest way (and recommended one) to do this is to use grubby:

```bash
grubby --update-kernel=ALL --args="radeon.si_support=0 amdgpu.si_support=1"
```

It can also be done manually in this way:

1. Open `/etc/default/grub`
2. Add those arguments to the GRUB_CMDLINE_LINUX variable.
3. Update grub on a system using legacy BIOS boot (for UEFI see [this](https://ask.fedoraproject.org/t/grub-menu-not-showing/14555/6) answer): 
   `sudo grub2-mkconfig -o /etc/grub2.cfg`

**Issue 5**. Grub menu looks like a bunch of pixels.

**Solution**. What helped me: change the variable of `GRUB_TERMINAL_OUTPUT` from "console" to "gfxterm".

Other tips: [this](https://unix.stackexchange.com/questions/205565/cant-see-grub-menu-on-boot) and [this](https://www.reddit.com/r/Fedora/comments/edq8xu/how_to_change_grub_resolution_f31/).

**Issue 6**. Grub menu isn't visible at all.

**Solution**. Fedora actually skips it for fast booting. If you need it, you can hold down SHIFT when starting your computer.

Other tips: [this](https://ask.fedoraproject.org/t/grub-menu-not-showing/14555/5) and [this](https://ask.fedoraproject.org/t/unset-menu-auto-hide-is-how-to-force-grub2-boot-menu-visibility-on-every-boot-for-kernel-parameters/14388).

**Issue 7**. TF2: Failed to create decoder for MP3 or, to put it simply, half of the sounds don't work.

**Solution**. 

> This is a long standing issue between libMiles and selinux which can be worked around by running `setsebool -P selinuxuser_execheap 1`.

## References

1. [Laggy video playback in Firefox](https://ask.fedoraproject.org/t/fedora-34-laggy-video-playback-in-firefox/13130)
2. https://www.reddit.com/r/firefox/comments/nbmmof/picture_in_picture_does_not_work_in_fedora_34/
3. [How to remove the "Add World Clock" in the notification area?](https://askubuntu.com/questions/1341350/how-to-remove-the-add-world-clock-in-the-notification-area)
4. https://unix.stackexchange.com/questions/557841/what-is-the-correct-way-to-handle-default-kernelopts-in-fedora-31
5. https://ask.fedoraproject.org/t/grub-menu-not-showing/14555/
6. https://unix.stackexchange.com/questions/205565/cant-see-grub-menu-on-boot
7. https://ask.fedoraproject.org/t/unset-menu-auto-hide-is-how-to-force-grub2-boot-menu-visibility-on-every-boot-for-kernel-parameters/14388
8. https://www.reddit.com/r/Fedora/comments/edq8xu/how_to_change_grub_resolution_f31/
9. https://github.com/ValveSoftware/Source-1-Games/issues/3227