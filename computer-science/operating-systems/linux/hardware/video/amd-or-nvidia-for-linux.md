# AMD or Nvidia for Linux

> Honestly, I feel like the Amd vs Nvidia confrontation is going like 60/40 respectively.

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

## Opinions from people

> 431:
>
> OP:
>
> Since I built this PC on 2013, I've been using a 660 GTX NVIDIA card. It was a good card back in the day, nowadays a bit outdated, but it is still working and I didn't need a more powerful card for my gaming needs. What I needed, on the other hand, was to get rid of the NVIDIA driver, which has been working awfully with my linux system for years - and more so recently.
>
> This week I finally got a 5500 XT AMD card. After all the comments I've read about AMD graphics being the better option, I really was expecting things to improve. And oh yeah, they did. I couldn't be happier!
>
> Here's a list of issues I had with NVIDIA, which a I don't have anymore after switching to AMD (some of them I didn't even know there were due to NVIDIA lol):
>
> - No screen tearing. I've been trying to solve the screen tearing with NVIDIA drivers for years, but no workaround worked for me. It was a delight to see that AMD drivers simply didn't have any screen tearing out of the box.
> - Resolution on terminal mode is the native monitor resolution. I didn't even know this was possible.
> - OpenGL compositor doesn't crash after a while (Plasma/Kwin). I can finally turn on composition without fear.
> - My second monitor resolution (connected via VGA-to-DVI adapter) is recognized right. With NVIDIA, I had to manually add the values to a Xorg configuration file (it worked with nouveau tho, but see below).
> - Steam's Big Picture menu doesn't flash to black while on Remote Play.
> - Recently, the system froze randomly - usually while playing or streaming. This surely was due to NVIDIA, because it didn't happen to me since I changed the card.
> - I can just use LIBRE drivers, which I'm proud of. Every time I tried to use nouveau, my system froze. Additionally, I saved some space uninstalling the propietary driver.
> - Overall the system is more responsive and loads faster (although this can also be due to the graphics card just being better - I transitioned from a 2GB VRAM graphics card to a 8 GB VRAM one...).

Comments:

> 99: You are partially right about LIBRE drivers, amdgpu is open sourced in kernel but it will not work without closed source firmware loaded at boot time.
>
> > 46: Interesting, I didn't know about this. Thank you for the information. Still better than before I guess...
> >
> > > 13: It's best we have, even <u>CPUs have closed firmware now</u>, sadly. But on the bright side, you basically just liberated your kernel driver, direct rendering library and OpenGL/Vulkan implementations. Welcome!
> >
> > > 5: If you want a gaming GPU with open source firmware your best bet is a pre-Maxwell NVIDIA card (like your old one) using Nouveau as graphics driver. Why? Because, at least from what I understand, the Nouveau people wrote their own bloody firmware out of necessity. As of Maxwell v2 they couldn't do that any more due to the GPUs requiring signed firmware. AMD GPUs require this as well so making your own firmware isn't really an option.
> > >
> > > That said, I wouldn't get too worked up about firmware. Firmware runs on the GPU, not your CPU.
> > >
> > > > 3: OP: Like I said in one of the points, sadly nouveau was unusable (secured system freeze). I will keep my old card anyway, but I don't expect any improvements from noveau at this point, they are more focused on the little work they can do on newer generations.
> > > >
> > > > > 2: Yeah, my point wasn't that you should use Nouveau, but rather that open source GPU firmware isn't really a viable option due to the current circumstances.
>
> > 25: The list of computers that are "respects your freedom" certified is VERY small:
> >
> > https://ryf.fsf.org/products
> >
> > Basically no modern computers that can even be described as midrange can be used without closed source firmware unfortunately
> >
> > > 2: Let's hope the Pinebook Pro is a decent workhorse when it gets the RK3588 upgrade that is planned
>
> > 5: Doesn't that just make the driver itself FLOSS but the firmware proprietary/closed source?

---

**Pinebook Pro. A Powerful, Metal and Open Source ARM 64-Bit Laptop for Work, School or Fun**

The Pinebook Pro is meant to deliver solid day-to-day Linux or *BSD experience and to be a compelling alternative to mid-ranged Chromebooks that people convert into Linux laptops. In contrast to most mid-ranged Chromebooks however, the Pinebook Pro comes with an IPS 1080p 14″ LCD panel, a premium magnesium alloy shell, 64/128GB of eMMC storage* (more on this later – see asterisk below), a 10,000 mAh capacity battery and the modularity / hackability that only an open source project can deliver – such as the unpopulated PCIe m.2 NVMe slot (an optional feature which requires an optional adapter). The USB-C port on the Pinebook Pro, apart from being able to transmit data and charge the unit, is also capable of digital video output up-to 4K at 60hz.

![Pinebook Pro](https://www.pine64.org/wp-content/uploads/2020/02/pbp1.png)

##### SPECIFICATIONS

- Rockchip RK3399 SOC with Mali T860 MP4 GPU
- 4GB LPDDR4 RAM
- 1080p IPS Panel
- Magnesium Alloy Shell body
- Bootable Micro SD Slot
- 64GB of eMMC (Upgradable)
- PCIe x4 to m.2 NVMe SSD Slot (requires optional adapter)
- SPI Flash 128Mbit
- HD Digital Video Out via USB-C
- USB 2.0 Host
- USB 3.0 Host
- USB-C (Data, Power and Video out)
- Lithium Polymer Battery (10000mAH)
- Stereo Speakers
- WiFi 802.11 AC + Bluetooth 5.0
- Headphone Jack
- Microphone
- Front-Facing Camera (1080p)
- ISO & ANSI Keyboard Variants
- Privacy Switches for Camera, Microphones and BT/WiFi
- Large Trackpad
- UART Access via Audio Jack
- Barrel Power (5V 3A) Port

---

> 84: I've been using Nvidia with Linux for years and had no issues at all, I used to use a 1070 in a desktop but since march I've been using a laptop with a 1660 hybrid.
>
> Are there certain Nvidia GPUs that have these issues? Because I've seen a lot of people complaining about Nvidia on Linux and I've always been confused by them
>
> > 43: Honestly, no, the biggest problem with the Nvidia drivers is occasionally they have issues with the latest kernel versions. They used to be horrendous if you had hybrid laptops, worse depending on the style of hybrid they had. Nvidia finally fixed that last year to make it much more friendly. The issues today with Nvidia is that they have their own render pipeline for Wayland, and it isn't anywhere near as well supported. (EGLStreams) Nvidia also has day 1 support for their new cards on Linux.
> >
> > AMD has the drivers in the Mesa and kernel, but that isn't the whole story there. <u>You need a firmware blob for them to work, so there is still a huge chunk of closed source.</u> However, it's the same firmware as Windows, so the support is always there on the new kernel builds and such. Downside is that AMD is much worse about supporting their newest hardware on non-Windows.
> >
> > That aside, if you want ML, you need CUDA today, so you need Nvidia for that case. AMD isn't a real option.
> >
> > The *only* issue that I've had with Nvidia on Linux has been with Thunderbolt eGPU support. Render offload was pretty sketchy. I swapped for an AMD card when the 5700XT came out because that was working much better. Today it doesn't seem like it would matter. On the other side, my dual boot laptop just had to get reinstalled because the AMD drivers trashed Windows and the only way to fix the way their drivers failed was to format and reinstall. Not a Linux problem, but I'd like both OSes to actually work without randomly getting trashed. Was sad to find out the ATI horrible Windows driver quality legacy is still alive. :(
> >
> > > 12: The part about Wayland explains a bit, I'm one of the people that won't switch to Wayland until it's well enough supported that xorg is no longer the default/standard.
> > >
> > > Also, in response to your comment about the amd drivers on Windows and Windows getting trashed, firstly the amd drivers on Windows are the main reason I switched to Nvidia years ago. Secondly, I've currently got a Windows dual boot going and I've found that every few hours I have to reboot because things stop responding but I can run Windows for a week without any issues.
> > >
> > > And a tip that I've learned when dual booting, if you've got a uefi system, install refind bootloader then when reinstalling either Windows or Linux, make sure to only touch the partitions for that os (and never format the efi partition), and finally once one has reinstalled, go in the uefi and make sure it's still set to boot to refind. Refind scans every disk for kernels/bootloader when it starts so you never have to worry about menu entries
>
> > 6: All nvidia cards have minor issues, because nvidia has given the community the finger on many occasions and doesn't support basic standards. The question is whether you're doing something complex enough for the nvidia driver to get in the way, and if it's anything beyond single monitor Xorg on desktop, the answer is probably yes.
> >
> > > 12: 
> > > Over the years I've switched from 2 monitors to 3 monitors and now to a laptop screen with an ultrawide monitor. As I said, I've never had an issue.
> > >
> > > What kind of setups are known to cause issues?
> > >
> > > > 5: On KDE at least, different refresh rate monitors will not be a good time and if you are used to using Wayland then that's a no-go for Nvidia. X11 is far from unusable but there are still a lot of annoyances.
> > > >
> > > > Also, on Pascal cards, VK3D suffers from performance issues and it seems like the devs can't do much to improve it because I believe the documentation is a mess. Not 100% what the exact cause is.
> > > >
> > > > > 7: Interesting, so it sounds like I've just been lucky in the hardware I've used and the fact that I'm avoiding Wayland until it's stable enough to be the default for everyone
> > > > >
> > > > > > 2: They already have some work underway. Wayland works almost 90% on nvidia with the blob (tried few weeks back).
>
> > -1: OP: I'm not sure, but after this card I wouldn't risk to buy NVIDIA again.
> >
> > For reference, the Archwiki page for NVIDIA has a separated page only for troubleshooting: https://wiki.archlinux.org/index.php/NVIDIA/Troubleshooting, while the AMD one only have a section: https://wiki.archlinux.org/index.php/ATI#Troubleshooting
> >
> > > 15: I can understand how bad experiences would put you off Nvidia, and as I said, I've heard loads of people say they've had issues, so I definitely believe that's the case, I'm just confused because I've personally never had an issue.
> > >
> > > On a separate note, I actually choose to use intel and Nvidia setups years ago when I had really bad experiences with 3 generations of amd machines (2 desktops and a laptop, all with AMD CPU and GPU), so I guess anyone can have bad experiences with anything and decide to switch
> > >
> > > > 3 (seewie): At least with <u>KDE</u> the overall experience is much worse. Bugs that you only have with them and the desktop can't even be rendered in a stable FPS.

> 67: I ditched Nvidia after they updated gfe to force me to sign in and give away metrics and have an active internet connection in order to control shadowplay. Fuck nvidia.
>
> Then I moved to linux where Amd just seems to work better all around and its been great since.
>
> > 14: lol I was confused when I first booted into w10 for a game, since I didn't recall having to log into nvidia to install drivers on gfe.
> >
> > > 4: Yup, and just for the record, I'm not completely against GFE, it's a neat idea and could help a lot of newbies extract the most from their gaming experience, but the entire thing should be optional opt-in, NOT "use this, give us this data, maintain an active connection OR you will not be able to use hardware features that you paid for".
> > >
> > > Like I don't even think Apple pulls this kind of bullshit off. And so many "PC enthusiasts" don't even give a shit. It's like they forgot that the P in PC stands for PERSONAL. And so much of Windows/Nvidia is antithetical to this.

> 34: As someone who is looking to do the same transition, thanks for the writeup. I used to defend Nvidia and roll my eyes over the "The AMD way or no way" type of people. That was until I got the taste of what <u>KDE</u> looks and feels like through Mesa drivers on my 7 year old laptop. It was like a completely different experience on a system that was greatly inferior to my PC's specs. Suddenly all those things that I thought were just "Linux problems" turned out to be Nvidia problems.
>
> > 7: OP: I was very hesitant about switching, because back in 2013 it seemed like the only option was NVIDIA, and I've grown used to it. However, as I already experienced, now it is the other way around. I was just getting a very inferior experience compared to now. I'm sure this was a good decision.
> >
> > > 4: I was in the same boat. My friends laughed at me when I said I was gonna try Ubuntu out with my beloved HD 6850. Spent what little money I had to get a 970. I ended up going to Windows for a few years and upgraded to a 1080ti before switching back to Linux. Now I get asked what I was expecting when I report Nvidia Linux issues. Such is technology I guess!
>
> > 15 (seewie): 
> >
> > > That was until I got the taste of what KDE looks and feels like through Mesa drivers on my 7 year old laptop. It was like a completely different experience on a system that was greatly inferior to my PC's specs.
> >
> > Many NV fanboys still deny this, even after you let them do some test, and they see the frame drops for themselves... If you use an NV card, you do not have a smooth KDE experience.
> >
> > > 12: Honestly, I very much dislike calling people fanboys because someone's experience is better than ours. I've seen lots of Nvidia users on setups that aren't multi refresh rate or they use nouveau where they are totally fine with the performance. Different hardware can have different performances even on the same DE. Name calling just turns this into another tribal mentality split and doesn't really benefit discussion about the pros/cons of hardware.
> >
> > > 8: I have 4 PCs at home, 1 with an NVidia and 3 with Intel iGPU (mesa). There's little to no difference. All of them run Neon. Dunno where you get that.

> 21: AMD pros:
>
> - Generally better price / perf for 1080p and 1440p
> - Linux driver is better
>
> Nvidia Pros:
>
> - CUDA Support. Nvidia built up a whole ecosystem around CUDA. AMD is sorely lacking
> - DLSS / RT are really nice for 1440p / 4k.
>
> > 16: 
> >
> > > Generally better price / perf
> >
> > Untrue in some countries, including mine. Which is one of the greatest factor why I've been holding back to switch.
>
> > 4: DLSS maybe, on games that support it.
> >
> > Good luck getting playable framerates with 4k AND RT.

> 13: Resolution on terminal mode is the native monitor resolution. I didn't even know this was possible.
>
> This is possible with Nvidia if you add the nvidia driver to your initramfs. Most distros don't bother with it though.

> 9: I just bought my first Nvidia card in 15 years last month, and as a long time AMD user here's the things I noticed:
>
> I'm on gentoo, so I had to recompile lots of stuff to work with NVIDIA as opposed to amd. This isn't really a complaint and was 100% expcected since I didn't compile nvidia support into anything. Took a bit of trial and error to figure out what packages and settings I needed, as well as blacklisting the noveau driver to get stuff running properly.
>
> The driver itself works well when it's installed, but a few games have had trouble realizing what card I've got. maybe because it's so new, and the games are so old, but at least one of them set all my settings to lowest possible because it thought I had a new potato.
>
> The driver is a bit annoying because I need to recompile it specifically for the kernel I'm on every time a new version comes out, and sometimes it will compile itself against one of the older versions randomly, forcing me to manually tell it which one to compile against. Since I'm using the unstable repo, I'm waiting for there to be some big incompatibility I need to worry about, but I don't think there's been enough time yet.
>
> Because the drivers also come with their own userspace and don't go through mesa, I had to give up on my bedrock linux install, since it means that I need to keep every distro involved on the exact same driver version, and that's a big hassle.
>
> All in all, so far no major problems, just a few minor inconveniences, all of which were completely expected.
>
> > 5: People complaining they need to compile something in Linux?
> >
> > > 6: I use gentoo, if I am going to complain about compiling, I'm using the wrong distro.
> > >
> > > I expected to recompile a lot of things when I first installed it, since all my use flags were set to amdgpu, and disabled nvidia. My issue was needing to compile manually sometimes when I update, since the scripts don't always detect the kernel version properly. It's probably more a problem with the nvidia-driver ebuild than with the drivers themselves. Haven't looked into it to see what the issue is yet to say for sure.

> 7: Are you comparing a 8 years old card with a 1 year old one ?
>
> > 7: OP: Not performance-wise. I know my new card is much more powerful. But my old card should be powerful enough not to crash the fucking compositor every so often.

## References

1. https://www.reddit.com/r/linuxquestions/comments/htt1rt/is_amd_better_for_linux/
2. https://www.reddit.com/r/linux_gaming/comments/kun8xi/i_finally_got_rid_of_nvidia_best_decision_i_could
3. https://www.pine64.org/pinebook-pro/