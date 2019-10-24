# Ranger configuration

## Show hidden files by default

1. Open the rc.conf file
2. Find the next line and set its value to true: `set show_hidden true`.

## Changing the default document viewer

For text files rifle (ranger's file opener) uses your default `$EDITOR`. You can set it to Sublime Text by adding the line `export EDITOR=subl` to your `~/.bashrc` or equivalent.

For other file types you can configure rifle with the file `~/.config/ranger/rifle.conf`. First copy the defaults with `ranger --copy-config=rifle`. Then rearrange the programs (or add more) in the appropriate section so that your preferred application is at the top. For instance, add the next line at the top in order to use Typora as the default editor for .md and .markdown files:`ext md|markdown = typora "$@"`.

## References

[How to change the default document viewer in ranger?](https://superuser.com/questions/1234893/how-to-change-the-default-document-viewer-in-ranger)