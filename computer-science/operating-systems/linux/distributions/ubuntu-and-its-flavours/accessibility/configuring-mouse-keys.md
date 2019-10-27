# Configuring mouse keys instead of touch-pad on Ubuntu 18.04

If yours touch-pad is dead, then this is the best solution for. Of course, this will work if you have numpad on your PC:

1.  `Super` -> "Settings" -> "Universal Access" -> In the "Point and Clicking" section find the "Mouse buttons" switch and turn it on [1].

2. Next, you need to speed your mouse cursor because it is really slow on some machines [2]. Open the terminal and enter the following commands:

   ```Bash
   $ sudo apt-get install xkbset
   $ xkbset ma 60 10 10 5 2
   ```

In order to do this on Lubuntu we need to add one extra line:

```bash
$ xkbset m
$ xkbset ma 60 10 10 5 2
```

## Conclusion

So, we set up our numpad as our new mouse. We also can use it to select a text and open the right-click menu using `5` button on the numpad. For more information, see this [3].

## References

1. [How can I configure “mousekeys”?](https://askubuntu.com/questions/68807/how-can-i-configure-mousekeys#answer-69892)
2. [Mouse Arrow moving Slowly Using keyboard Keys Ask](https://askubuntu.com/questions/195000/mouse-arrow-moving-slowly-using-keyboard-keys#answer-953037)
3. [Help Ubuntu - Click and move the mouse pointer using the keypad](https://help.ubuntu.com/stable/ubuntu-help/mouse-mousekeys.html.en)