# Setting up Java environment

> WIKI: an *environment variable* is a dynamic-named value that can affect the way running processes will behave on a computer.

## How to set up JDK on Windows

1. Register on Oracle website
2. Dowload latest version of JDK. It is important to download latest version because there is a 3d party software which requires it.
3. Install JDK by clicking on .exe file.
4. Set up "JAVA_HOME" environment variable:
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

## Setting up CLASSPATH variable for .jar files inclusion on Windows (+using Linux bash)

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

## Using .jar files in IntelliJ IDEA

1. File -> Project Structure -> Modules
2. Go to Dependencies and add (+) existing .jar file.
3. Don't forget to Export this file.
