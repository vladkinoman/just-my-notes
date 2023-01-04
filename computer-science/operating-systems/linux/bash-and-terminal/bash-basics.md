# Bash basics

## Differences between terminal and bash

> Source: [link](https://superuser.com/questions/880344/what-is-the-difference-between-terminal-and-bash).

**Bash** is one of the popular *command-line shells*, programs whose chief job is to start other programs (in addition to some auxiliary functions).
The *command-line* part means you control it by typing commands one line at a time.
Properly speaking, a GUI you use to start programs by double-clicking on icons is also a shell, but in practice by "shell" people mostly mean command-line ones.

All modern command-line shells take their input and send their output as abstract streams of characters, and the other ends of those streams can be connected to a keyboard, a printer, a file, another program. The shell mostly doesn't care - it reads the characters, interprets them as commands telling it to run other programs, and writes back characters such as *"command not found"*. When it runs another program, by default it connects the inputs and outputs of that program to the same streams.

Now, **Terminal** is a program that provides a graphical interface between the shell and the user. It receives from the shell e.g. the characters *"command not found"* and figures out how to display them to you - with what font, where on the screen, in what colour, whether there should be a scrollbar. When you press some keys, it figures out whether to send them on to the shell as characters (e.g. `ls -l`), or to interpret them on its own (e.g. ⌘C).

When you open the Terminal app, it automatically opens a shell to connect you to. In its settings, you could choose a different shell from Bash. If you're feeling cheeky, you could even make it use a program that isn't a shell at all - not too useful, but it demonstrates how Terminal cares only about passing characters in and out, not about what the shell does with them.

What happens when you type `bash` into Bash (through Terminal)? It starts the program Bash - that is, another copy of itself inside itself.

> **ETA:** The *prompt* that Bash gives you before you're typing each command is usefully customizable, and controlled (using a special format) by the variable `PS1`. Try typing `echo $PS1` in both the parent and child instance of Bash.
>
> When run from the Terminal app, that variable is set to prompt you with the machine name, directory and user. This is set up for you in `/etc/bashrc`, but you can set a new value, ideally in `~/.bash_profile`. NB. that's somewhat OSX-specific; on most other systems, you'd prefer `~/.bashrc` for that.
>
> When you just run a child instance of Bash, `/etc/bashrc` isn't re-executed, so this variable isn't set. It's also not set up to be inherited by child shells (which is totally a thing for environment variables) so Bash reverts to the unhelpful default of just showing you which version of it is running.

---

Other explanation:

A terminal once *literally* meant a box you typed into, remotely connected to a mainframe.

In fact, your modern 'terminal' possibly emulates [one of these](http://en.wikipedia.org/wiki/VT220)

![enter image description here](https://brennan.io/images/alien-splash.png)

Modern 'terminals' are *[terminal emulators](http://en.wikipedia.org/wiki/Terminal_emulator)* which behave roughly like a standard terminal would. So you're running [xterm](http://en.wikipedia.org/wiki/Xterm), [rxvt](http://en.wikipedia.org/wiki/Rxvt) or something else. The terminal provides a mechanism for entering commands.

You run a command processor, or *shell*, on top of that - [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)), [fish](http://en.wikipedia.org/wiki/Friendly_interactive_shell), [csh](http://en.wikipedia.org/wiki/C_shell) or others. This is what actually turns the text that is typed into the terminal into instructions that the computer acts on. Most shells allow scripting, and you'd see a very different syntax between say bash or csh. They would run similarly on different terminals.

## Aliases

### What is alias

Aliases allow to create your own short (long if u want)  names for different terminal commands which save your time while working in terminal.

By default aliases store in "~/.bashrc" file (~ means home directory). You should create your own file for your aliases (e.g. ~/.custom_aliases).

### How to create your own aliases

Process:

1. Create file: `touch ~/.custom_aliases`.
2. Open file and write your alias for command which is hard to write every time:  `alias welcome='echo "Welcome $USER."'`
3. Update file: `source ~/.custom_aliases`
4. Run your new command in your favorite command shell: `welcome`.

When you start a new session (when you open a new terminal) you have to enter `source` command each time. To not do it, add next code to .bashrc file:

```sh
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```

That's how aliases will load into the system after logging in.

## Running a few commands

We can declare one bash command which will allow us to perform multiple commands.

Using function:

```sh
function lazyman() {
git add .
git commit -a -m "$1"
git push -u origin master
}
```

Using aliases:

```sh
alias lazyman="git add . && git commit -a -m '$i' && git push -u origin master"
```

## Shebang

The `#!` sequence of symbols is called <u>shebang</u>. The shebang is what tells the kernel the file needs to be executed using an interpreter. 

Sometimes might happen the next situation:

```bash
$ sudo: unable to execute ./script.sh: No such file or directory
```

This usually happens when the shebang (`#!`) line in your script is broken.

When run without `sudo`, the message is a little more meaningful. But with `sudo` you get the message you got.

For example:

```bash
$ cat test.sh
#!/bin/foo
echo bar

$ ./test.sh
bash: ./test.sh: /bin/foo: bad interpreter: No such file or directory

$ bash test.sh
bar

$ sudo ./test.sh
sudo: unable to execute ./test.sh: No such file or directory

$ sudo bash ./test.sh
bar
```

The `bad interpreter` message clearly indicates that it's the shebang which is faulty.

> From [this discussion](https://unix.stackexchange.com/questions/144718/sudo-unable-to-execute-script-sh-no-such-file-or-directory#answer-144719):
>
> > This was the issue. There were hidden `^M` characters and the interpreter was reading it as part of the shebang line. I ran it through `dos2unix` and it fixed it right up. Thanks
>
> > In my case, line ending was set wrong, to CR-LF for Windows, should be LF for Linux. Can take a while before you find that out.

## Get last argument to the previous command

> [Source](https://unix.stackexchange.com/questions/9123/is-there-a-one-liner-that-allows-me-to-create-a-directory-and-move-into-it-at-th).

The `$_` variable, in bash, is the last argument given to the previous command. In this case, the name of the directory you just created:

```bash
mkdir longtitleproject && cd $_
```

Use cd $_ to retrieve the last argument of the previous command instead of cd !$ because cd !$ gives the last argument of previous command in the shell history:

