# Errors

## Variable-sized object may not be initialized

> [Source](https://stackoverflow.com/questions/3082914/c-compile-error-variable-sized-object-may-not-be-initialized).

> Why do I receive the error "Variable-sized object may not be initialized" with the following code?
>
> ```c
> int boardAux[length][length] = {{0}};
> ```

I am assuming that you are using a C99 compiler (with support for dynamically sized arrays). The problem in your code is that at the time when the compilers sees your variable declaration it cannot know how many elements there are in the array (I am also assuming here, from the compiler error that `length` is not a compile time constant).

You must manually initialize that array:

```c
int boardAux[length][length];
memset( boardAux, 0, length*length*sizeof(int) );
```

---

You receive this error because in C language you are not allowed to use initializers with variable length arrays. The error message you are getting basically says it all.

> **6.7.8 Initialization**
>
> ...
>
> 3 The type of the entity to be initialized shall be an array of unknown size or an object type that is not a variable length array type.

---

This gives error:

```c
int len;
scanf("%d",&len);
char str[len]="";
```

This also gives error:

```c
int len=5;
char str[len]="";
```

But this works fine:

```c
int len=5;
char str[len]; //so the problem lies with assignment not declaration
```

You need to put value in the following way:

```c
str[0]='a';
str[1]='b'; //like that; and not like str="ab";
```

---

After declaring the array

```c
int boardAux[length][length];
```

the simplest way to assign the initial values as zero is using for loop, even if it may be a bit lengthy

```c
int i, j;
for (i = 0; i<length; i++)
{
    for (j = 0; j<length; j++)
        boardAux[i][j] = 0;
}
```

> `memset` is simpler and faster.

## Double free or corruption

> [Source](https://stackoverflow.com/questions/2902064/how-to-track-down-a-double-free-or-corruption-error).

> When I run my (C++) program it crashes with this error.
>
> > *** glibc detected \*** ./load: double free or corruption (!prev): 0x0000000000c6ed50 ***
>
> How can I track down the error?
>
> I tried using print (`std::cout`) statements, without success. Could `gdb` make this easier?
>
> > I wonder why everybody suggests to `NULL` pointers (which masks errors which are otherwise caught, as this question nicely shows), but nobody suggests to simply not to do manual memory management at all, which is very well possible in C++. I haven't written `delete` in years. (And, yes, my code is performance-critical. Otherwise it wouldn't have been written in C++.)
> >
> > > Heap corruption and the like are rarely caught, at least not where they happen. `NULL`ing pointers might make your program crash earlier.

There are at least two possible situations:

1. you are deleting the same entity twice
2. you are deleting something that wasn't allocated

For the first one I strongly suggest NULL-ing all deleted pointers.

You have three options:

1. overload new and delete and track the allocations
2. yes, use gdb -- then you'll get a backtrace from your crash, and that'll probably be very helpful
3. as suggested -- use Valgrind -- it isn't easy to get into, but it will save you time thousandfold in the future...

---

Three basic rules:

1. Set pointer to `NULL` after free
2. Check for `NULL` before freeing.
3. Initialise pointer to `NULL` in the start.

Combination of these three works quite well.

> Strictly speaking I think #2 is unnecessary as most compilers will allow you to try to delete a null pointer without this causing a problem. I'm sure someone will correct me if I'm wrong. :)
>
> > I think that freeing NULL is required by the C standard to do nothing.

---

If you're using glibc, you can set the `MALLOC_CHECK_` environment variable to `2`, this will cause glibc to use an error tolerant version of `malloc`, which will cause your program to abort at the point where the double free is done.

You can set this from gdb by using the `set environment MALLOC_CHECK_ 2` command before running your program; the program should abort, with the `free()` call visible in the backtrace.

see the [man page for `malloc()`](http://linux.die.net/man/3/malloc) for more information

---

You can use gdb, but I would first try [Valgrind](http://valgrind.org/). See the [quick start guide](http://valgrind.org/docs/manual/QuickStart.html).

Briefly, Valgrind instruments your program so it can detect several kinds of errors in using dynamically allocated memory, such as double frees and writes past the end of allocated blocks of memory (which can corrupt the heap). It detects and reports the errors *as soon as they occur*, thus pointing you directly to the cause of the problem.

---

With modern C++ compilers you can use **sanitizers** to track.

...

## Why am I getting a double free or corruption error with realloc()?

> [Source](https://stackoverflow.com/questions/1145/why-am-i-getting-a-double-free-or-corruption-error-with-realloc).

As a general rule, you should **never** do a free or realloc on a user provided buffer. You don't know where the user allocated the space (in your module, in another DLL) so you cannot use any of the allocation functions on a user buffer.

Provided that you now cannot do any reallocation within your function, you should change its behavior a little, like doing only one replacement, so the user will be able to compute the resulting string max length and provide you with a buffer long enough for this one replacement to occur.

Then you could create another function to do the multiple replacements, but you will have to allocate the whole space for the resulting string and copy the user input string. Then you must provide a way to delete the string you allocated.

Resulting in:

```c
void  strrep(char *input, char *search, char *replace);
char* strrepm(char *input, char *search, char *replace);
void  strrepmfree(char *input);
```

---

I'm interested that no-one has commented explicitly on the memory leak in the original design, or the off-by-one error. And it was observing the memory leak that tells me exactly why you are getting the double-free error (because, to be precise, you are freeing the same memory multiple times - and you are doing so after trampling over the already freed memory).

Before conducting the analysis, I'll agree with those who say your interface is less than stellar; however, if you dealt with the memory leak/trampling issues and documented the 'must be allocated memory' requirement, it could be 'OK'.

What are the problems? Well, you pass a buffer to realloc(), and realloc() returns you a new pointer to the area you should use - and you ignore that return value. Consequently, realloc() has probably freed the original memory, and then you pass it the same pointer again, and it complains that you're freeing the same memory twice because you pass the original value to it again. This not only leaks memory, but means that you are continuing to use the original space -- and John Downey's shot in the dark points out that you are misusing realloc(), but doesn't emphasize how severely you are doing so. There's also an off-by-one error because you do not allocate enough space for the NUL '\0' that terminates the string.

The memory leak occurs because you do not provide a mechanism to tell the caller about the last value of the string. Because you kept trampling over the original string plus the space after it, it looks like the code worked, but if your calling code freed the space, it too would get a double-free error, or it might get a core dump or equivalent because the memory control information is completely scrambled.

Your code also doesn't protect against indefinite growth -- consider replacing 'Noel' with 'Joyeux Noel'. Every time, you would add 7 characters, but you'd find another Noel in the replaced text, and expand it, and so on and so forth. My fixup (below) does not address this issue - the simple solution is probably to check whether the search string appears in the replace string; an alternative is to skip over the replace string and continue the search after it. The second has some non-trivial coding issues to address.

So, my suggested revision of your called function is:

```c
char *strrep(char *input, char *search, char *replace) {
    int searchLen = strlen(search);
    int replaceLen = strlen(replace);
    int delta = replaceLen - searchLen;
    char *find = input;

    while ((find = strstr(find, search)) != 0) {
        if (delta > 0) {
            input = realloc(input, strlen(input) + delta + 1);
            find = strstr(input, search);            
        }

        memmove(find + replaceLen, find + searchLen, strlen(input) + 1 - (find - input));
        memmove(find, replace, replaceLen);
    }

    return(input);
}
```

This code does not detect memory allocation errors - and probably crashes (but if not, leaks memory) if realloc() fails. See Steve Maguire's 'Writing Solid Code' book for an extensive discussion of memory management issues.s