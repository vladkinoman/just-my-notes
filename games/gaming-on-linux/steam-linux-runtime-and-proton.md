# Steam Linux Runtime and Proton

Steam Play is a way for Steam users to access Windows, Mac and Linux versions of Steam games with a single purchase.

## Why Valve created Steam on Linux

[According to the user from SteamCommunity](https://steamcommunity.com/app/221410/discussions/0/2798319091580289893/?ctp=5#comment_1742227264188486785):

> Originally posted by **[Triple_Agent_AAA](https://steamcommunity.com/app/221410/discussions/0/2798319091580289893/?ctp=5#c1742227264188352775)**:
>
> Linux native gaming was going nowhere for real, I believe, so we cannot blame **Valve** for naming it. On the other hand, open source free projects that are not included on **Steam** are either way going to be Linux native, so this. But if some devs want a better playerbase, they would either how rather focus on WindowsOS build, possibly finding Linux unrewarding.
>
> Idealism that costs much and bestows little is a poor call if you want to get masses interested.

Idealism? <u>Valve created Steam on Linux because they feared losing their dominance to the Windows Store</u>. They created a way that they would have control over the environment to maintain market dominance if the gambit was successful. It was about SteamOS, not Linux.
As Microsoft didn't restrict Windows users to only installing software through the Windows Store, nothing has changed. The Steam Machine was a bust. Steam OS is smoke. Valve still require games to have a Windows version to list in Steam, even if it's the only version.

Valve don't give a rat's about free-software. Altruism is not their motivation.

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

### How to enable launch options (environment variables)

> "Ghost of a Tale" was a fail. However, found out that two commands named:
>
> `PROTON_NO_D3D11`
>
> `PROTON_USE_WINED3D11`
>
> can be used to make it run. However, I don't know the formatting I have to use while inserting the commands.

You can just write `PROTON_USE_WINED3D11=1 DXVK_HUD=fps %command%`.

The `%command%` at the end is the original command, and the `PROTON_USE_WINED3D11=1* and *DXVK_HUD=fps` are options you want to use.

Yes, you have to put `%command%` at the end all the time. It's been like that ever since steam for Linux came out. The reason is that these aren't really launch options (command line switches) but environment variables. The syntax allows steam to recognize this, and set the variables before launching the game.

If a game has actual launch options, you don't do this. E.g. if a Windows game is supposed to run like `game.exe -windowed`, you only put `-windowed` without the `%command%` stuff just like under Windows.

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

## Using Proton with non-Steam games

I thought it would be a good idea to use Proton with GOG games, for example. It supports a really wide range of games that have achieved gold or platinum status on [ProtonDB](https://www.protondb.com/). It's better than using stock Wine and configuring it for each game separately.

I found [this](https://www.reddit.com/r/linux_gaming/comments/be4e46/how_to_play_nonsteam_games_through_proton_this/) post on Reddit and adapted it for my STALKER: Shadow of Chernobyl copy. Here is what we should do:

1. Go to **add a game** and add the game executable from the folder it is contained. You should also update the **SHORTCUT** section in the properties of this game. Add your name and add information in the following fields:

   > Notice: I'm using quotes in order to avoid problems with spaces in the path.

   **Target**: "/home/user/Games/gog/stalker-shadow-of-chernobyl/drive_c/GOG Games/S.T.A.L.K.E.R. Shadow of Chernobyl/bin/XR_3DA.exe"
   **Start in**:"/home/user/Games/gog/stalker-shadow-of-chernobyl/drive_c/GOG Games/S.T.A.L.K.E.R. Shadow of Chernobyl/bin/"

2. Go to the game properties on Steam and force Proton use.

3. Go to Launch options and Add --wine or --proton to the box.

After that, the game could be started. Your friends will see that you are playing a non-Steam game with the name you specified in the Shortcut section. However, Steam will not count the number of hours you have spent playing the game. Let's hope Valve adds this feature at some point.

>  And where can I find the prefix created for this game and, for example, saves?

Here is the path: "/home/user/.local/share/Steam/steamapps/compatdata/". There you will find a folder with many digits in its name (more numbers than Steam games have). This could be that prefix. 

## Conclusion

**Proton** is great for running non-Linux games. 

**Steam Linux Runtime** could be useful for running old Linux games in a container, it will ensure that the game will run the same on every distribution.

## References

1. https://steamcommunity.com/app/221410/discussions/0/2798319091580289893/?ctp=5#comment_1742227264188486785
2. https://steamcommunity.com/app/221410/discussions/0/2798319091580289893/?ctp=5#c1742227264188352775
3. https://www.reddit.com/r/SteamPlay/
4. https://www.reddit.com/r/SteamPlay/comments/dxiwlt/whats_the_steam_linux_runtime_option_in_the/
5. https://www.reddit.com/r/SteamPlay/comments/e9ohz5/proton_or_linux_runtime_doesnt_work/
6. https://www.reddit.com/r/SteamPlay/comments/9g9z03/i_am_confused_about_launch_options_how_to_enable/
7. https://www.reddit.com/r/linux_gaming/comments/be4e46/how_to_play_nonsteam_games_through_proton_this/