# Vim notes

## Keybindings

q  - quit
q  - quit & discard changes
wq - save & quit
w  - save
dd - cut the row
p  - past the row
x  - delete char.
u  - undo
:set number - set numbers
:2 - go to line 2
+p - paste from system cliboard
A  - go to the end of line
I  - go to the beginning of line

## Clipboard

> [Source](https://unix.stackexchange.com/questions/12535/how-to-copy-text-from-vim-to-an-external-program)

The following will work only if vim --version indicates that you have +xterm_clipboard feature. If not, you will have to install extra packages or recompile vim with that feature added. - USE GVIM

"+y - copies to the "usual" clipboard buffer (so you can paste using Ctrl+V, right click and select "Paste" etc)
"*y - copies to the X11 selection - you can paste from this buffer using middle click.

Note that "* and "+ work both ways. So if you have selected some text in another application, you can paste it into vim using "*p and if you have copied some text (using, say, Ctrl-C) then you can paste it into vim using "+p.

