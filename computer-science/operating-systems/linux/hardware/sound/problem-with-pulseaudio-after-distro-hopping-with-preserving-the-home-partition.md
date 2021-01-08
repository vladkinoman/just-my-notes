# Problem with PulseAudio after distro-hopping with preserving the home partition

**Issue**

After distrohopping with home preservation I got a strange problem with PulseAudio. The audio itsleft works, but you can't adjust the volume (you can move the slider, but it changes nothing).

You can adjust the volume using `alsamixer` as shown [here](https://support.system76.com/articles/audio/#troubleshooting-alsa).

PulseAudio sits on top of ALSA. I identified that you can't adjust the volume because PulseAudio didn't start. So, you can't kill it with `pulseaudio -k` as stated [here](https://askubuntu.com/questions/201780/how-do-i-debug-issues-with-pulse-audio) (there is also a lot of interesting information about Pulseaudio and 'audio' group here). You can't launch it with `pulseaudio --start` too.

`Pavucontrol` could not work with PulseAudio and took endlessly long to load.

**Solution**

Solution was found [here](https://askubuntu.com/questions/338382/pulseaudio-not-working-home-directory-not-accessible-permission-denied).

> Ok, I got it in the end.
>
> It was a permission problem with my home folder and pulseaudio.
>
> Run the following command to fix the `$HOME` directory permissions for the current `$USER`:
>
> ```
> sudo chown -R $USER:$USER $HOME/
> ```
>
> I used http://www.linuxquestions.org/questions/linux-software-2/problem-with-pulse-audio-834041/ and http://ubuntuforums.org/showthread.php?p=6208727 as sources.
>
> The solution for me was to fix the permissions using the following command: `sudo chown -R lionel:lionel /home/lionel` and then using `pavucontrol` to unmute the output.
>
> The gnome indicator is still greyed but music is back, and that's a good thing.

So, I wrote `sudo chown -R vladkinoman:vladkinoman /home/vladkinoman` and then launched `pavucontrol`. It worked!

**Just in case**

[Volume control not working](https://askubuntu.com/questions/978789/volume-control-not-working):

> At the end, it was [this issue here](https://ubuntuforums.org/showthread.php?t=1924508).
>
> I solved it by this solution mentioned there:
>
> > I think I may have solved the issue. Upon examining /etc/modprobe.d/alsa-base.conf, I noticed that it no longer had the following line.
> >
> > options snd-hda-intel model=auto
> >
> > I re-added this line, saved, rebooted, and everything seems to be working now.

