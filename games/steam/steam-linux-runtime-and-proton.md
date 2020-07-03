# Steam Linux Runtime and Proton

Steam Play is a way for Steam users to access Windows, Mac and Linux versions of Steam games with a single purchase.

## Proton

The new and improved Steam Play for Linux is powered by Proton, a modified distribution of WINE that provides compatibility with Windows game titles.

Testing of the entire Steam catalog is ongoing, but for right now, a limited number of Proton-powered titles are supported in the initial beta release.

The announcement, frequently asked questions, and a full list of officially supported games [can be found here](https://steamcommunity.com/games/221410/announcements/detail/1696055855739350561).

> Want to see your favorite Steam game become playable on Linux? [Vote for your favorites using platform wishlisting](https://steamcommunity.com/games/221410/announcements/detail/1475356649450732547).

Proton is *fully* open-source [and available on GitHub](https://github.com/ValveSoftware/Proton/).

> Unofficial resources:
>
> - [Steamplay/Proton/Lutris cheat sheet](https://redd.it/9anque)
> - [Steam Play Compatibility Reports](https://spcr.netlify.com/)

## Steam Linux Runtime

With "Steam Linux Runtime" you can run your <u>Linux</u> games in a container. The reason for doing this is that <u>it will ensure that the game will run the same on every distribution</u>. If a game has bugs on Fedora but runs fine on Ubuntu then you can try the container, it might then run fine in the container on Fedora.

And if distros such as Ubuntu decide to drop 32bit software you can run all your games inside of these containers which do contain all the 32bit software they need, so you can play 32bit games even if you don't have 32bit MESA installed for example.

Besides this Valve could also configure containers on a per-game basis, this way your older Linux games will keep working even on modern systems running incompatible software.

> Check on [protondb.com](protondb.com) to see what other people have done for each game.

> I'm pretty sure steam is getting better at identifying which games are native and don't get proton applied to them. All of my native linux games default to that when you select the option to apply proton to all games in settings. Albeit, half of those games still ran better with proton.
>
> For a little while games would have a really hard time when accidentally selecting proton when they should be ran with it...

For running Windows games in Linux you don't want to use the "Steam Linux Runtime" you want to use "Proton 4.11-9" or just allow Steam Play to choose a version.

> Right. This actually should be included in some kind of Proton FAQ, because a lot of people rely on Steam's default settings, but in this case it just doesn't work. Steam sets Steam Linux Runtime as a default when you have SteamPlay enabled for Windows games, but Windows games don't work with this runtime, you should manually change it to Proton in SteamPlay section.

## Conclusion

**Proton** is great for running non-Linux games. 

**Steam Linux Runtime** could be useful for running old Linux games in a container, it will ensure that the game will run the same on every distribution.

## References

1. https://www.reddit.com/r/SteamPlay/
2. https://www.reddit.com/r/SteamPlay/comments/dxiwlt/whats_the_steam_linux_runtime_option_in_the/
3. https://www.reddit.com/r/SteamPlay/comments/e9ohz5/proton_or_linux_runtime_doesnt_work/