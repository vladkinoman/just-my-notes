# Compose keys in Ubuntu 18.04

Compose keys are the keys which expand our keyboard and allow us to write Greek letters, arrows, mathematical symbols, etc.

In order to enable them in Ubuntu 18.04 u need to run Gnome-tweaks app [1].

Then hit `Keyboard & Mouse` on the left. In the `Keyboard` section on the right, an option to enable the compose key can be found.

Note that there are still limited options for what key can be set: `Scroll Lock`, `Right Alt`, `Caps Lock`, `PrtScn`, `Right Ctrl`, `Left Alt`, `Menu`, and `Right Super`.

>  I chose the `Right Alt` button which is called `Alt gr` because I have never used this key.

So, how do you know which keys you need to press to get the right character? 

Open the next file: `/usr/share/X11/locale/en_US.UTF-8/Compose`.  Use the search feature in your favorite editor to find the symbol. Search something like `arrow` and you will get something like:

```
<Multi_key> <less> <minus>  	: "←" U2190 # LEFTWARDS ARROW
<Multi_key> <minus> <greater> 	: "→" U2192 # RIGHTWARDS ARROW
```

So, in order to write down the "arrow" character you need to press `<Multi_key>` (compose key) which in my system is `Alt gr` , then you press `less` (<), and after that you press `minus` (-). You don't need to press all the keys at once.

To enable compose for Greek alphabet you need to create the new file in `home` directory, which is named as .XCompose, and add to it your own key combinations [2]. 

## Links

1. [How can I enable Compose key?](https://askubuntu.com/questions/70784/how-can-i-enable-compose-key#answer-70788)
2. [Enabling compose for Greek alphabet](https://askubuntu.com/questions/787113/compose-dead-greek-with-compose-key#answer-877344)