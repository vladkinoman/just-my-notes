# Errno

## How to set errno value?

> [Source](https://stackoverflow.com/questions/11699596/how-to-set-errno-value).

> I have two calls to two different methods :
>
> ```c
> void func1() 
> {
>   // do something 
>   if (fail) 
>   {
>     // then set errno to EEXIST
> 
>   }
> 
> }
> ```
>
> And the second method :
>
> ```c
> void func2() 
> {
>   // do something 
>   if (fail) 
>   {
>     // then set errno to ENOENT
> 
>   }
> 
> }
> ```
>
> 1. When I set the `errno` to some value , what does it do ? just error checking ?
> 2. How can I set `errno` in the above methods `func1` and `func2` to `EEXIST` and `ENOENT`

For all practical purposes, you can treat `errno` like a global variable (although it's usually not). So include `errno.h` and just use it:

```c
errno = ENOENT;
```

------

You should ask yourself if `errno` is the best error-reporting mechanism for your purposes. Can the functions be engineered to return the error code themselves ?

> Conventionally, `errno` is used for reporting *system errors*. Do you feel thay your library or your code is part of the system? If not, use another mechanism to report errors. 

> Not necessarily, utility functions like strtol() also seem to return ERANGE, for example, that is not really a *system error*.

> An example of place it may be appropriate to set errno would be in a read or write function callback passed to funopen(). In this case your implementation is expected to match the contract of a system call (read() or write()) so it would make sense to return -1 in case of error and set errno with the specific error.

---

IMO, the standard `errno` designed for system level. My experience is do not pollute them. If you want to simulate the C standard `errno` mechanism, you can do some definition like:

```c
/* your_errno.c */
__thread int g_your_error_code;

/* your_errno.h */
extern __thread int g_your_error_code
#define set_your_errno(err) (g_your_error_code = (err))
#define your_errno (g_your_error_code)
```

and also you can still implement `your_perror(err_code)`. More information, please refer to *glibc*'s implementation.

