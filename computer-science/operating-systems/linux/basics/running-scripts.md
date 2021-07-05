# Running scripts

## Why do you need ./ (dot-slash) before executable or script name to run it in bash?

> [Source](https://stackoverflow.com/questions/6331075/why-do-you-need-dot-slash-before-executable-or-script-name-to-run-it-in-bas).

Your script, when in your home directory will not be found when the shell looks at the `$PATH` environment variable to find your script.

The `./` says 'look in the current directory for my script rather than looking at all the directories specified in `$PATH`'.

## What is the difference between running “bash script.sh” and “./script.sh”?

> [Source](https://unix.stackexchange.com/questions/136547/what-is-the-difference-between-running-bash-script-sh-and-script-sh).

`./script.sh` requires execution and readable bits, while `bash script.sh` only requires readable bit.

The reason of the permissions requirement difference lies in how the program that interprets your script is loaded:

- `./script.sh` makes your shell run the file as if it was a regular executable.

The shell forks itself and uses a system call (e.g. `execve`) to make the operating system execute the file in the forked process. The operating system will check the file's permissions (hence the execution bit needs to be set) and forward the request to the [program loader](http://en.wikipedia.org/wiki/Loader_(computing)), which looks at the file and determines how to execute it. In Linux compiled executables start with an [ELF](http://en.wikipedia.org/wiki/Executable_and_Linkable_Format) magic number, while scripts start with a `#!` ([hashbang](http://en.wikipedia.org/wiki/Shebang_(Unix))). A hashbang header means that the file is a script and needs to be interpreted by the program that is specified after the hashbang. This allows a script itself to tell the system how to interpret the script.

With your script, the program loader will execute `/bin/bash` and pass `./script.sh` as the command-line argument.

- `bash script.sh` makes your shell run `bash` and pass `script.sh` as the command-line argument

So the operating system will load `bash` (not even looking at `script.sh`, because it's just a command-line argument). The created `bash` process will then interpret the `script.sh` because it's passed as the command-line argument. Because `script.sh` is only read by `bash` as a regular file, the execution bit is not required.

I recommend using `./script.sh` though, because you might not know which interpreter the script is requiring. So let the program loader determine that for you.

---

`bash script.sh` invokes the script directly using the bash.
`./script.sh` is using the shebang `#!/bin/bash` to determine how to execute.

---

Create a file Delete_Self.sh like this:

```bash
 #!/bin/rm

 echo I am still here!
```

Run this script as `sh Delete_Self.sh` you will see "I am still here!" echoed back.

Make it executable, and run it as `./Delete_Self.sh` you will see nothing is echoed back, while the file `Delete_Self.sh` itself is gone.

So the difference is that:

- `bash script.sh` will ignore the #! line, because bash is specified as the program to run script.sh.
- `./script.sh` will read the #! line to determine the program to run `script.sh`.

---

In addition to the other answers, knowing the difference between running a script via `./script.sh` (i) and `source ./script.sh` (ii) is useful - The (i) version creates a new shell in which to run the command, whereas (ii) runs it in the current shell - which can be mandatory if the executable changes environment variables that need to be preserved after the executable exits. For example, to activate a python conda environment the following must be used:

```bash
source activate my_env
```

N.B. Another alternative to `source` that you may encounter is the `.` builtin, i.e.

```bash
. activate my_env
```

