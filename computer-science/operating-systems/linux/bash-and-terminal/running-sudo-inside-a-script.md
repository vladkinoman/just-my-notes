# Running 'sudo' command inside a script

> Took it from [this question](https://askubuntu.com/questions/425754/how-do-i-run-a-sudo-command-inside-a-script).

## First approach

It is rarely a good idea to have `sudo` inside scripts. Instead, remove the `sudo` from the script and run the script itself with `sudo`:

```bash
$ sudo myscript.sh
```

That way, all commands within the script will be run with root privileges and you only need to give the password once when launching the script. If you need a particular command within the script to be run without `sudo` privileges, you can run it as a regular user with (thanks [Lie Ryan](https://askubuntu.com/questions/425754/how-do-i-run-this-sudo-command-inside-a-script#comment552406_425990)):

```bash
$ sudo -u username command 
```

The space is irrelevant, it should not affect anything, there is *always* a space between a command and its arguments.

## Second approach

You could possibly modify the `sudoers` file.

Run `sudo visudo`.

Add an entry for your username and the script that you would like to run without being asked for a password.

```bsh
username ALL=(ALL) NOPASSWD: /path/to/script
```

> Not sure anyone mentioned it, but you must terminate all login sessions of that user after you have edited the `sudoers` file.

## Third approach

You could try something like:

```bash
$ echo "PASSWORD" | sudo -S ./playback_delete_data_patch.sh 09_delete_old_data_p.sql
```

This is not the most secure thing to do since you are writing a sudoer password in plain text. To make it a little more secure you can create a variable and read the sudo password into the variable and then you could execute the command as:

```bash
$ echo $PASSWORD | sudo -S ./playback_delete_data_patch.sh 09_delete_old_data_p.sql
```

Also, if you do not mind all your commands being executed as root you can simple execute your script using `sudo`, as previously suggested.

```bash
$ sudo ./myscript
```

> Reading password into variable securely: `read -s PASSWORD` 

## Other approaches

This answer is similar to terdon's [answer](https://askubuntu.com/a/425990/8698). I would also suggest running the main script with `sudo` so the script can run without having to ask for the user's password during its execution.

However, in case you want to drop root privileges to some of the commands and run them as the actual user who invoked the command with `sudo`, you can check for the `$SUDO_USER` variable to figure out the original user.

This is an example script of how you could achieve that:

```bash
#!/bin/bash

# ref: https://askubuntu.com/a/30157/8698
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

# Commands that you don't want running as root would be invoked
# with: sudo -u $real_user
# So they will be run as the user who invoked the sudo command
# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
# sudo -u $real_user non-root-command

# Commands that need to be ran with root would be invoked without sudo
# root-command
```

---

There is actually a much simpler way to do this. For portability, this is my implementation but feel free to manipulate it to suit your need.

Enter your sudo password as a parameter when starting the script, capture it, and echo it with each command which will prompt for the sudo password.

```bash
#!/bin/bash

PW=$1
echo $PW | ./playback_delete_data_patch.sh 09_delete_old_data_p.sql  
./command_wo_sudo.sh <param>
echo $PW | ./other_command_requires_sudo.sh <param>
```

You can add a prompt and capture after the script is kicked off like so:

```bash
$ echo "enter the sudo password, please"
read PW
```

But if someone else monitors what's run on the node; has access to logs created by it; or is just looking over your should randomly when you run a test, that could compromise security.

This also works with running commands/scripts that require a yes to continue:

```bash
$ echo $PW | yes | ./install.sh
```

The echo is in response to a prompt, so you can use anything you need to, there, if you're running other scripts that have prompts for progress, in sequential order. Make sure you know that order, though, or bad things can happen.

> That's so much more elegant and simple, I'm glad I scrolled all the way down! EDIT: wait, this will add the password to my terminal history. How to ask for username/password with `read`: [ryanstutorials.net/bash-scripting-tutorial/bash-input.php](https://ryanstutorials.net/bash-scripting-tutorial/bash-input.php). That should avoid this issue.

---

```bash
#!/bin/bash
# this declares that current user is a sudoer
sudo tee /etc/sudoers.d/$USER <<END
END

# write the content of your script here
sudo npm install hexo-cli -g
mkdir Untitled
sudo apt-get install python

# then to remove the sudo access from the current user
sudo /bin/rm /etc/sudoers.d/$USER
sudo -k
```

