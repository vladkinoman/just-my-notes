# Run programs in background from terminal

I've recently come to like `setsid`. It starts off looking like you're just running something from the terminal but you can disconnect (close the terminal) and it just keeps going.

This is because the command actually forks out and while the input comes through to the current terminal, it's owned by a completely different parent (that remains alive after you close the terminal).

An example:

```bash
setsid gnome-calculator
```

We can use "&" instead of setsid:

```Bash
gnome-calculator &
```

I think it works the same way. TODO: check it.

## Source

​	https://askubuntu.com/questions/106351/running-programs-in-the-background-from-terminal