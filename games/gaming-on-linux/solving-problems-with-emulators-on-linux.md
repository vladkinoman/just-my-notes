# Solving problems with emulators on Linux

## PCSX2

The correct way to install the emulator is next:

> Found this information [here](https://wiki.pcsx2.net/Setting_up_Linux_version).

1. Add *one* of the following two repositories:

   - PCSX2 Daily Builds PPA (development version):

     ```bash
     sudo add-apt-repository ppa:pcsx2-team/pcsx2-daily
     ```

   - Gregory's PPA (stable version):

     > I chose this one.

     ```bash
     sudo add-apt-repository ppa:gregory-hainaut/pcsx2.official.ppa
     ```

2. Update repository listings:

   ```bash
   sudo apt-get update
   ```

3. Install PCSX2:

   ```bash
   sudo apt-get install pcsx2
   ```

If you install the emulator from the official website, you will get an older version and will not be able to run it due to various dependency issues. Here are mine:

```bash
vladkinoman@pop-os:~/Games/emulators/PCSX2-1.4.0$ ./PCSX2-linux.sh 
ERROR the plugin (./plugins/libGSdx-1.0.0.so) miss some dependencies
    	libpng12.so.0 => not found

ERROR the plugin (./plugins/libspu2x-2.0.0.so) miss some dependencies
    	libSoundTouch.so.0 => not found
	libwx_gtk2u_core-3.0.so.0 => not found
	libwx_gtk2u_adv-3.0.so.0 => not found

ERROR the plugin (./plugins/libGSdx-avx2-1.0.0.so) miss some dependencies
    	libpng12.so.0 => not found

ERROR the plugin (./plugins/libGSdx-intel-sse4-1.0.0.so) miss some dependencies
    	libpng12.so.0 => not found

./PCSX2: error while loading shared libraries: libwx_gtk2u_core-3.0.so.0: cannot open shared object file: No such file or directory
```

I have already solved a few of them by installing these packages:

> Found info on [this](https://github.com/PCSX2/pcsx2/issues) GitHub wiki page. Don't forget to enable 32-bit libraries
>
> ```bash
> sudo dpkg --add-architecture i386
> ```
>
> and build system after that
>
> ```bash
> sudo apt install cmake gcc-multilib g++-multilib
> ```

``` bash
sudo apt install libaio-dev:i386 libbz2-dev:i386 libcggl:i386 libegl1-mesa-dev:i386 libglew-dev:i386 libgles2-mesa-dev:i386 libgtk2.0-dev:i386 libjpeg-dev:i386 libsdl1.2-dev:i386 libwxgtk3.0-gtk3-dev:i386 nvidia-cg-toolkit zlib1g-dev:i386 libsdl2-dev:i386 libjack-jackd2-dev:i386 libportaudiocpp0:i386 portaudio19-dev:i386 liblzma-dev:i386 libsoundtouch-dev:i386 libxml2-dev:i386 libpcap0.8-dev:i386
```

However, I couldn't install `libglew-dev:i386` package. It wasn't available in the repos. Plus, I got strange dependency issue:

```bash
The following packages have unmet dependencies: libc6-dev:i386 : Depends: linux-libc-dev:i386 but it is not going to be installed
```

Found a solution to a similar problem [here](https://askubuntu.com/questions/636236/cant-solve-unmet-dependencies). Comment from that discussion:

> I think you are affected by an already [reported](https://bugs.launchpad.net/ubuntu/+source/eglibc/+bug/1365375) bug in `libc6-dev`. There seems to be no fix provided, but one workaround (provided in Comment #4 and possibly #5 also) is to remove that package completely by:
>
> ```bash
> sudo apt-get purge libc6-dev-amd64
> sudo apt-get autoremove
> sudo apt-get clean
> sudo apt-get install -f
> ```
>
> You can also see [sudo apt-get -f install fails](https://askubuntu.com/questions/580232/sudo-apt-get-f-install-fails) post

I replaced libc6-dev-amd64 with libc6-dev:i386. It helped. I understand it was the so-called [Dependency Hell](https://www.wikiwand.com/en/Dependency_hell).

Okay, what should I do if I want to use downloaded version of the emulator? How to solve those issues?

Here is a [recommendation](https://askubuntu.com/questions/895897/error-while-loading-shared-libraries-libpng12-so-0) to solve the problem with libpng12.so.0. And [there](https://forums.pcsx2.net/Thread-Ubuntu-20-04-missing-Dependencies) was a recommendation to install the appropriate AppImage.

**In either case, it will be more convenient to install PCSX2 using the PPA as shown above.**