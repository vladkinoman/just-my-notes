# Ranger configuration

## Show hidden files by default

1. Open the rc.conf file
2. Find the next line and set its value to true: `set show_hidden true`.

## Changing the default document viewer

For text files rifle (ranger's file opener) uses your default `$EDITOR`. You can set it to Sublime Text by adding the line `export EDITOR=subl` to your `~/.bashrc` or equivalent.

For other file types you can configure rifle with the file `~/.config/ranger/rifle.conf`. First copy the defaults with `ranger --copy-config=rifle`. Then rearrange the programs (or add more) in the appropriate section so that your preferred application is at the top. For instance, add the next line at the top in order to use Typora as the default editor for .md and .markdown files:`ext md|markdown = typora "$@"`.

> How to change the default text editor not in ranger?
>
> If you are using BASH, add the following to your .bashrc :
>
> ```bash
>  export VISUAL=vim; # or "subl"
>  export EDITOR=vim;
> ```

**You don't have to edit `.bashrc`, only the ranger config. Here is how:**

After startup, ranger creates a directory `~/.config/ranger`.

You want to edit the `rifle.conf` file. Rifle is the program that chooses what to open files with. To copy the default configuration for rifle to this directory, issue the following command:

```
$ ranger --copy-config=rifle.conf
```

(Alternatively, add all of rangers config files with `$ ranger --copy-config=all`)

In `rifle.conf`, find this part. Change the `$EDITOR` variable on the two lines below:

```
#-------------------------------------------
# Misc
#-------------------------------------------
# Define the "editor" for text files as first action
mime ^text,  label editor = $EDITOR -- "$@"
mime ^text,  label pager  = "$PAGER" -- "$@"
!mime ^text, label editor, ext xml|json|csv|tex|py|pl|rb|js|sh|php = $EDITOR -- "$@"
!mime ^text, label pager,  ext xml|json|csv|tex|py|pl|rb|js|sh|php = "$PAGER" -- "$@"
```

Change it to whatever you want to edit text files with, like `vim`. I use Kakoune, so I change it to `kak`:

```
#-------------------------------------------
# Misc
#-------------------------------------------
# Define the "editor" for text files as first action
mime ^text,  label editor = kak -- "$@"
mime ^text,  label pager  = "$PAGER" -- "$@"
!mime ^text, label editor, ext xml|json|csv|tex|py|pl|rb|js|sh|php = kak -- "$@"
!mime ^text, label pager,  ext xml|json|csv|tex|py|pl|rb|js|sh|php = "$PAGER" -- "$@"
```

This was done on ranger version 1.8.1.

## References

1. [How to change the default document viewer in ranger?](https://superuser.com/questions/1234893/how-to-change-the-default-document-viewer-in-ranger)
2. https://unix.stackexchange.com/questions/367452/how-to-change-the-default-text-editor-in-ranger