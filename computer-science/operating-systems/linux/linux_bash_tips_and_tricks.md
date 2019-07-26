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

```
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
``` 

That's how aliases will load into the system after logging in.

## Running a few commands

We can declare one bash command which will allow us to perform multiple commands.

Using function:

```
function lazyman() {
git add .
git commit -a -m "$1"
git push -u origin master
}
```

Using aliases:

```
alias lazyman="git add . && git commit -a -m '$i' && git push -u origin master"
```
