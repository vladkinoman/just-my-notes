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

## Enabling the compose keys in Lubuntu

> According to [3].

1. Right click at the keyboard “flag” icon on your panel and choose “settings”.
2. Go to “Advanced xkbdmap Options” and place the string “compose:” (without quotes) followed by the key you want to use. These are the available keys (in te example below I chose the Right Win key):
   - compose:ralt  Right Alt
   - compose:lwin  Left Win
   - compose:rwin  Right Win

3. Now ensure to click at the “save” icon next to the text you’ve just intruduced and close this dialog. You can start using it right now, without restart!

> For example, write `<compose_key>+<->+<>>` to get the "→" symbol.

## Links

1. [How can I enable Compose key?](https://askubuntu.com/questions/70784/how-can-i-enable-compose-key#answer-70788)
2. [Enabling compose for Greek alphabet](https://askubuntu.com/questions/787113/compose-dead-greek-with-compose-key#answer-877344)
3. [Compose key - tips on the Lubuntu website](https://lubuntu.me/tip-compose-key/)
