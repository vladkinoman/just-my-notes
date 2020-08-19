# Linux Bash advice

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