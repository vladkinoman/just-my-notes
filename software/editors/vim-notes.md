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

## Neovim

> [Source](https://neovim.io/)


Neovim is a refactor, and sometimes redactor, in the tradition of Vim (which itself derives from Stevie). It is not a rewrite but a continuation and extension of Vim. Many clones and derivatives exist, some very clever—but none are Vim. Neovim is built for users who want the good parts of Vim, and more.

Sharing configs btw vim & neovim:

> [Source](https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim)

- use existing ~/.vimrc and plugins located within ~/.vim without having to symlink the files
- add the following lines to ~/.config/nvim/init.vim:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

[Goneovim](https://github.com/akiyosi/goneovim) is a GUI frontend for neovim. It is written in Go, using a Qt binding for Go.

Neovim (and even Vim) has been optimized for working with Terminal, and some Terminal-based workflows cannot be achieved with a GUI. Therefore, for some people, a GUI would be an unnecessary additional stuff. On the other hand, in my opinion, there are some attractive features of GUI as follows.

  - More meta keys can be used
     - Since Neovim performs all of its operations with the keyboard, having more meta keys available is a simple advantage.
  - Terminal is also available in Neovim GUI
     - Neovim has an embedded terminal emulator that can be run in :terminal, so you can run basic terminal workflows using :terminal with bash or zsh in Neovim GUI. It is also possible to use remote control tools such as nvr to avoid nvim in nvim in Neovim GUI.
  - Experience the rich drawing expressions of GUI
     - For example, it is possible to scroll based on pixels, to set different font families and point sizes for each window.


## Themes

[vim-monokai](https://github.com/sickill/vim-monokai) - manually

[vim-monokai](https://github.com/crusoexia/vim-monokai) - manually & using Plug, good for coc.nvim

## coc.nvim a completion engine

> [Source](https://github.com/neoclide/coc.nvim)


