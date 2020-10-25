# Working with archives

## Add a file to a specific folder within a zip file

If you need to add the file to the same folder as in the original directory hierarchy, then you just need to add the full path to it:

```bash
zip -g xxx.zip folder/file
```

> `-g` means Grow (append  to) the specified zip archive, according to manual.

Otherwise, probably the easiest way to do that is to create the same layout you need in the zip file in a temporary directory.

---

You can use a lower level library, such as the one that comes with Python:

```bash
#!/bin/bash
python -c '
import zipfile as zf, sys
z=zf.ZipFile(sys.argv[1], "a")
z.write(sys.argv[2], sys.argv[3])
z.close()
' myfile.zip source/dir/file.txt dir/in/zip/file.txt
```

This will open `myfile.zip` and add `source/dir/file.txt` from the file system as `dir/in/zip/file.txt` in the zip file.

## References

1. https://stackoverflow.com/questions/9289734/linux-how-to-add-a-file-to-a-specific-folder-within-a-zip-file