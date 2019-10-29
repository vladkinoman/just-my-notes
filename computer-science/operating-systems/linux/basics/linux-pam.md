# Linux-PAM

**Linux-PAM** (short for **Pluggable Authentication Modules** which evolved from the Unix-PAM architecture) is a powerful suite of shared libraries used to dynamically authenticate a user to applications (or services) in a Linux system [1].

It integrates multiple low-level authentication modules into a high-level API that provides dynamic authentication support for applications. This allows developers to write applications that require authentication, independently of the underlying authentication system.

Many modern Linux distributions support **Linux-PAM** (hereinafter referred to as “**PAM**”) by default.

## Q/A

**Why do we use optional in PAM `/etc/pam.d/login` even if it'll be ignored?** Important note: optional modules won't be ignored, they will be processed, their ***results\*** will be ignored, i.e., even if they fail, the authentication process won't be aborted. There are many situations where you may want an action to be performed (a module to be executed) during authentication but, even in case of fail, you don't want that the authentication process get aborted [2].

## References

1. [How to Configure and Use PAM in Linux](https://www.tecmint.com/configure-pam-in-centos-ubuntu-linux/)
2. [[Why do we use optional in PAM even if it'll be ignored?](https://unix.stackexchange.com/questions/424033/why-do-we-use-optional-in-pam-even-if-itll-be-ignored)](https://unix.stackexchange.com/questions/424033/why-do-we-use-optional-in-pam-even-if-itll-be-ignored#answer-424034)

