# AMD or Nvidia for Linux

In a oversimplified way its about AMD more open and friendly approach to open source (drivers, etc.) meanwhile the rest (Nvidia) as "right now" are semi-open source and still holding bits, so its much more easy to compile good open source drivers and make all smooth with AMD's rather than with NVidia when you don't have free open access to all bits and the Nvidia "official" drivers still very a afterthought/low bar "minimum threshold".

Short version: Nvidia still resist the concept of FULL OPEN SOURCE...... that's a point of friction and why Linux calls out Nvidia over and over again. So its about the Company stance at fault and not about the hardware capacity to run at all. 

>  You cant make an specific cake if someone gives all the basic ingredients but keeps back the 2 ingredients that makes the whole cake look and taste great ^^ sorry.... if its a bad analogy lol

Because of the reasons above, AMD runs better on Linux. "better" doesn't mean it's perfect. The new cards still have issues (not like that's Linux exclusive. The people over at Windows land also have a lot of problems with the drivers for the newer cards), so you'll have better stability with older architectures.

> I hear the new Navi architecture GPUs are working fine now, but they weren't until some months ago. The Polaris cards (my RX 580 is here) are working fine, tho. Never had any issues with my 580 and in over 6 months using it, I never had to fix anything or do any tinkering..

Nvidia is hit or miss. Either it works out of the box for you, or it does not. Most distributions don't ship closed source drivers as a rule. (Pop OS is the main exception here). Some distributions make installing the Nvidia drivers somewhat easy, and the experience with nouveau (the volunteer-based open source drivers) sometimes work good enough to get a usable desktop (with no gaming, no gpu compute, etc). 

> Pop OS has a version with Nvidia graphics baked in so to speak.

Some people say that Nvidia give them some weird graphical glitches after waking from suspend. Fractional scaling is borked, there's no wayland support, and you get rendering issues with certain software that causes it to crash. Someone always had to deal with screen tearing, dxvk issues and driver problems. Ironically, gaming might be great. Sometimes you need to download the drivers from the Nvidia website and compile them at his PC, because the ones in the repos didn't work

## Advice on installing

AMD gpu auto install when you install operating system and AMD gpu open source driver works best.

Nvidia open source driver have issues , for Nvidia proprietary driver work fine/

```bash
sudo apt-cache search nvidia | grep "nvidia"
```

Search with command and install latest. Then from list install latest or downliad latest driver from nvidia website.

>  yes nvidia gpu have some issues in linux.
>
> amd works out of box and don't require any installation

In order to remove the Nvidia software and libraries (though not strictly necessary).

```bash
apt-get remove 'nvidia*'
apt-get autoremove
```

> I just bought a AMD RX5700XT (ASUS) and installed it last weekend.
>
> I'm playing games in 4k at max settings no problem. e.g. Rust and Black Mesa are my two most recent played games.
>
> I didn't have to change anything on my system since the drivers are built in.
>
> To be fair my old nVidia card could barely handle 1080p. The performance of the AMD card is awesome.

## References

1. https://www.reddit.com/r/linuxquestions/comments/htt1rt/is_amd_better_for_linux/