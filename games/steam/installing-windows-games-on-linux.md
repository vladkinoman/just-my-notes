# Installing Windows games on Linux

## How to install Deus Ex with GMDX mod and Steam Play

- Install Deus Ex with Steam Play. You need to have the option to install any game with Steam Play in the Steam settings.
- Download [GMDX](https://www.moddb.com/mods/gmdx) and install it with [Wine](https://www.winehq.org/). You will have to have Wine installed. Also Wine wouldn't show all my Steam directories to to get around this I copied my Deus Ex folder to my home folder for the install. It is located in /home/yourusername/.steam/steam/steamapps/common. After GMDX installs copy the folder back to it's original location.

- Right click on Deus Ex in your steam library, go to properties and copy this into your launch options:
  INI="..\GMDXv9\System\gmdx.ini" USERINI="..\GMDXv9\System\GMDXUser.ini"

## References

1. https://www.reddit.com/r/linux_gaming/comments/9mwh26/guide_how_to_install_deus_ex_with_gmdx_and_steam/