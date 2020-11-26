# Change login screen background

## Change Ubuntu Budgie login screen background

The best way to do this:

step1: make backup of the file `/usr/share/gnome-shell/theme/ubuntu.css` - if you have another desktop for ubuntu you can find file `ubuntu.css` just using command locate ==> locate `ubuntu.css`

step2: `vim /usr/share/gnome-shell/theme/ubuntu.css` and find part below

```CSS
#lockDialogGroup {
   background: #2c001e url(resource:///org/gnome/shell/theme/noise-texture.png);
   background-repeat: repeat; }
```

step3: change it to

```CSS
#lockDialogGroup {
   background: #2c001e url(file:///usr/share/backgrounds/warty-final-ubuntu.png);
   background-repeat: no-repeat;
   background-size: cover;
   background-position: center;
    }
```

## References

1. https://askubuntu.com/questions/1042942/how-to-change-ubuntu-budgie-login-screen-background