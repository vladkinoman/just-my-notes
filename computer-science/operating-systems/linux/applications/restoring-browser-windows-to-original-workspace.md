# Restoring browser windows to original workspace

>  According to the answer on [this question](https://unix.stackexchange.com/questions/158058/restore-chromium-firefox-windows-to-original-workspace-desktop).

What you can do **outside** of Firefox and Chrome, if the active TABs in different browser windows point to different URLs, is to use tendency that different URLs usually have different titles associated with the pages and hence with the window in which they are displayed.

Starting with that idea you can use the output of `wmctrl -l -G -p` which provides you with

- window id
- workspace number
- process id
- x,y position of window
- width and height of window
- machine name
- window title (if any)

for each window. Given a process id PID you can see where the link `/proc/PID/exe` points to and filter out non-browser windows. For the browser related windows, save at least the window title and workspace number (possible also the browser type and all the other information).

After a browser (re-)start, when all the windows are restored, but on in one workspace, use the saved data to lookup the new window id, WID, associated with a specific title and push it to the retrieved related workspace with `wmctrl -i -r WID -t workspacenumber`.

------

If you don't want to implement the above yourself (it is mostly text processing and a symlink lookup) in your shell or scripting language of choice, you can [download](https://bitbucket.org/ruamel/bws) a program that does all this for you (and a bit more). Or you can install it from [PyPI](https://pypi.python.org/pypi/ruamel.bws/) using:

```bash
$ sudo pip install ruamel.bws
```

after which the `bws` command should be available with options to `save` (multiple saves are kept, 10 by default), `list` (show the saved dates with number of windows saved), or `restore` (by default the latest saved info).