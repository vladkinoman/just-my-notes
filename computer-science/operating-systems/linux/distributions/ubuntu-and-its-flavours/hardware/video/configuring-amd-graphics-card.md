# Configuring AMD graphics

> I tried to configure my AMD Radeon HD 8750M card on Lubuntu. That was so hard that I could describe that it with the next Russian proverb: "Танцы с бубном" :laughing:

Still, I didn't figure out how to configure my AMD card (Radeon HD 8750M) on the Linux. The problem is that Ubuntu stopped the support for the AMD Catalyst (fglrx) driver [1].  There are a few possible ways to solve this problem:

1. Install the drivers from the open-source PPA repository [2]. I chose the open source way because proprietary isn't working anymore (at least for the updated version of operating system). It might be strange, but this didn't work on my laptop (HP ProBook 450 GO).

2. We can tell Steam to use the second video card by launching it with the next command [3]:

   ```bash
   $ DRI_PRIME=1 steam
   ```

3. If we use the old system such as Ubuntu 14.04 LTS, we can follow the proprietary way from [2] or the next guide from [4]. Some of the packages don't exist under these links, but they can be found on the Internet which, you know, might be difficult :( Also, we might encounter a few bugs such as this one [5].

> Also, we can check  if the second video card works by launching the **radeontop** application.



## Launching Talos Principle on Steam

I tried to run my AMD Radeon card for the game called Talos Principle which was tough even for Windows 8.1. The problem I get was the next message:

> Fatal error: Cannot set display mode.

In order to solve this problem, besides the methods I described above, I found the next from steam community [6]:

1. If the video card doesn't support Vulcan feature, then we should switch to "legacy" version which in our case is Ubuntu 13.04 Legacy.

2. If the video card supports Vulcan feature, which is true in my case, then we should install the next additional libraries (if we need them):

   ```bash
   $ apt install libvulkan1 mesa-vulkan-drivers vulkan-utils  
   ```

## Conclusion

None of the above worked for me. So, I decided to play big video games on Windows 8.1. I will play the small ones on my Linux system which is Lubuntu. Small games are indie games that are no bigger than 1 GB in size, and those we call retro games. I think I'll try emulators for Linux systems.

## References

1. https://linuxsoid.club/canonical-prekraschaet-podderzhku-amd-catalyst-ubuntu-16-04-lts
2. https://linuxconfig.org/how-to-install-the-latest-amd-radeon-drivers-on-ubuntu-18-04-bionic-beaver-linux
3. https://steamcommunity.com/discussions/forum/11/1738841319801401572/
4. https://linustechtips.com/main/topic/246639-installing-catalyst-on-ubuntu/
5. https://askubuntu.com/questions/608567/trying-to-install-amd-proprietary-drivers
6. https://steamcommunity.com/app/257510/discussions/0/1640915206453390199/

