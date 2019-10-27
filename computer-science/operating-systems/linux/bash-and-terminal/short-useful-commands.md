# Short useful commands

## Logs

This will show the last of the logs of the previous boot:

```bash
$ journalctl -b -1 -e
```

You don't have to wait for the next crash. `journalctl --list-boots` will list boots (and their time/date), and you can adjust the `-b #` of `journalctl -b -1 -e` to select one.

