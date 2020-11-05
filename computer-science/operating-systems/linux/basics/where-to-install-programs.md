# Where to install programs

## Differences between Linux and Windows you should know in case you don't

- There is no one single (default) place where programs are installed like C:\Program Files\ "per se" because of security reasons.

- Many Linux programs installs all over the place, parts of them installs in different folders.

  > Actually, the same thing happens in Windows too, when some big programs are installing files in ProgramData or CommonFiles folders. Many specific user data may install in C:\Users\Documents\.

- That's happening not only for safety, but also for performance optimization - one of many reasons why Linux runs faster than Windows.

For all path-related questions, the [Linux Filesystem Hierarchy Standard](http://www.pathname.com/fhs/) is the definitive reference.

## In short, where do I install the programs?

- Best practice is to allow the program to install wherever it wants. Volume fragmentation is virtually non-existent in Linux.

- Trusted applications (verified by the Software Center) may install in more sensitive places like **/bin** (=binaries) or even **/sbin** (=superbinaries).

- When a program (untrusted) uses many per-user options and files, it usually installs to secure and secluded **/usr/share**.

  > You could say that **/usr** is the equivalent of Users folder from Windows.

- When it does not (also untrusted), it usually installs to secure and secluded **/opt**.

  > **/opt** stands for optional software (that doesn't come bundled with the Ubuntu original disk).

- Usually you would put it in `/usr`, binaries in `/usr/bin` if it's something bigger it would go to `/opt`.

- If the program needs to create a folder, then `/usr/local` is the directory of choice; according to the [FHS](http://www.pathname.com/fhs/):

  > The `/usr/local` hierarchy is for use by the system administrator when installing software locally.

- Avoid placing your local binaries directly under `/usr`, because according to the FHS, that hierarchy is reserved for the software provided by the Linux distribution (in this case, Ubuntu).

- Note that, placing a binary in `/usr/local/bin` (or any other `bin` directory) will *not* create a menu entry; for that you have to provide [a .desktop file](http://standards.freedesktop.org/desktop-entry-spec/latest/) and install it in the appropriate directory with the [xdg-desktop-menu](http://portland.freedesktop.org/xdg-utils-1.0/xdg-desktop-menu.html) command.

For in-depth details of where and how Linux programs are installed, please see this topic: [Where are my installed applications](https://askubuntu.com/questions/9024/where-are-my-installed-applications).

## Where I can find applications and updates for them?

- It is always preferable to install through the native Package Management as the Package Manager will handle the location, updates, paths and the launchers (shortcuts) for you. You should ideally search for the package in the Software Center or Synaptic.
- PPAs can be used if the software is not in the default repos.
- Official websites, where you will find archives or deb packages.

## References

1. https://askubuntu.com/questions/775607/where-to-install-programs
2. https://askubuntu.com/questions/6897/where-to-install-programs
3. http://www.pathname.com/fhs/
4. https://askubuntu.com/questions/9024/where-are-my-installed-applications
