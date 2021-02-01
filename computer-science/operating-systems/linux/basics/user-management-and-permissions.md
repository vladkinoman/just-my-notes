# User management and permissions

> Via [LinuxJourney](https://linuxjourney.com/).

The system uses user ids (UID) to manage users, usernames are the friendly way to associate users with identification, but the system identifies users by their UID.  To find out what users are mapped to what ID, look at the /etc/passwd file (see below). 

The system also uses groups to manage permissions, groups are just sets of users with permission set by that group, they are identified by the system with their group ID (GID).

> In Linux, you'll have users in addition to the normal humans that use the system. Sometimes these users are system daemons that continuously run processes to keep the system functioning.

- /etc/sudoers — this file lists users who can run sudo. Use **visudo** to edit this file.
- /etc/passwd — this file shows you a list of users and detailed information about them. x- there is a password (the password is not really stored in this file, it's usually stored in the /etc/shadow file), * - no login access, blank - no password. Use **vipw** to edit this file.
- /etc/shadow — this file stores information about user authentication. It requires superuser read permissions. You'll notice that it looks very similar to the contents of /etc/passwd, however in the password field you'll see an encrypted password.
  In most distributions today, user authentication doesn't rely on just the /etc/shadow file, there are other mechanisms in place such as PAM (Pluggable Authentication Modules) that replace authentication.
- /etc/group — this file allows for different groups with different permissions. There isn't a need to set a group password, using an elevated privilege like sudo is standard.

Most enterprise environments are using management systems to manage users, accounts and passwords. However, on a single machine computer there are useful commands to run to manage users.

- `sudo useradd new_user` or `sudo adduser new_user` (this one contains more helpful features such as making a home directory and more) — sets up default groups, adds entries to the /etc/shadow and /etc/passwd files. There are configuration files for adding new users that can be customized depending on what you want to allocate to a default user.
- `sudo userdel a_user` — does its best to undo the file changes by useradd.
- `sudo passwd a_user` — change the password of a user (if you are a root).  