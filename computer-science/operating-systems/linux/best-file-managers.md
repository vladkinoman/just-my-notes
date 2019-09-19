# Best file manager for Linux

## Ranger

- Good when you are not just using shell commands.

- It lets you select stuff to do bulk operations. Say you have a dir full of  random stuff, like a downloads folder. When there is a large amount of  stuff in there ranger helps sift through it, 'tagging' what I want to  delete.
- It lets you preview images/pdfs/text files all in one place.
- It is highly customizeable and provides many features.
- You can easily move, copy, paste, rename, goto somewhere by using Vim-like-shortcuts.
- Ranger provides a very cool feature named "bulkrename". Ranger opens your current directory content with $EDITOR and you are able to edit every
  entry name. You can easily set new shortcuts too, like "map gC cd ~/.config" or "map ewm $EDITOR ~/.config/i3/config".. which is very cool.
- Similar to Vim in case of key-bindings.
- I have found that Ranger doesn't support operations with transferring files on other devices (Windows Phone in my case) but Nautilus does.

i3 and ranger run really well combined.

Faster alternatives:

- nnn. nnn has optimization which scripts can't think of: https://github.com/jarun/nnn/wiki/performance-factors
- fff is a copy (including the name) of the light mode of nnn and its features in a bash-specific script. I didn't see any reason to sacrifice the speed of nnn.

## Dolphin

- Dolphin is the best GUI FMs out there 

- the most customizable file manager
- cool, but it doesn't preserve extended file attributes

## Pcmanfm

- has like 2 dependencies and is really fast
- has a daemon (?)

## Thunar

- It may segfault for you when you do many file operations.

## Midnight Commander

Basically It's FAR manager for Linux.

## Krusader

TODO ...

## Sources

- https://www.reddit.com/r/linux/comments/76lq91/whats_your_favorite_file_explorer/
- https://www.reddit.com/r/archlinux/comments/ag09di/current_popular_file_managers/