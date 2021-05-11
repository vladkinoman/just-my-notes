# Logs

## Can I delete /var/logs on Ubuntu?

> [Source 1](https://askubuntu.com/questions/171678/can-i-delete-var-log-files-due-to-low-root-space), [Source 2](https://unix.stackexchange.com/questions/130786/can-i-remove-files-in-var-log-journal-and-var-cache-abrt-di-usr).

It is generally safe to delete log files. The only disadvantage  associated with doing so is that you may not be able to examine the log, if you're troubleshooting some other problem later. Since new logs are  automatically generated, even this disadvantage is short-lived.

Most logs are deleted automatically (after being *rotated* by  compression and renaming, and kept a while in that archived format). If you have a log that's expanded faster than Ubuntu is deleting it, it's unlikely that you'll experience any problems from deleting it manually.

However, if you have a log file that's 22 gigs in size, something  very strange is happening, and it would be worthwhile to investigate that.

However, some of the apps cannot recreate (Apache2) log files. So, be careful.

> I have also had a scenario where I mistakenly deleted the log folder and the process was unable to recreate it  because it required sudo permission which is not given to the process  during run time (for security purposes)

---

Yes you can delete everything inside of `/var/log/journal/*` but do not delete the directory itself. You can also query `journalctl` to find out how much disk space it's consuming:

```bash
$ journalctl --disk-usage
Journals take up 3.8G on disk.
```

You can control the size of this directory using this parameter in your `/etc/systemd/journald.conf`:

```bash
SystemMaxUse=50M
```

You can force a log rotation:

```bash
$ sudo systemctl kill --kill-who=main --signal=SIGUSR2 systemd-journald.service
```

**NOTE:** You might need to restart the logging service  to force a log rotation, if the above signaling method does not do it.  You can restart the service like so:

```bash
$ sudo systemctl restart systemd-journald.service
```

---

Yes, the files from `/var/log/journal` directory can be removed.

The most nice method I've found is:

```bash
journalctl --vacuum-size=500M
```

which deletes old log-files from `/var/log/journal` until total size of the directory becomes under specified threshold (500 megabytes in this example).