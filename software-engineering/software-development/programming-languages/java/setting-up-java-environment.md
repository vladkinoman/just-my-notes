# Setting up Java environment

> WIKI: an *environment variable* is a dynamic-named value that can affect the way running processes will behave on a computer.

## How to set up JDK on Windows

1. Register on Oracle website
2. Dowload latest version of JDK. It is important to download latest version because there is a 3d party software which requires it.
3. Install the JDK by clicking on the .exe file.
4. Set up the "JAVA_HOME" environment variable:
   1. Go to the Control Panel -> System and Security -> System.
   2. Open the Advanced tab and select Environment Variables.
   3. Add a New user variable with the name "JAVA_HOME" and value `C:\Program Files\Java\jdk-12.0.2` (your jdk).
   4. Click OK.
5. Now we need to add this variable to the Path:
   1. Edit the Path variable in System Variables
   2. Add next line to the begginning of the Path: `%JAVA_HOME%\bin;`.
   3. Click OK.
6. Click OK again.
7. Check installation status by putting next line in your terminal: `~ java -version`. Don't forget to reopen your terminal to give it a chance to reaload the environment variables again.

After that if you get an error about missing java.exe you should check if there is an other version of Java on your PC, delete it from the disk, remove it from the environment variables especially from the Path and reinstall your JDK.

## Setting up CLASSPATH variable for .jar files inclusion on Windows (+using Linux environment)

1. Go to the Control Panel -> System and Security -> System.
2. Open the Advanced tab and select Environment Variables.
3. Add a New user variable with the name "CLASSPATH" and value `D:\Software\3rd-party-software\Libraries\algs4.jar` (your jar file).

And now you can use it *during the compilation and execution of your Java programs* [in other words: when compiling and running your Java programs]:

```sh
>javac -cp ".;%CLASSPATH%" CollidingDisks.java
>java -cp ".;%CLASSPATH%" CollidingDisks 20
```

If you compile in Linux environment (eg. MINGW):

```sh
$javac -cp ".;$CLASSPATH" CollidingDisks.java
$java -cp ".;$CLASSPATH" CollidingDisks 20
```

Notice that I use ";" sign in MINGW (even when it is a Linux environment), but for Linux it is correct to use ":" [1]. 

## Setting up CLASSPATH variable for .jar files inclusion on Linux

Sure, we can set up the CLASSPATH variable every time we enter the terminal using this command:

```Bash
$ export CLASSPATH="/media/vlad/Storage/Software/Programming Tools/Libraries/algs4.jar"
```

But we can do this easier by setting up the CLASSPATH variable in the `/etc/environment` file. Just add the following line at the end of that file:

```Bash
CLASSPATH="/media/vlad/Storage/Software/Programming Tools/Libraries/algs4.jar"
```

We can also add CLASSPATH to the end of the `~/.bashrc` if, for example, our Linux system doesn't support `/etc/environment` file by default [2].

> I found somewhere on the Internet that I should not assign CLASSPATH as a global variable in that way. TODO: find out why.

### Problem with CLASSPATH variable

If we set up CLASSPATH variable, and we want to run the program from the directory where the .class file is, then we get the next error:

```bash
$ Error: Could not find or load main class FooBar
```

To fix that problem we can make sure CLASSPATH include current directory. (dot). You can include it as set `CLASSPATH=%CLASSPATH%;.` in Windows and `export CLASSPATH = ${CLASSPATH}:.` (see the separator, in Windows it's;(semicolon) while in Linux it is (colon), also note we have included current directory in existing classpath. If you still face the issue of setting classpath, see this step by step guide to set the classpath. Same thing applies if you are running your program using `-cp` or `-classpath` option.

Although, I didn't included folder in the CLASSPATH. I just added `-cp ""` and run the program in the directory with the .class file ¯\_(ツ)_/¯:

```bash
$ java -cp "" FooBar
```

I think it means "search in the current directory".

## Using .jar files in IntelliJ IDEA

1. File -> Project Structure -> Modules
2. Go to Dependencies and add (+) existing .jar file.
3. Don't forget to Export this file.

## Links

1. [The classpath syntax is OS-dependent](https://stackoverflow.com/questions/4528438/classpath-does-not-work-under-linux#answer-4528456)
2. [How to set JAVA_HOME for Java?](https://askubuntu.com/questions/175514/how-to-set-java-home-for-java#answer-175547)
3. [Error: Could not find or load main class in Java](https://javarevisited.blogspot.com/2015/04/error-could-not-find-or-load-main-class-helloworld-java.html)																																																																																																																									