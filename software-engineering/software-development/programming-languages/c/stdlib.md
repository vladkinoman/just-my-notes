# stdlib

## malloc

### Using malloc(0) and memcpy

> [Source](https://stackoverflow.com/questions/24727128/using-malloc0-and-memcpy).

> I read somewhere: Dereferencing a pointer returned by a "new" allocation of size zero is UB. Is it same in C? If yes, is the following code UB? (assuming size = 0)
>
> ```c
>  a->object[index].data = malloc(size);  
>  memcpy(a->object[index].data, bytes, size);
> ```
>
> To my understanding: NO. Just wanted to double check.
>
> > The return value of `malloc(0)` can only be used to `free` according to the standard.
> >
> > > Just out curiosity, how many bytes does `malloc(0)` allocate? 1?
> > >
> > > > it either returns NULL, or it returns a 'unique pointer that can be passed to free'. So it's up to the implementation to determine if it allocates anything at all.
>
> > technically the memcpy would never touch any of the memory, so you'd be OK (you can even memcpy from null if you're copying 0 bytes)
> >
> > Aside from that, it seems pretty bizarre that you'd ever be in this situation. 
> >
> > > not really "bizarre". Consider a file format that stores the size of each of its elements.
> >
> > > "it seems pretty bizarre that you'd ever be in this situation" -- only if it's "bizarre" to have 0 bytes of data ... which of course it isn't.

Result is implementation defined.

**C11: 7.22.3 Memory management functions:**

> [...] If the size of the space requested is zero, **the behavior is implementation-defined**: either a null pointer is returned, or the behavior is as if the size were some nonzero value, except that the returned pointer shall not be used to access an object.

Also standard says:

> The `free` function causes the space pointed to by `ptr` to be deallocated, that is, made available for further allocation. **If `ptr` is a null pointer, no action occurs**.

So, in either case of implementation defined behavior, freeing will not invoke undefined behavior.

Now moving to another part of the question.

**7.1.4 Use of library functions:**

> If an argument to a function has an invalid value (such as a value outside the domain of the function, or a pointer outside the address space of the program, or **a null pointer**, or a pointer to non-modifiable storage when the corresponding parameter is not const-qualified) or a type (after promotion) not expected by a function with variable number of arguments, **the behavior is undefined**.

**C11: 7.24.1 p(2):**

> Where an argument declared as `size_t n` specifies the length of the array for a function, n can have the value zero on a call to that function. Unless explicitly stated otherwise in the description of a particular function in this subclause, **pointer arguments on such a call shall still have valid values, as described in 7.1.4**. On such a call, a function that locates a character finds no occurrence, a function that compares two character sequences returns zero, and a function that copies characters copies zero characters.

