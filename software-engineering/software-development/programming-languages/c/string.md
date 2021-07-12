# String

## Why does strncpy not null terminate?

> [Source](https://stackoverflow.com/questions/1453876/why-does-strncpy-not-null-terminate).

> `strncpy()` supposedly protects from buffer overflows. But if it prevents an overflow without null terminating, in all likelihood a subsequent string operation is going to overflow. So to protect against this I find myself doing:
>
> ```c
> strncpy( dest, src, LEN );
> dest[LEN - 1] = '\0';
> ```
>
> ------
>
> `man strncpy` gives:
>
> > The `strncpy()` function is similar, except that not more than `n` bytes of `src` are copied. Thus, if there is no null byte among the first `n` bytes of `src`, the result will not be null-terminated.
>
> Without null terminating something seemingly innocent like:
>
> ```c
>    printf( "FOO: %s\n", dest );
> ```
>
> ...could crash.
>
> ------
>
> Are there better, safer alternatives to `strncpy()`?

`strncpy()` is not intended to be used as a safer `strcpy()`, it is supposed to be used to insert one string in the middle of another.

All those "safe" string handling functions such as `snprintf()` and `vsnprintf()` are fixes that have been added in later standards to mitigate buffer overflow exploits etc.

[Wikipedia](http://en.wikipedia.org/wiki/Strcpy#strncpy) mentions `strncat()` as an alternative to writing your own safe `strncpy()`:

```c
*dst = '\0';
strncat(dst, src, LEN);
```

**EDIT**

I missed that `strncat()` exceeds LEN characters when null terminating the string if it is longer or equal to LEN char's.

Anyway, the point of using `strncat()` instead of any homegrown solution such as `memcpy(..., strlen(...))`/whatever is that the implementation of `strncat()` might be target/platform optimized in the library.

Of course you need to check that dst holds at least the nullchar, so the correct use of `strncat()` would be something like:

```c
if (LEN) {
    *dst = '\0'; strncat(dst, src, LEN-1);
}
```

I also admit that `strncpy()` is not very useful for copying a substring into another string, if the src is shorter than n char's, the destination string will be truncated.

> "it is supposed to be used to insert one string in the middle of another" - no, it's intended to write a string into a fixed-width field, such as in a directory entry. That's why it pads the output buffer with NUL if (and only if) the source string is too short.

---

Originally, the [7th Edition UNIX](http://www.cs.bell-labs.com/7thEdMan/) file system (see DIR(5)) had directory entries that limited file names to 14 bytes; each entry in a directory consisted of 2 bytes for the inode number plus 14 bytes for the name, null padded to 14 characters, but not necessarily null-terminated. It's my belief that `strncpy()` was designed to work with those directory structures - or, at least, it works perfectly for that structure.

Consider:

- A 14 character file name was not null terminated.
- If the name was shorter than 14 bytes, it was null padded to full length (14 bytes).

This is exactly what would be achieved by:

```c
strncpy(inode->d_name, filename, 14);
```

So, `strncpy()` was ideally fitted to its original niche application. It was only coincidentally about preventing overflows of null-terminated strings.

(Note that null padding up to the length 14 is not a serious overhead - if the length of the buffer is 4 KB and all you want is to safely copy 20 characters into it, then the extra 4075 nulls is serious overkill, and can easily lead to quadratic behaviour if you are repeatedly adding material to a long buffer.)

---

There are already open source implementations like **strlcpy** that do safe copying.

http://en.wikipedia.org/wiki/Strlcpy

In the references there are links to the sources.

---

Strncpy is safer against stack overflow attacks by the **user** of your program, it doesn't protect you against errors **you** the programmer do, such as printing a non-null-terminated string, the way you've described.

You can avoid crashing from the problem you've described by limiting the number of chars printed by printf:

```c
char my_string[10];
//other code here
printf("%.9s",my_string); //limit the number of chars to be printed to 9
```

## C strndup implicit declaration

> [Source](https://stackoverflow.com/questions/46013382/c-strndup-implicit-declaration).

> I'm trying to use `strndup` function, but I get the error
>
> > error: implicit declaration of function 'strndup' [-Werror=implicit-function-declaration]
>
> I have searched around and found that it's not a standard function and therefore I have to compile with different flags. However, I receive same issue by compiling with the following:
>
> ```c
> -std=gnu11
> -Wall
> -Wextra
> -Werror
> -Wmissing-declarations
> -Wmissing-prototypes
> -Werror-implicit-function-declaration
> -Wreturn-type
> -Wparentheses
> -Wunused
> -Wold-style-definition
> -Wundef
> -Wshadow
> -Wstrict-prototypes
> -Wswitch-default
> -Wunreachable-code
> -D_GNU_SOURCE
> ```
>
> I'm doing an assignment and therefore I have to use all these, but what I found is that I have to compile with '-D_GNU_SOURCE' for the error to go away, but it doesn't.
>
> **EDIT:**
>
> I have these included as well:
>
> ```c
> #define __STDC_WANT_LIB_EXT2__ 1
> #include <string.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include "list.h"
> ```
>
> Would very much appreciate help to fix this.

The functions `strdup` and `strndup` are not yet part of Standard C. They are standardized in Posix.1-2008 and declared in `<string.h>` on Posix systems. Did you include `<string.h>`?

If your system does not provide these functions, you can define them yourself this way:

```c
#include <string.h>
#include <stdlib.h>

char *strdup(const char *s) {
    size_t size = strlen(s) + 1;
    char *p = malloc(size);
    if (p != NULL) {
        memcpy(p, s, size);
    }
    return p;
}

char *strndup(const char *s, size_t n) {
    char *p;
    size_t n1;

    for (n1 = 0; n1 < n && s[n1] != '\0'; n1++)
        continue;
    p = malloc(n + 1);
    if (p != NULL) {
        memcpy(p, s, n1);
        p[n1] = '\0';
    }
    return p;
}
```

---

### Requesting POSIX functions

You may find that you can 'activate' the declarations of `strndup()` et al by setting appropriate macros to request POSIX support:

```c
#define _XOPEN_SOURCE 700
```

That strictly is for the X/Open SUS (Single Unix Specification), but that's usually what you want. Strictly enabling only POSIX functionality would require:

```c
#define _POSIX_C_SOURCE 200809L
```

The `-std=gnu11` compiler option usually enables all these (and other special options) by default, so the fact that you're running into problems suggests you may not have the functions available regardless.

If you don't have [`strndup()`](http://pubs.opengroup.org/onlinepubs/9699919799/functions/strndup.html) available even with the enabling macros set before you include any headers, you can write your own version of the function. The tricky part is making the declaration available in a suitable header. However, as a band-aid, you could make it `static` in the only source file that needs it. It is also easiest to implement if you have [`strnlen()`](http://pubs.opengroup.org/onlinepubs/9699919799/functions/strnlen.html) available. If you don't have `strnlen()` either (a plausible problem), then you need to write that too, but the plain C version probably won't match the speed of an assembler version of `strnlen()` — or use `memchr()`.

### `strndup()`

```c
char *strndup(const char *str, size_t len)
{
    size_t act = strnlen(str, len);
    char *dst = malloc(act + 1);
    if (dst != 0)
    {
        memmove(dst, str, act);
        dst[act] = '\0';
    }
    return dst;
}
```

(I note that [chqrlie](https://stackoverflow.com/users/4593267/chqrlie) [shows](https://stackoverflow.com/a/46013943/) a neat alternative using `memchr()` instead of `strnlen()`.)

### `strnlen()`

```c
size_t strnlen(const char *str, size_t len)
{
    for (size_t size = 0; size < len; size++)
    {
        if (str[size] == '\0')
            return size;
    }
    return len;
}
```

## c - memcpy and pointers. Still work. Why?

> [Source](https://stackoverflow.com/questions/26817836/c-memcpy-and-pointers-still-work-why).

> # Context
>
> Fiddling with memcpy. Linux, 64 bits. gcc 4.8.x
>
> # Code
>
> ```c
> #include <stdio.h>
> #include <string.h>
> #include <stdlib.h>
> 
> void d(char ** restrict a, char ** restrict b){
> 
>     char r[20];
>     memcpy(r,*a, strlen(*a)+1);
> 
>     // it is the same thing as before since *c is equivalent to &r (or put simply r).
>     char *restrict c = malloc(20);
>     memcpy(c,*a, strlen(*a)+1);
> 
>     // that one bugs me. why b alone and not *b ??
>     // EDIT : this is incorrect
>     memcpy(b,*a, strlen(*a)+1);
> 
>     // EDIT : this is correct
>     memcpy(*b,*a, strlen(*a)+1);
> 
> 
>     printf("pointer c -> hey %s\n",c);
>     printf("array r -> hey %s\n",r);
> 
>     // EDIT : this is incorrect
>     printf("double pointer -> hey %s\n",b);
> 
>     // EDIT : this is correct
>     printf("double pointer -> hey %s\n",*b);
> }
> 
> int main(void)
> {
> 
>     char a[] = "YOU";
>     char * b = a;
>     char * c = malloc(20);
> 
>     d(&b, &c);
> 
> 
>     return 0;
> }
> ```
>
> # Question
>
> I would like to undertsand why memcpy doesn't complain about me passing double pointer to it, while it needs a pointer only.
>
> I know that with chars *b == &a == a and that an array is referenced by its first member up to '\0'. The problem really is with passing a double pointer to memcpy.
>
> why didn't I have to do
>
> ```c
> memcpy(*b, *a, strlen(*a)+1);
> ```
>
> since memcpy signature is
>
> ```c
> void * memcpy ( void * destination, const void * source, size_t num );
> ```
>
> and first argument is a "Pointer to the destination array where the content is to be copied, type-casted to a pointer of type void*", according to [cplusplus.com](http://www.cplusplus.com/reference/cstring/memcpy/).
>
> What is the "catch" here please ?
>
> Thanks a lot

Well, a double pointer is a single pointer to single pointer, so it can be passed to a function that expects a void pointer.

It is of course another thing whether or not your code is correct... It's not and works only by coincidence. Note that not only you use memcpy() to write to a wrong location, but you also print the same wrong location of memory as a string in your printf(). The "coincidence" here is that both of these "wrong" locations are the same, so you falsely assumed that it works fine.

Try to really print the right thing and you'll see the mayhem:

```c
printf("double pointer -> hey %s\n",*b);
```

---

Consider what would happen if you wanted to copy the representation of a pointer to another one, like this:

```c
char *p;
char *q = NULL;
memcpy(&p, &q, sizeof q);
```

should the compiler really complain in this case? **Nope.**

The point is that `void *` is untyped. It can point to **any** object type. It's not a constraint that a `void *` can't point to a pointer-to-pointer. It absolutely can.

As to why it "works": **It does not work.** It only appears to be working. Because of the invalid pointer operation, the code has undefined behavior, so it can do anything. In the better case, it crashes and makes the problem apparent. In your case, the error remained silent and the program was pretending it worked.

