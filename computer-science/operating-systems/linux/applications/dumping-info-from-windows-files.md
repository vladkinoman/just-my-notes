# Dumping info from Windows files

## Dump information from a Windows *.lnk shortcut

> Source: [link](https://superuser.com/questions/782135/how-do-i-dump-information-from-a-windows-lnk-shortcut-on-linux).

You can use the `lnkinfo` tool from [liblnk](https://github.com/libyal/liblnk) (`liblnk-utils` package in Debian):

```bash
lnkinfo <file.lnk>
```

Example usage in scripts:

```bash
LOCAL_PATH=$(lnkinfo "$1" | grep 'Local path' | cut -d':' -f2-)
ARGS=$(lnkinfo "$1" | grep 'Command line arguments' | cut -d':' -f2-)
```

Example output:

```bash
$ lnkinfo 'Program Files - Shortcut.lnk'
lnkinfo 20171101

Windows Shortcut information:
        Contains a link target identifier
        Contains a relative path string

Link information:
        Creation time           :
        ...
        File size           : 12288 bytes
        Icon index          : 0
        Show Window value       : 0x00003000
        Hot Key value           : 12288
        File attribute flags        : 0x00000011
                Is read-only (FILE_ATTRIBUTE_READ_ONLY)
                Is directory (FILE_ATTRIBUTE_DIRECTORY)
        Drive type          : Fixed (3)
        Drive serial number     : 0x0e1909c6
        Volume label            : Local Disk
        Local path          : C:\Program Files
        Relative path           : ..\..\..\Program Files

Link target identifier:
...
```

---

There are two Perl scripts that kinda work.

**[lslnk.pl](https://pastebin.com/5uJ8ypBP)** and **[lnk-parse](http://sourceforge.net/projects/jafat/files/lnk-parse/lnk-parse-1.0/lnk-parse-1.0.tar.gz/download)**

Use them like this: `<whicheverscript> Name.lnk`

> `lnk-parse-1.0.pl` seem to work better than `lslnk.pl`.