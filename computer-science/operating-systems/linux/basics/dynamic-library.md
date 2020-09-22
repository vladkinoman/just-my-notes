# Dynamic library

## Shared library loading issue

**Issue:** 

`error while loading shared libraries: libpthread_rt.so.1: cannot open shared object file: No such file or directory`

**Short solution:**

This might happen if you have recently installed a shared library and didn't run ldconfig(8) afterwards. Do 'ldconfig', there's no harm in it. Running sudo ldconfig (assuming that libraries are in fact where they should be (/usr/bin/lib/, /usr/bin/include/, /usr/local/lib/ and /usr/local/include/)) can resolve that problem.

**In detail:**

Your library is a dynamic library. You need to tell the operating system where it can locate it at runtime.

To do so, we will need to do those easy steps:

1. Find where the library is placed if you don't know it.
   `sudo find / -name the_name_of_the_file.so`
2. Check for the existence of the dynamic library path environment variable(LD_LIBRARY_PATH)
   `$ echo $LD_LIBRARY_PATH`
   if there is nothing to be displayed, add a default path value (or not if you wish to)
   `$ LD_LIBRARY_PATH=/usr/local/lib`
3. We add the desire path, export it and try the application. Note that the path should be the directory where the path.so.something is. So if path.so.something is in /my_library/path.so.something it should be :
   `$ LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/my_library/`
   `$ export LD_LIBRARY_PATH`
   `$ ./my_app`
   source : http://www.gnu.org/software/gsl/manual/html_node/Shared-Libraries.html

Try a "ldconfig" command after exporting your library. You might need to execute this command as "sudo"

## References

1. https://stackoverflow.com/questions/480764/linux-error-while-loading-shared-libraries-cannot-open-shared-object-file-no-s