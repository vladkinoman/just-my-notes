# Where to install programs

## Simple explanation

There is no C:\Program Files\ in linux "per se". Therefore it doesn't exist one single (default) place where programs where to install. Actually many linux programs installs all over the place, parts of them installs in different folders. That's happening for performance optimization - one of many reasons why linux runs faster than Windows.

Best practice is to allow the program to install wherever it wants. Don't worry about volume fragmentation. That's virtually non-existent in linux.

The same thing happens in Windows too, when some big programs are installing files in ProgramData or CommonFiles folders. I've seen programs installing in Program Files (x64) and their respective Licence Key Server installing in Program Files (x86). Many specific user data may install in C:\Users\Documents\.

When a program uses many per-user options and files, it ussually installs to **/usr/share**. When it does not, it ussually installs to **/opt**. You could say that /usr is the equivalent of Users folder from Windows. /opt stands for optional software (that doesn't come bundled with the Ubuntu original disk).

For in-depth details of where and how linux programs are installed, please see this topic: [Where are my installed applications](https://askubuntu.com/questions/9024/where-are-my-installed-applications)

There is no single Program Files because of security reasons. Trusted applications (verified by the Software Center) may install in more sensitive places like **/bin** (=binaries) or even **/sbin** (=superbinaries), while untrusted (unverified) apps are installed in secure and secluded locations like **/opt**.

## References

1. https://askubuntu.com/questions/775607/where-to-install-programs
