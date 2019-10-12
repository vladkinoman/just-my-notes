# Emacs or Vim

## Emacs

- Emacs is not just an editor it's a lisp interpreter/environment. It is a sort of poor's man LispMachine (LispM/Plan9 etc models), a complex, heavy, slow (TODO: find out if that's true), operating environment that is essentially a small operating system on top of a bootloader-os.

- Emacs has a Vim that's just an application inside it. For instance, Emacs can emulate Vim bindings and workflow with *evil mode*.

  > Don't forget to install evil-mode and evil-collection packages to get the best of both worlds.— Reddit.

- Emacs is always right thing to use to build text based interfaces.

- *Org Mode* might be nice for writing articles, contracts, and books.

- There are more useful packages in the Emacs ecosystem than Vim.

- Emacs has the ability to run gdb (GNU Debugger) and visually step through code or get an inline view if git blame. Emacs can make quite an IDE (e.g. [C++ IDE](https://www.reddit.com/r/emacs/comments/7fp6jk/beginners_guide_to_setting_up_a_basic_emacs_c/)).

- **Emacs = extensibility**. You can make your own environment and forget typing commands at the shell. You can move your Gmail workflow and DE into Emacs. If you get a missing feature, you can just wait for free time and implement it yourself (or find existing solutions).

### Extensibility

- Emacs is really built on two layers, *C* and *Elisp*, where Elisp is the high level language that attempts to do everything, and C is used only where necessary/appropriate. In comparison Vim is not two layers, but a division within the program where certain types of functionality/components are implemented in C, and others in VimL, with the addition of the UI being scriptable in VimL.

- Elisp codebase is way more polished, documented, factored etc compared to Vim's C codebase. VimL is a funky just vim language. Elisp is lisp, and it is evoling beyond Emacs and becoming guile, and its basic ideas and terms exist in Haskell, Scala, and other functional languages.

- Elisp has a lot of basic functional concepts and terms that are used in other languages which will make you a better programmer and can be directly usefull because they are very similar in Scala, Haskell, Clojure, and some functional stuff is being imported into most mainstream languages like Java nowadays. 

  > And doing small Emacs customizations and poking around the very well written Elisp manual has been the most enjoyable way I've ever learned a programming language. — Reddit.

### Spacemacs

Also, there is a Spacemacs framework for Emacs configuration. 

You can use it to develop projects, for example, in C++. Spacemacs with ycmd for auto completion and error checking, with rtags (or perhaps, soon, cquery) for indexing. All libclang based, all highly performant and responsive. Outside of C++ specific stuff, it has the best vim emulation, the best buffer/window/workspace management, the best git extension, and the best textual search/manipulation (powered by things like helm and helm-ag) of any editor I've used.

## Vim

- Vim is only an text editor.
- Vim is lightweight and has great editing capabilities.
- It opens up blazing fast and you can edit text efficiently and then close it. For me its useful only when I am using the shell.
- Nonetheless, Vim might be slower when using the syntax highlighting.
- Vim is far more well know simply because is a light UNIX tools and most of FOSS/usable OSes since few decades are UNIX-like. So it's the most natural tool to learn.
- **Vim = portability**. 

### Extensibility

- Vim isn't extensible like Emacs. In vim, you get *Vimscript* (VimL) and ugly spagetti code *C*, both very unpleasant and unworthy of yr time.
- The majority and most important Vim functionality is built in C, with only a "scriptable user interface" exposed, which is qualitatively very different than what emacs does. 
- There is a lack of VimL libraries. 
- Many new features in Vim are forced to use Vim C code, which generally means not really using VimL at all (and in many past cases, throwing away VimL code and time spent on it), and the Vim C code, as C code goes, is not a great codebase to work with and is generally less productive than Elisp.

## Conclusion

Vim is a lightweight text redactor which is great when you need to open the file, change a few lines, find a word, and close the file after that.

In general, Emacs is better than Vim because it includes its functionality. Moreover, you can use Emacs as an IDE or an operating system inside of your bootloader-os. Emacs even allows you to extend its functionality by writing plugins with Elisp.