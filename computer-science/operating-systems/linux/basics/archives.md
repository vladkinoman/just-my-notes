# Archives

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

## Viewing contents of a .jar file

A **JAR** (Java ARchive) is a package **file** format typically used to aggregate many Java class **files** and associated metadata and resources (text, images, etc.) into one **file** for distribution. **JAR files** are archive **files** that include a Java-specific manifest **file**. They are built on the ZIP format and typically have a .

There three ways to view the contents of a .jar file. In short, you can read about it here.

> Notice that .jar is similar to .zip.

### Using jar and javap 

In order to list all the contents of a particular jar file without exploding them on to the hard disk, we can use the `jar` command:

```bash
$ jar tf algs4.jar
```

This will print out all the files inside the jar file myjarfile.jar. Now, we do a search over the file names using `grep`. For this we are going to pipe the output of the `jar` command above as the input of the `grep` command:

```Bash
$ jar tf algs4.jar | grep -i Stack
```

> `tvf` (with 'v') gives us more detailed list.

Example:

```Bash
$ jar tf algs4.jar | grep -i Stack
edu/princeton/cs/algs4/Stack$ListIterator.class
edu/princeton/cs/algs4/LinkedStack.class
edu/princeton/cs/algs4/LinkedStack.java.html
edu/princeton/cs/algs4/LinkedStack.java
edu/princeton/cs/algs4/Stack$1.class
edu/princeton/cs/algs4/ResizingArrayStack.java
edu/princeton/cs/algs4/Stack$Node.class
edu/princeton/cs/algs4/LinkedStack$1.class
edu/princeton/cs/algs4/ResizingArrayStack.java.html
edu/princeton/cs/algs4/Stack.java.html
edu/princeton/cs/algs4/LinkedStack$ListIterator.class
edu/princeton/cs/algs4/Stack.java
edu/princeton/cs/algs4/Stack.class
edu/princeton/cs/algs4/LinkedStack$Node.class
edu/princeton/cs/algs4/ResizingArrayStack.class
edu/princeton/cs/algs4/ResizingArrayStack$ReverseArrayIterator.class
```

Now we can use `javap` command which will give us more details from a particular class file.

In short, javap is a class file disassembler. A disassembler is a program that converts machine code into low-level symbolic code. Since this command disassembles the Java class file, we'll call it our Java disassembler. This command basically tells us that what is inside the class file. This command is pretty useful when we work in a restricted zone and aren't allowed to get a decompiler.

First, we need to set up CLASSPATH environment variable for our .jar file:

```Bash
$ export CLASSPATH="/media/vlad/Storage/Software/Programming Tools/Libraries/algs4.jar"
```

Now, we can find our file and print out a short info about the methods in it:

```bash
$ javap edu/princeton/cs/algs4/Stack
Compiled from "Stack.java"
public class edu.princeton.cs.algs4.Stack<Item> implements java.lang.Iterable<Item> {
  public edu.princeton.cs.algs4.Stack();
  public boolean isEmpty();
  public int size();
  public void push(Item);
  public Item pop();
  public Item peek();
  public java.lang.String toString();
  public java.util.Iterator<Item> iterator();
  public static void main(java.lang.String[]);
}
```

If we don't want to set up CLASSPATH variable, then we can use `-cp` (or `-classpath`) flag in `javap`:

```Bash
javap -cp "/media/vlad/Storage/Software/Programming Tools/Libraries/algs4.jar" edu/princeton/cs/algs4/Stack
```

> **Spaces in path**. We don't have to use "" - just change line to `/media/vlad/Storage/Software/Programming\ Tools/Libraries/algs4.jar`. In that way we can even set up CLASSPATH variable:
>
> ```bash
> $ export CLASSPATH=/media/vlad/Storage/Software/Programming\ Tools/Libraries/algs4.jar
> $ javap edu/princeton/cs/algs4/Stack 
> Compiled from "Stack.java"...
> ```
>
> Notice that CLASSPATH with quotes and backslash won't work:
>
> ```bash
> $ export CLASSPATH="/media/vlad/Storage/Software/Programming\ Tools/Libraries/algs4.jar"
> $ echo $CLASSPATH
> /media/vlad/Storage/Software/Programming\ Tools/Libraries/algs4.jar
> $ javap edu/princeton/cs/algs4/Stack 
> Error: class not found: edu/princeton/cs/algs4/Stack
> ```
>
> So, we use CLASSPATH with either quotes or backslash in our path.

### Using Vim

Here is how to view the contents of a .jar file with Vim.

```bash
$ vim algs4.jar
```

Vim editor contains a Zip script (zip.vim) which allows you to browse .zip file directly, which is also valid for .jarfiles. To enter into a file, you need to select a file with cursor and press `Enter` key:

```
edu/princeton/cs/algs4/RedBlackBST.class
edu/princeton/cs/algs4/FrequencyCounter.java.html
edu/princeton/cs/algs4/GaussianElimination.java
edu/princeton/cs/algs4/Co|u|nter.java <---------- here is the cursor, press Enter key
edu/princeton/cs/algs4/LookupCSV.java
edu/princeton/cs/algs4/DijkstraUndirectedSP.class
edu/princeton/cs/algs4/SegmentTree.class
```

You can find whatever you want using the next command: `:vimgrep /int someFunction()/ ../**/*.java`[[link](https://stackoverflow.com/questions/20803550/find-files-with-grep-and-open-in-editor)]. If you want to go back, press the following combination: `CTRL-^`[[link](https://stackoverflow.com/questions/19971023/how-to-go-back-to-previous-opened-file-in-vim)].

> Also, there is an interesting way to print all the files you need from that archive but I couldn't find the script. Here is the info on how to do it with tar: [link](https://stackoverflow.com/questions/13983365/grep-from-tar-gz-without-extracting-faster-one).

You can edit it and save (:x), too.

Now, suppose you need to find a file, for example, "Stack". In normal mode you can search forwards by pressing `/` (or `<kDivide>`) then typing your search pattern [5]. In our case this could be `/Stack`. Our cursor points out first occurrence of a word Stack. Press `Enter`. Now, we want to find the next occurrence. In order to do this press `*` button as it was mentioned in [5].

> The other buttons would be next: `n` to search for the next occurrence or uppercase `N` to search in the opposite direction. Found this one [here](https://linuxize.com/post/vim-search/).

Lets suppose that we want to sort .jar file in Vim editor. You can actually do it the following way:

- Make the buffer modifiable [6]:

  ```
  :set ma
  ```

- Sort the contents [7]:

  ```
  :%!sort
  ```

In order to view the contexts of a file press `Enter` key. To go back, press the key combination `<Ctrl>+<O>`.

### Using unzip 

Using unzip command [4]: extract files to stdout / screen with the name of each file printed. Similar to `-p`. Here’s an example of displaying content of Stack.java:

```Bash
$ unzip -c algs4.jar edu/princeton/cs/algs4/Stack.java
Archive:  algs4.jar
  inflating: edu/princeton/cs/algs4/Stack.java  
/******************************************************************************
 *  Compilation:  javac Stack.java
 *  Execution:    java Stack < input.txt
 *  Dependencies: StdIn.java StdOut.java
 *  Data files:   http://algs4.cs.princeton.edu/13stacks/tobe.txt
```

Now, we extract files to pipe (`-p`) (stdout). Nothing but the file data is sent to stdout (only?), and the files are always extracted in binary format, just as they are stored (no conversions). There is also no file name to be printed.

```Bash
$ unzip -p algs4.jar edu/princeton/cs/algs4/Stack.java
/******************************************************************************
 *  Compilation:  javac Stack.java
 *  Execution:    java Stack < input.txt
 *  Dependencies: StdIn.java StdOut.java
 *  Data files:   http://algs4.cs.princeton.edu/13stacks/tobe.txt
```

### Bonus: archive and extract files

Lets consider the next example. We compile the source code and use command `jar` to create (`c`) a .jar file, which will include 3 files: the class file, the txt and the README. The created .jar will be stored in relative filepath (`f`) app.jar. The entire process will be done in verbose mode (`v`).

```Bash
$ javac App.java
$ jar cvf app.jar App.class README.md docs
added manifest
adding: App.class(in = 412) (out= 288)(deflated 30%)
adding: README.md(in = 45) (out= 47)(deflated -4%)
adding: docs/(in = 0) (out= 0)(stored 0%)
adding: docs/foo.txt(in = 4) (out= 6)(deflated -50%)
```

Extracting (`x`) one file from .jar can be done using `jar`, where you need to provide the file path `f` of the .jar and the target files to extract:

```Bash
$ jar xf app.jar README.md
```


Without the target files to extract, command `jar`will extract all files in the current directory:

```Bash
$ jar xf app.jar
```

## References

1. https://stackoverflow.com/questions/9289734/linux-how-to-add-a-file-to-a-specific-folder-within-a-zip-file
2. https://www.wikiwand.com/en/JAR_(file_format)#:~:text=A%20JAR%20(Java%20ARchive)%20is,format%20and%20typically%20have%20a%20.
3. [Linux: what is a most convenient way to see the contents of .jar file](https://superuser.com/questions/417589/linux-what-is-a-most-convenient-way-to-see-the-content-of-jar-file)
4. [searching for classes inside java archive files (jar files) from the command line](https://www.lostsaloon.com/technology/searching-for-classes-inside-jar-archive-files/)
5. [Viewing contents of a .jar file - using jar and javap + many GUI methods](https://stackoverflow.com/questions/320510/viewing-contents-of-a-jar-file/42365315#answer-321029)
6. [Viewing the Contents of JAR](https://mincong-h.github.io/2019/04/30/viewing-the-contents-of-jar/)
7. [Searching in Vim](https://vim.fandom.com/wiki/Searching)
8. [vim “modifiable” is off](https://stackoverflow.com/questions/5745506/vim-modifiable-is-off#answer-9706469)
9. [sort rows in 'VI' editor = sort the whole line alphabetically](https://stackoverflow.com/questions/3861503/sort-rows-in-vi-editor#answer-3861516)

Code library using in examples: [algs4](https://algs4.cs.princeton.edu/code/)