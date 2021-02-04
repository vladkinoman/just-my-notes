# Processes

> Via [LinuxJourney](https://linuxjourney.com/).

## ps and top

Processes are the programs that are running on your machine. They are managed by the kernel and each process has an ID associated with it called the **process ID (PID).** This PID is assigned in the order that processes are created.

**ps** shows you a quick snapshot of the current precesses:

- PID: Process ID
- TTY: Controlling terminal associated with the process (we'll go in detail about this later)
- STAT: Process status code
- TIME: Total CPU usage time
- CMD: Name of executable/command

```bash 
ps aux
```

The **a** displays all processes running, including the ones being ran by other users. The **u** shows more details about the processes. And finally the **x** lists all processes that don't have a TTY associated with it, these programs will show a ? in the TTY field, they are most common in daemon processes that launch as part of the system startup.

Another very useful command is the **top** command, top gives you real time information about the processes running on your system instead of a snapshot. By default you'll get a refresh every 10 seconds. Top is an extremely useful tool to see what processes are taking up a lot of your resources.

```bash
top
```

## Controlling terminal

The TTY is the terminal that executed the command.

There are two types of terminals, **regular terminal devices** and **pseudoterminal devices**. 

A **regular terminal device** is a native terminal device that you can type into and send output to your system, this sounds like the terminal application you've been launching to get to your shell, but it's not. Type Ctrl-Alt-F1 to get into TTY1 (the first virtual console), you'll notice how you don't have anything except the terminal, no graphics, etc. This is considered a regular terminal device, you can exit this with Ctrl-Alt-F7.

A **pseudoterminal** is what you've been used to working in, they emulate terminals with the shell terminal window and are denoted by PTS . If you look at ps again, you'll see your shell process under pts/*.

Ok, now circling back to the controlling terminal, processes are usually bound to a **controlling terminal**. For example, if you were running a program on your shell window such as find and you closed the window, your process would also go with it.

There are processes such as *daemon processes*, which are special processes that are essentially keeping the system running. They often start at system boot and usually get terminated when the system is shutdown. They run in the background and since we don't want these special processes to get terminated they are not bound to a controlling terminal. In the ps output, the TTY is listed as a **?** meaning it does not have a controlling terminal.

## Process details

A process is a running program on the system, more precisely it's the system allocating memory, CPU, I/O to make the program run. A process is an instance of a running program, go ahead and open 3 terminal windows, in two windows, run the **cat** command without passing any options (the cat process will stay open as a process because it expects stdin). Now in the third window run: **ps aux | grep cat**. You'll see that there are two processes for cat, even though they are calling the same program.

The <u>kernel is in charge of processes</u>, when we run a program the kernel loads up the code of the program in memory, determines and allocates resources and then keeps tabs on each process, it knows:

- The status of the process
- The resources the process is using and receives
- The process owner
- Signal handling (more on that later)
- And basically everything else

All processes are trying to get a taste of that sweet resource pie, it's the kernel's job to make sure that processes get the right amount of resources depending on process demands. When a process ends, the resources it used are now freed up for other processes.

## Process creation

When a new process is created, an existing process basically clones itself using something called the **fork system call** (system calls will be discussed very far into the future). The fork system call creates a mostly identical child process, this child process takes on a new process ID (PID) and the original process becomes its parent process and has something called a parent process ID **PPID**. Afterwards, the child process can either continue to use the same program its parent was using before or more often use the execve system call to launch up a new program. This system call destroys the memory management that the kernel put into place for that process and sets up new ones for the new program.

We can see this in action:

```bash
ps l
```

The l option gives us a "long format" or even more detailed view of our running processes. You'll see a column labelled **PPID**, this is the parent ID. Now look at your terminal, you'll see a process running that is your shell, so on my system I have a process running bash. Now remember when you ran the `ps l` command, you were running it from the process that was running bash. Now you'll see that the **PID** of the bash shell is the **PPID** of the **ps l** command.

So if every process has to have a parent and they are just forks of each other, there must be a mother of all processes right? You are correct, when the system boots up, the kernels creates a process called **init**, it has a PID of 1. The init process can't be terminated unless the system shuts down. It runs with root privileges and runs many processes that keep the system running. We will take a closer look at init in the system bootup course, for now just know it is the process that spawns all other processes.

## Process termination

A process can exit using the **_exit system call**, this will free up the resources that process was using for reallocation. So when a process is ready to terminate, it lets the kernel know why it's terminating with something called a **termination status**. Most commonly a status of 0 means that the process succeeded. However, that's not enough to completely terminate a process. The parent process has to acknowledge the termination of the child process by using the **wait system call** and what this does is it checks the termination status of the child process.

There is another way to terminate a process and that involves using signals (see below).

**Orphan Processes**

When a parent process dies before a child process, the kernel knows that it's not going to get a wait call, so instead it makes these processes "orphans" and puts them under the care of init (remember mother of all processes). Init will eventually perform the wait system call for these orphans so they can die.

**Zombie Processes**

What happens when a child terminates and the parent process hasn't called wait yet? We still want to be able to see how a child process terminated, so even though the child process finished, the kernel turns the child process into a zombie process. The resources the child process used are still freed up for other processes, however there is still an entry in the process table for this zombie. Zombie processes also cannot be killed, since they are technically "dead", so you can't use signals to kill them. Eventually if the parent process calls the wait system call, the zombie will disappear, this is known as "reaping". If the parent doesn't perform a wait call, init will adopt the zombie and automatically perform wait and remove the zombie. It can be a bad thing to have too many zombie processes, since they take up space on the process table, if it fills up it will prevent other processes from running.

## Process states

Let's take a look at the ps aux command again:

```bash
ps aux
```

In the STAT column, you'll see lots of values. A linux process can be in a number of different states. The most common state codes you'll see are described below:

- R: running or runnable, it is just waiting for the CPU to process it.
- S: Interruptible sleep, waiting for an event to complete, such as input from the terminal.
- D: Uninterruptible sleep, processes that cannot be killed or interrupted with a signal, usually to make them go away you have to reboot or fix the issue
- Z: Zombie. Again, zombies are terminated processes that are waiting to have their statuses collected
- T: Stopped, a process that has been suspended/stopped.

## Signals

A signal is a notification to a process that something has happened.

**Why we have signals**

They are software interrupts and they have lots of uses:

- A user can type one of the special terminal characters (Ctrl-C) or (Ctrl-Z) to kill, interrupt or suspend processes
- Hardware issues can occur and the kernel wants to notify the process
- Software issues can occur and the kernel wants to notify the process
- They are basically ways processes can communicate

**Signal process**

When a signal is generated by some event, it's then delivered to a process, it's considered in a pending state until it's delivered. When the process is ran, the signal will be delivered. However, processes have signal masks and they can set signal delivery to be blocked if specified. When a signal is delivered, a process can do a multitude of things:

- Ignore the signal
- "Catch" the signal and perform a specific handler routine
- Process can be terminated, as opposed to the normal exit system call
- Block the signal, depending on the signal mask

**Common signals**

Each signal is defined by integers with symbolic names that are in the form of SIGxxx. Some of the most common signals are:

- SIGHUP or HUP or 1: Hangup. Hangup, sent to a process when the controlling terminal is closed. For example, if you closed a terminal window that had a process running in it, you would get a SIGHUP signal. So basically you've been hung up on
- SIGINT or INT or 2: Interrupt. Is an interrupt signal, so you can use Ctrl-C and the system will try to gracefully kill the process.
- SIGKILL or KILL or 9: Kill. Kill the process, kill it with fire, doesn't do any cleanup.
- SIGSEGV or SEGV or 11: Segmentation fault.
- SIGTERM or TERM or 15: Software termination. Kill the process, but allow it to do some cleanup first.
- SIGSTOP or STOP: Stop. Stop/suspend a process

Numbers can vary with signals so they are usually referred by their names.

Some signals are unblockable, one example is the SIGKILL signal. The KILL signal destroys the process.

## kill

You can send signals that terminate processes, such a command is aptly named the kill command.

```bash
kill 12445
```

The 12445 is the PID of the process you want to kill. By default it sends a TERM signal. The SIGTERM signal is sent to a process to request its termination by allowing it to cleanly release its resources and saving its state.

You can also specify a signal with the kill command:

```bash
kill -9 12445
```

This will run the SIGKILL signal and kill the process.

## niceness

Processes use the CPU for a small amount of time called a time slice. Then they pause for milliseconds and another process gets a little time slice. By default, process scheduling happens in this round-robin fashion. Every process gets enough time slices until it's finished processing. The kernel handles all of these switching of processes and it does a pretty good job at it most of the time.

Processes aren't able to decide when and how long they get CPU time, if all processes behaved normally they would each (roughly) get an equal amount of CPU time. However, there is a way to influence the kernel's process scheduling algorithm with a nice value. **Niceness** is a pretty weird name, but what it means is that processes have a number to determine their priority for the CPU. A high number means the process is nice and has a lower priority for the CPU and a low or negative number means the process is not very nice and it wants to get as much of the CPU as possible.

```bash
top
```

You can see a column for NI right now, that is the niceness level of a process.

To change the niceness level you can use the nice and renice commands:

```bash
nice -n 5 apt upgrade
```

The nice command is used to set priority for a new process. The renice command is used to set priority on an existing process.

```bash
renice 10 -p 3245
```

## /proc filesystem

Remember **everything in Linux is a file**, even processes. Process information is stored in a special filesystem known as the **/proc filesystem**.

```bash
ls /proc
```

You should see multiple values in here, there are sub-directories for every PID. If you looked at a PID in the ps output, you would be able to find it in the /proc directory.

Go ahead and enter one of the processes and look at that file:

```bash
cat /proc/12345/status
```

You should see process state information and well as <u>more detailed information</u>. The /proc directory is how the kernel views the system, so there is a lot more information here than what you would see in ps.

## Job control

Let's say you're working on a single terminal window and you're running a command that is taking forever. You can't interact with the shell until it is complete, however we want to keep working on our machines, so we need that shell open. Fortunately we can control how our processes run with **jobs**:

**Sending a job to the background**

Appending an ampersand (&) to the command <u>will run it in the background</u> so you can still use your shell. Let's see an example:

```bash
sleep 1000 &
sleep 1001 &
sleep 1002 &
```

**View all background jobs**

Now you can view the jobs you just sent to the background.

```bash
jobs

[1]    Running     sleep 1000 &
[2]-   Running     sleep 1001 &
[3]+   Running     sleep 1002 &
```

This will show you the job id in the first column, then the status and the command that was run. The **+** next to the job ID means that it is the most recent background job that started. The job with the **-** is the second most recent command.

**Sending a job to the background on existing job**

If you already ran a job and want to send it to the background, you don't have to terminate it and start over again. First suspend the job with Ctrl-Z, then run the **bg** command to send it to the background.

```bash
vladkinoman@pop-os$ sleep 1003
^Z
[4]+    Stopped     sleep 1003

vladkinoman@pop-os$ bg
[4]+    sleep 1003 &

vladkinoman@pop-os$ jobs

[1]    Running     sleep 1000 &
[2]    Running     sleep 1001 &
[3]-   Running     sleep 1002 &
[4]+   Running     sleep 1003 &
```

**Moving a job from the background to the foreground**

To move a job out of the background just specify the job ID you want. If you run **fg** without any options, it will bring back the most recent background job (the job with the + sign next to it)

```bash
fg %1
```

**Kill background jobs**

Similar to moving jobs out of the background, you can use the same form to **kill** the processes by using their Job ID.

```bash
kill %1
```