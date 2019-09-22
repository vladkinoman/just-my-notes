# Sound improvement on Linux Ubuntu 18.04

If you are switched to Linux from Windows you will feel some of the Linux features is much worse than the Windows. One of the best example is sound.

Music is so much better in the Windows OS because of drivers (companies provide their own drivers for specific OS and computers). In Linux the music sounds like from a can. There is no advanced sound panel to tweak, or is it?

The only way to improve it is to configure one file. Open the `~/.config/pulse/daemon.conf` file and add or modify below options:

```
default-sample-format = float32le
default-sample-rate = 48000
alternate-sample-rate = 44100
default-sample-channels = 2
default-channel-map = front-left,front-right
default-fragments = 2
default-fragment-size-msec = 125
resample-method = soxr-vhq
enable-lfe-remixing = no
high-priority = yes
nice-level = -11
realtime-scheduling = yes
realtime-priority = 9
rlimit-rtprio = 9
daemonize = no
```

> Or you can directly modify `/etc/pulse/daemon.conf`. Although be careful and have a backup of original configuration to restore if you messed it up.

That's it!

## Links

1. [Enable High Quality Audio on Linux](https://medium.com/@gamunu/enable-high-quality-audio-on-linux-6f16f3fe7e1f)