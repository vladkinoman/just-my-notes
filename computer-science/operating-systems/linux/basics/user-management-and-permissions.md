# User management and permissions

> Via [LinuxJourney](https://linuxjourney.com/).

## User management

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

## Permissions

```bash
$ ls -l Desktop/

drwxr-xr-x 2 pete penguins 4096 Dec 1 11:45 .
```

There are four parts to a file's permissions. The first part is the <u>filetype</u>, which is denoted by the first character in the permissions, in our case since we are looking at a directory it shows **d** for the filetype. Most commonly you will see a **-** for a regular file.

The next three parts of the file mode are the actual permissions. The permissions are grouped into 3 bits each. The first 3 bits are user permissions, then group permissions and then other permissions. I've added the pipe to make it easier to differentiate.

```bash
d | rwx | r-x | r-x 
```

Each character represent a different permission:

- r: readable
- w: writable
- x: executable (basically an executable program)
- -: empty

### chmod

chmod allows you to change the permissions easily. **+** - add permissions, **-** remove permissions. 

- add permission bit on the user set: `chmod u+x myfile`.
- remove permission bit on a file: `chmod u-x myfile`.
- adding multiple permission bits on a file: `chmod ug+w`.

You can also change permissions all at once. Instead of using r, w, or x to represent permissions, you'll use a numerical representation for a single permission set. So no need to specify the group with g or the user with u.

The numerical representations are seen below:

- 4: read permission
- 2: write permission
- 1: execute permission

Let's look at an example:

```bash
$ chmod 755 myfile
```

The first number (7) represents user permissions, the second number (5) represents group permissions and the last 5 represents other permissions.

7 = 4 + 2 + 1, so 7 is the user permissions and it has read, write and execute permissions

5 = 4 + 1, the group has read and execute permissions

5 = 4 +1, and all other users have read and execute permissions

### chown and chgrp

```bash
sudo chown patty myfile
```

This command will modify user ownership.

```bash
sudo chgrp whales myfile
```

This command will modify group ownership.
If you add a colon and groupname after the user you can set both the user and group at the same time.

```bash
sudo chown patty:whales myfile
```

### umask

Every file that gets created comes with a default set of permissions. If you ever wanted to change that default set of permissions, you can do so with the umask command. This command takes the 3 bit permission set we see in numerical permissions.

Instead of adding these permissions though, umask takes away these permissions.

```bash
umask 021
```

The default umask on most distributions is 022, meaning all user access, but no write access for group and other users.

When you run the umask command it will give that default set of permissions on any new file you make. However, if you want it to persist you'll have to modify your startup file (.profile).

### setuid

There are many cases in which normal users need elevated access to do stuff. The system administrator can't always be there to enter in a root password every time a user needed access to a protected file, so there are special file permission bits to allow this behavior. The Set User ID (SUID) allows a user to run a program as the owner of the program file rather than as themselves.

Let's look at an example:

Let's say I want to change my password, simple right? I just use the passwd command:

```bash
passwd
```

What is the password command doing? It's modifying a couple of files, but most importantly <u>it's modifying the /etc/shadow file</u>. Let's look at that file for a second:

```bash
ls -l /etc/shadow

-rw-r----- 1 root shadow 1134 Dec 1 11:45 /etc/shadow
```

Oh wait a minute here, this file is owned by root? How is it possible that we are able to modify a file owned by root?

Let's look at another permission set, this time of the command we ran:

```bash
ls -l /usr/bin/passwd

-rwsr-xr-x 1 root root 47032 Dec 1 11:45 /usr/bin/passwd
```

You'll notice a new permission bit here **s**. This permission bit is the SUID, when a file has this permission set, it allows the users who launched the program to get the file owner's permission as well as execution permission, in this case root. So essentially while a user is running the password command, they are running as root.

That's why we are able to access a protected file like /etc/shadow when we run the passwd command. Now if you removed that bit, you would see that you will not be able to modify /etc/shadow and therefore change your password.

**Modifying SUID**

Just like regular permissions there are two ways to modify SUID permissions.

*Symbolic way:*

```bash
sudo chmod u+s myfile
```

*Numerical way:*

```bash
 sudo chmod 4755 myfile
```

As you can see the SUID is denoted by a 4 and pre-pended to the permission set. You may see the SUID denoted as a capital **S** this means that it still does the same thing, but it does not have execute permissions.

### setgid

Similar to the set user ID permission bit, there is a set group ID (SGID) permission bit. This bit allows a program to run as if it was a member of that group.

```bash
ls -l /usr/bin/wall
-rwxr-sr-x 1 root tty 19024 Dec 14 11:45 /usr/bin/wall
```

We can see now that the permission bit is in the group permission set.

**Modifying SGID**

```bash
sudo chmod g+s myfile
sudo chmod 2555 myfile
```

The numerical representation for SGID is 2.

### Process permissions

With the SUID permission bit enabled, you can't modify other user's passwords. This is because of the many UIDs that Linux implements. There are three UIDS associated with every process:

- When you launch a process, it runs with the same permissions as the user or group that ran it, this is known as an **effective user ID**. This UID is used to grant access rights to a process. So naturally if Bob ran the touch command, the process would run as him and any files he created would be under his ownership.
- There is another UID, called the **real user ID** this is the ID of the user that launched the process. These are used to track down who the user who launched the process is.
- One last UID is the **saved user ID**, this allows a process to switch between the effective UID and real UID, vice versa. This is useful because we don't want our process to run with elevated privileges all the time, it's just good practice to use special privileges at specific times.

Now let's piece these all together by looking at the passwd command once more.

When running the passwd command, your effective UID is your user ID, let's say its 500 for now. Oh but wait, remember the passwd command has the SUID permission enabled. So when you run it, your effective UID is now 0 (0 is the UID of root). Now this program can access files as root.

Let's say you get a little taste of power and you want to modify Sally's password, Sally has a UID of 600. Well you'll be out of luck, fortunately the process also has your real UID in this case 500. It knows that your UID is 500 and therefore you can't modify the password of UID of 600. (This of course is always bypassed if you are a superuser on a machine and can control and change everything).

Since you ran passwd, it will start the process off using your real UID, and it will save the UID of the owner of the file (effective UID), so you can switch between the two. No need to modify all files with root access if it's not required.

Most of the time the real UID and the effective UID are the same, but in such cases as the passwd command they will change.

### The sticky bit

This permission bit, "sticks a file/directory" this means that only the owner or the root user can delete or modify the file. This is very useful for shared directories. Take a look at the example below:

```bash
ls -ld /tmp
drwxrwxrwxt 6 root root 4096 Dec 15 11:45 /tmp
```

You'll see a special permission bit at the end here **t**, this means everyone can add files, write files, modify files in the /tmp directory, but only root can delete the /tmp directory.

**Modify sticky bit**

```bash
sudo chmod +t mydir
sudo chmod 1755 mydir
```

The numerical representation for the sticky bit is **1**.