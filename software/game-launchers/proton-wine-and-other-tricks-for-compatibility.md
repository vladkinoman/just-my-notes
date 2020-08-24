# Proton, Wine, and other tricks for compatibility

In [this discussion](https://steamcommunity.com/app/221410/discussions/0/2798319091580289893/) people think that Wine is better for gaming than Proton. Proton is the tool that tries to give the full compatibility to all the Windows games without Linux native compatibility, but in most cases it fails (AAA games). So, Wine is better but it is hard to tweak it, because you need to adjust each game individually.

## Customizing Wine prefix in Proton

According to @meheezen:

> Well, you can tweak some things just like you do in WINE, since Proton is pretty much WINE with a few Valve tweaks and content.
>
> I haven't had much issues with it tho, but i don't play that many games (i did have to make some changes to WINE within Proton to get some of them to work tho).

> You can aways create an empty WINE prefix and customize it the way you want instead of using the one Steam creates for you.

> i remember having to do some tweaks to get The Sims 3 to run properly, tho i cannot seem to find the link (will update when i find it), it went something like this:
> 1- copy proton specific files from the wine prefix Steam made for you (there is some files in the pfx directory and a proton directory inside of program files)
> 2- delete the prefix
> 3- create a new one at the same place using wine
> 4- install .Net and other dependencies
> 5- copy/move back the proton specific files
> 6- play
>
> Edit: found it
> https://www.reddit.com/r/linux_gaming/comments/99e0kc/steam_playguide_create_custom_32bit_prefix_to/
>
> you just need to create the syswow64 directory to stop proton from complaining
>
> so delete prefix, create new one with wine, create that syswow64 directory within c:\windows and tweak as you want

## Steamtricks

Steamtricks app available [here](https://github.com/steamtricks/steamtricks) for Ubuntu and similar operating systems.

Also, it is available for OpenSuse [here](https://software.opensuse.org/package/steamtricks).

## Linux steam integration

Linux steam integration app for Solus project can be found [here](https://github.com/solus-project/linux-steam-integration).