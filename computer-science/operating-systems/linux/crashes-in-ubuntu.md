# Crashes in Ubuntu

I encountered a lot of different crashes on Lubuntu when I was installing a new software such as driver for my video card. In this note, I describe how to find out why the crash appeared and what application caused it.

## Apport

According to the [1], Apport is a system which:

- Intercepts crashes right when they happen the first time.
- Gathers potentially useful information about the crash and the OS environment.
- Can be automatically invoked for unhandled exceptions in other programming languages (e. g. in Ubuntu this is done for Python).
- Can be automatically invoked for other problems that can be automatically detected (e. g. Ubuntu automatically detects and reports package installation/upgrade failures from update-manager).
- Presents a UI that informs the user about the crash and instructs them on how to proceed.
- And is able to file non-crash bug reports about software, so that developers still get information about package versions, OS version etc.

If any process in the system dies due to a signal that is commonly referred to as a 'crash' (segmentation violation, bus error, floating point exception, etc.), or e. g. a packaged Python application raises an uncaught exception, the *apport backend* is automatically invoked. It produces an initial crash report in a file in `/var/crash/` (the file name is composed from the name of the crashed executable and the user id). If the crashed process belongs to the user who is currently logged in, or it belongs to a system process and the user is an administrator, apport informs the user about the crash and offers to report the problem (message).

Apport is not enabled by default in stable releases, even if it is installed. Apport itself is running at all times because it collects crash data for *whoopsie* (see [ErrorTracker](https://wiki.ubuntu.com/ErrorTracker)). However, the crash interception component is still disabled. To enable it permanently check out [1].

### Tools

There are several tools available for working with a crash report. One of them is the **apport-retrace**. It regenerate stack traces of a report. If you supply the `-g` option, this tool will automatically download available debug symbol packages and use them to generate a symbolic stack trace. The manpage explains the functionality and all available options in detail. 

Also, there is the **apport-unpack**. It unpacks a report into single files (one per attribute). This is most useful for extracting the core dump. Please see the manpage for further details. This tool is not necessary when working with Launchpad, since it already splits the parts into separate attachments.

Examples of the use of these tools can be found in [2]. Other tools can also be found in [1].

### Backend

In order to keep the delay and CPU/IO impact as low as possible, `/usr/share/apport/apport` only collects data which has to be acquired while the crashed process still exists: information from `/proc/`*pid*, the core dump, the executable path, and the signal number. The report is written to `/var/crash/`*executable_path*`.`*uid*`.crash`.

## Crash reason

There are a few ways to do that:

- Try looking in the `/var/crash/` folder. 
- `journalctl -b -1 -e` will show the last of the logs of the previous boot [2]. You don't have to wait for the next crash. `journalctl --list-boots` will list boots (and their time/date), and you can adjust the `-b #` of `journalctl -b -1 -e` to select one.
- Of course, we can also check the `var/log/` folder if we want to see the entire sequence of commands for certain actions, such as logging in, but this could be an overkill.

## References

1. https://wiki.ubuntu.com/Apport
2. https://askubuntu.com/questions/434431/how-can-i-read-a-crash-file-from-var-crash
3. https://askubuntu.com/questions/1068720/what-can-i-do-to-find-the-crash-reason