# Best music players

Music players are where the Linux 'ecosystem' really shines. What do we have in Windows? We have MusicBee, Foobar2000 and +- ITunes. They are great! Linux have OK players. Let's see what we have.

## Audacious

- Not library-based.
- Simple and functional.
- Has the tagging system.
- mp3s are well categorized by folder and filename, but some still have crap tags.

## mpd/ncmpcpp (or cmus?)

- cli players

- mpd+Cantata[1]

- cmus - doesn't require configuration

- cmus - light, simple, efficient and handles huge libraries really well.

- cmus - for i3 and tiling window managers. 

  > Ranger is awesome for tiling managers too (What does it mean?).

- TODO: want to try them and find out how they integrate with each other.

## Sayonara

- Very promising player with a lot of features.

- You can browse folders and playlists.

- Album covers embed in files.

- Has difficulties with playing songs instantly. You need to add a playlist and then add songs to that playlist to play them later.

  > I choose this player for editing music files and finding album covers. 

## Clementine

- It is the fork of another music player known as Amarok

- Has a strange name and a strange icon :)

- Old interface and desing

- You can browse folders and manage playlists (serious management).

- There is a built-in file manager and the music player easily find audio content in lots of online services like SoundCloud, RockRadio, RadioTunes, etc. It can find album covers, but it can't embed them into files.

- We can also configure Clementine to access your music stored on cloud drives, including Box, Dropbox, Google Drive, OneDrive, Amazon Cloud Drive, etc.

- Has equalizer and support for different formats

- Has the All Hail the Hypnotoad! option.

  > *User from Reddit*: The feature I like the most is the "Copy/move to library" that allows me to format the directory structure and file names in any way I want. Thanks to this, all my music is neatly organized in in {artist}/{album}/{artist} - {songname}.{ext}, all without effort.

## Lollypop

- The most beautiful GTK audio player out there.

- Has simple, clean UI.

- Can't offer a lot of features.

  > *User from Reddit*: If like me you enjoy listening to your music by album - I haven't found a player that does browsing music by album art as well.

## Rhythmbox

- Default music player for Ubuntu
- Simple and clean
- Does not view the folders, but imports them which isn't fast action.

## How I removed album covers from audio files

I wanted to remove album covers from selected files. It can be easily done using eyeD3 program:

```Bash
eyeD3 --remove-images *.mp3
```

## Sources

1. https://www.reddit.com/r/linux/comments/8kmero/linux_needs_a_really_good_music_player/?sort=top
2. https://www.reddit.com/r/linux/comments/9tjo94/what_music_player_do_you_use/?sort=top
3. https://www.reddit.com/r/linux/comments/ant5pl/what_is_everyones_favorite_music_player_for_linux/
4. https://www.reddit.com/r/archlinux/comments/48aq00/whats_your_favorite_music_playermanager/
5. https://www.reddit.com/r/linux/comments/3mpob5/how_do_i_remove_album_art_from_mp3_files/



