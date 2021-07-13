# Terms and phrases of C lang that are fundamental and difficult to learn

## Table of Contents

1. [Tokens](#Tokens)
2. [Objects and types](#Objects-and-types)
3. [Expressions](#Expressions)
4. [Runtime Errors](#Runtime-Errors)
5. [Type casting](#Type-casting)
6. [Structures](#Structures)
7. [Difference between](#Difference-between)

## Tokens

**Token** (ru: лексема) is a symbol or a sequence of symbols. This is all that the program is made of.

> Upon completion of the preprocessor, a program is broken down into tokens: identifiers, keywords, constants, string literals, operation symbols and other separators.

> Other separators are token separators: horizontal tabs, vertical tabs, end of line characters, comments, spaces etc. They are cast aside by the compiler.
>
> Extended character sets for Asian countries: string constant — L'...', string token — L "...".

**Literal** is a fixed value, which can't be modified by the program. Example: `ch = 'r'`.

## Objects and types

**Variable** (object) is a named place in memory.

> You can interpret it in the program depending on the:
>
>  1. Memory class — determines the life time and the context of an object.
>  2. Data type — the meaning invested in the object data.

Memory classes in C according to K&R: automatic (auto & register) and static (static & extern) + according to A. Khizha: dynamic (C++ only?).

**Integer Promotion** (IP, ru: расширение целочисленного типа) is an iteration of the operand conversion to int (or unsigned int) if the int type (unsigned int) allows representing all values of the original operand type. char, short, int, integer bit field, all either signed or not, and enum type object — all can be used in expressions where int is allowed. This is possible due to IP. Essentially, once the IP has been compiled, this is the case for all the above types. Essentially, once you compile, IP occurs for all of the types listed above.

**Congruent type** is the type that also has binary representation.

> Char objects have the least stringent alignment requirements. Alignment is used when a very demanding type needs to be placed in addresses! Alignment is regulated with the help of typedef and union.

> Type conversion applies to pointers explicitly and is even adapted to the unsuccessful system interface.

> Pointer to pointer conversions require explicit type conversion!

> The value of an object of the void type cannot be used (x = void f), and it cannot be explicitly or implicitly cast to another type. However, it is possible to cast pointers to objects to void * without losing information. void * can also be used together with pointers of any type in = and <= as you wish.

TODO: Incomplete type (ru: неполный тип). 

## Expressions

**Expression** is a composition of operators (symbols like "+, -"), variables and literals.

> An expression may have a value (e.g. an assignment expression). Such expressions may participate in other expressions, as their values will be used.

Expressions in C/C++ can be of two types: lvalue and rvalue.

**lvalue** ((old) left-side value (naming expression) in C, locator value in C++) is an object (variable) that occupies an identified place in memory or is an expression that denotes or refers to an object. Example: 

```c
int a; // a is lvalue, and has an address.
```

> Identifier is lvalue if it refers to an object and if its type is arithmetic, struct, union or pointer.

**rvalue** is everything that is not lvalue. rvalue is a temporary value that will not be retained outside the expression that uses it. Example: 

```c
3 // it is simply a value
```

**modifiable lvalue** is not an array, not an incomplete type, does not have a const specifier, is not struct or union with const fields.

## Runtime Errors
While solving the problems on an online Judge, many runtime errors can be faced, which are not clear by the message which comes with them. Lets try to understand these errors.

To get clear about the definition of run time error:
A runtime error means that the program was compiled successfully, but it exited with a runtime error or crashed. You will receive an additional error message, which is most commonly one of the following:

1. **SIGSEGV**
   This is the most common error, i.e., a "segmentation fault". This may be caused e.g. by an out-of-scope array index causing a buffer overflow, an incorrectly initialized pointer, etc. This signal is generated when a program tries to read or write outside the memory that is allocated for it, or to write memory that can only be read. For example, you’re accessing a[-1] in a language which does not support negative indices for an array.
2. **SIGXFSZ**
   "output limit exceeded". Your program has printed too much data to output.
3. **SIGFPE**
   "floating point error". This usually occurs when you’re trying to divide a number by 0, or trying to take the square root of a negative number.
4. **SIGABRT**
   These are raised by the program itself. This happens when the judge aborts your program in the middle of execution. Due to insufficient memory, this can be raised.
5. **NZEC**
   (non-zero exit code) - this message means that the program exited returning a value different from 0 to the shell. For languages such as C/C++, this probably means you forgot to add "return 0" at the end of the program. It could happen if your program threw an exception which was not caught. Trying to allocate too much memory during code execution may also be one of the reasons.
   For interpreted languages like Python, **NZEC** will usually mean that your program either crashed or raised an uncaught exception. Some of the reasons being in such cases would be: the above mentioned runtime errors. Or, for instance usage of an external library which is causing some error, or not being used by the judge.
6. **MLE (Memory Limit Exceeded)**
   This error means that your program tried to allocate memory beyond the memory limit indicated. This can occur if you declare a very large array, or if a data structure in your program becomes too large.
7. **OTHER**
   This type of error is sometimes generated if you use too much memory. Check for arrays that are too large, or other elements that could grow to a size too large to fit in memory. It can also be sometimes be generated for similar reasons to the **SIGSEGV** error.

### Some ways to avoid runtime errors

1. Make sure you aren't using variables that haven't been initialized. These may be set to 0 on your computer, but aren't guaranteed to be on the judge.
2. Check every single occurrence of accessing an array element and see if it could possibly be out of bounds.
3. Make sure you aren't declaring too much memory. 64 MB is guaranteed, but having an array of size [100000] * [100000] will never work.
4. Make sure you aren't declaring too much stack memory. Any large arrays should be declared globally, outside of any functions, as putting an array of 100000 ints inside a function probably won't work.

## Type casting

### Do I cast the result of malloc?

> [Source](https://stackoverflow.com/questions/605845/do-i-cast-the-result-of-malloc).

> In [this question](http://stackoverflow.com/questions/571945/getting-a-stack-overflow-exception-when-declaring-a-large-array), someone suggested in a [comment](http://stackoverflow.com/questions/571945/getting-a-stack-overflow-exception-when-declaring-a-large-array#comment388297_571961) that I should ***not*** cast the result of `malloc`. i.e., I should do this:
>
> ```c
> int *sieve = malloc(sizeof(int) * length);
> ```
>
> rather than:
>
> ```c
> int *sieve = (int *) malloc(sizeof(int) * length);
> ```
>
> Why would this be the case?
>
> > [stackoverflow.com/q/7545365/168175](http://stackoverflow.com/q/7545365/168175):
> >
> > --
> >
> > **Why does this code segfault on 64-bit architecture but work fine on 32-bit?**
> >
> > > I came across the following C puzzle:
> > >
> > > Q: Why does the following program segfault on IA-64, but work fine on IA-32?
> > >
> > > ```c
> > >   int main()
> > >   {
> > >       int* p;
> > >       p = (int*)malloc(sizeof(int));
> > >       *p = 10;
> > >       return 0;
> > >   }
> > > ```
> > >
> > > I know that the size of `int` on a 64 bit machine may not be the same as the size of a pointer (`int` could be 32 bits and pointer could be 64 bits). But I am not sure how this relates to the above program. Any ideas?
> >
> > The cast to `int*` masks the fact that without the proper `#include` the return type of `malloc` is assumed to be `int`. IA-64 happens to have `sizeof(int) < sizeof(int*)` which makes this problem obvious.
> >
> > (Note also that because of the undefined behaviour it could still fail even on a platform where `sizeof(int)==sizeof(int*)` holds true, for example if the calling convention used different registers for returning pointers than integers)
> >
> > The [comp.lang.c FAQ](http://c-faq.com/malloc/mallocnocast.html) has an entry discussing [why casting the return from `malloc` is never needed and potentially bad](https://stackoverflow.com/questions/605845/do-i-cast-the-result-of-malloc).
> >
> > > Note that the cast isn't needed in C, but it is needed in C++. Anyway, this question was about C so +1
> > >
> > > > which is a good reason to always use `new` in C++ and always compile C with a C compiler and not a C++ compiler.
> >
> > > without the proper #include, why is the return type of malloc assumed to be an int?
> > >
> > > > that's the rules. Any return type is assumed to be `int` if it's not known
> >
> > ---
> >
> > Most likely because you're *not including* the header file for `malloc` and, while the compiler would normally warn you of this, the fact that you're explicitly casting the return value means you're telling it you know what you're doing.
> >
> > That means the compiler expects an `int` to be returned from `malloc` which it then casts to a pointer. If they're different sizes, that's going to cause you grief.
> >
> > This is why you *never* cast the `malloc` return in C. The `void*` that it returns will be implicitly converted to a pointer of the correct type (unless you haven't included the header in which case it probably would have warned you of the potentially unsafe int-to-pointer conversion).
> >
> > > sorry for sounding naive, but I always assumed that malloc returns a void pointer which can be cast to an appropriate type. I am not a C programmer and hence would appreciate a little more detail. 
> > >
> > > > without the #include <stdlib.h> the C compiler assumes the return value of malloc is an int.
> > >
> > > > The void pointer *can* be cast, but it's not needed in C as `void *` can be converted to any other pointer type implicitly. `int *p = malloc(sizeof(int))` works if the proper prototype is in scope and fails if it isn't (because then the result is assumed to be `int`). With the cast, both would compile and the latter would result in errors when `sizeof(int) != sizeof(void *)`.
>
> --
>
> > Casts are evil. I see so many cast in code just as a result of bad coding practice. Whenever you need to insert one the first thing you should ask yourselves is " what is wrong here" . Is everything declared as it should be ? If it is no cast would be needed so something is declared wrong. If you really do need to do some low level stuff on individual bytes in an int or so consider a union to access them. That'll declare them just fine. As a rule of thumb do not insert them unless the compiler complains. Then avoid them. This example will not complain. void pointer will promote to any type. 
> >
> > > in C++ , those are necessary for malloc, giving some basis to my notion that there's something wrong with it 

**TL;DR**

```c
int *sieve = (int *) malloc(sizeof(int) * length);
```

has two problems. The cast and that you're using the type instead of variable as argument for sizeof. Instead, do like this:

```c
int *sieve = malloc(sizeof *sieve * length);
```

**Long version**

**No**; you *don't* cast the result, since:

- It is unnecessary, as `void *` is automatically and safely promoted to any other pointer type in this case.
- It adds clutter to the code, casts are not very easy to read (especially if the pointer type is long).
- It makes you repeat yourself, which is generally bad.
- It can hide an error if you forgot to include `<stdlib.h>`. This can cause crashes (or, worse, *not* cause a crash until way later in some totally different part of the code). Consider what happens if pointers and integers are differently sized; then you're hiding a warning by casting and might lose bits of your returned address. Note: as of C99 implicit functions are gone from C, and this point is no longer relevant since there's no automatic assumption that undeclared functions return `int`.

As a clarification, note that I said "you don't cast", not "you don't *need* to cast". In my opinion, it's a failure to include the cast, even if you got it right. There are simply no benefits to doing it, but a bunch of potential risks, and including the cast indicates that you don't know about the risks.

Also note, as commentators point out, that the above talks about straight C, not C++. I very firmly believe in C and C++ as separate languages.

To add further, your code needlessly repeats the type information (`int`) which can cause errors. It's better to de-reference the pointer being used to store the return value, to "lock" the two together:

```c
int *sieve = malloc(length * sizeof *sieve);
```

This also moves the `length` to the front for increased visibility, and drops the redundant parentheses with `sizeof`; they *are only needed* when the argument is a type name. Many people seem to not know (or ignore) this, which makes their code more verbose. Remember: `sizeof` is not a function! :)

------

While moving `length` to the front *may* increase visibility in some rare cases, one should also pay attention that in the general case, it should be better to write the expression as:

```c
int *sieve = malloc(sizeof *sieve * length);
```

Since keeping the `sizeof` first, in this case, ensures multiplication is done with at least `size_t` math.

Compare: `malloc(sizeof *sieve * length * width)` vs. `malloc(length * width * sizeof *sieve)` the second may overflow the `length * width` when `width` and `length` are smaller types than `size_t`.

> Please consider updating the answer. The cast is no longer dangerous, and repeating oneself is not necessarily a bad thing (redundancy can help catch errors).
>
> Compilers have changed. An up-to-date compiler will warn you about a missing declaration of malloc.
>
> > Ok. I think it's bad to assume that anyone reading here has a particular compiler. Also, since C11 the entire "implicit function" concept is gone, I didn't know that. Still, I don't see the point in adding a pointless cast. Do you also do `int x = (int) 12;` just to make things clear? 
> >
> > > Even I agree with you, `(int)12` is not comparable. `12` *is* an `int`, the cast does simply nothing. The retval of `malloc()` is `void *`, not the pointer type casted to. (If it is not `void *`. So the analogy to `(int)12` would be `(void*)malloc(…)` what nobody is discussing.) 
> >
> > >  comparing with `double d = (double)12;` or `unsigned int u = (unsigned int)12;` might make more sense.
>
> I've encountered a case where redundancy of the malloc cast helped to find a bug. This doesn't happen often but still.
>
> > if explicitly casting a void pointer "helped" solve a bug, you more likely encountered undefined behavior, which would mean the program in question likely has a far worse, undiscovered bug that you haven't run into yet. And one day, on a cold winter evening, you'll come home from work to find your GitHub page flooded with issue reports complaining about demons flying out of the users' noses
> >
> > > No, this is not the case, even remotely so. You can look at the program in question [here](http://stackoverflow.com/questions/40854155/dynamic-allocation-of-2d-array-function/40854925#40854925).
> > >
> > > --
> > >
> > > It is often said that one should not cast the result of `calloc` and friends. But in this case the cast has enabled a warning which helped to find a bug. I'm leaving the casts in place for now.
> > >
> > > There is another idiom for the allocation that does not require the cast, but also avoids the problem of types not matching. Instead of using the type for the `sizeof`, you can use the dereferenced pointer as the type information is available in the variable:
> > >
> > > ```c
> > > mat = (int**)calloc(n, sizeof(int*));
> > > ```
> > >
> > > can be changed to
> > >
> > > ```c
> > > mat = calloc(n, sizeof *mat); //sizeof is an operator not a function
> > > ```
> > >
> > > > Could you please explain precisely how the cast enabled this warning, and what the warning is? 
> > > >
> > > > > The cast produced a warning because the type on the left side of the assignment didn't match the type on the right side. It turned out that the left hand side was wrong.
> > > > >
> > > > > > ah, to catch newbie errors. Although I'm pretty sure that if one fumbles the level of indirection on the type, they're probably going to fumble the cast as well. Aside from that, I think it would be in the askers's best interest to reduce the level of indirection and use a better design. An `int **` is hardly useful for a matrix, IMO.
> > >
> > > --
>
> > "I think it's bad to assume that anyone reading here has a particular compiler. Also, since C11 the entire "implicit function" concept is gone, I didn't know that" - It's gone since C99 (not just C11). Any C99 compiler is *required* to issue a diagnostic if `#include <stdlib.h>` isn't included.Out of the 4 bullets, the first 3 are subjective (there's sufficient proof that some tend to favor it in this page) and the 4th has been "fixed" in C language about 10 years before this answer. While I am not advocating in favor of the cast, it's really a case of *making a mountain out of a mole* here.

---

As others stated, it is not needed for C, but necessary for C++. If you think you are going to compile your C code with a C++ compiler, for whatever reasons, you can use a macro instead, like:

```c
#ifdef __cplusplus
# define NEW(type, count) ((type *)calloc(count, sizeof(type)))
#else
# define NEW(type, count) (calloc(count, sizeof(type)))
#endif
```

That way you can still write it in a very compact way:

```c
int *sieve = NEW(int, 1);
```

and it will compile for C and C++.

> Since you're using a macro anyway, why don't you use `new` in the definition of C++?
>
> > Because there is no reason to do so. It is mainly for C programs that are compiled with a C++ compiler. If you are going to use 'new', the only thing you get are problems. You need then also a macro for free. And you need a macro to free an array, a differentiation that doesn't exists in C.

## Structures

## Allocating memory for a Structure in C

> [Source](https://stackoverflow.com/questions/2177391/allocating-memory-for-a-structure-in-c).

My favorite:

```c
#include <stdlib.h>

struct st *x = malloc(sizeof *x); 
```

Note that:

- `x` must be a pointer
- no cast is required
- include appropriate header

---

For allocating on the heap, `struct st * x = malloc(sizeof(struct st));`.

## Difference between

### Difference between NULL, '\0' and 0

> [Source](https://stackoverflow.com/questions/1296843/what-is-the-difference-between-null-0-and-0).

> In C, there appear to be differences between various values of zero -- `NULL`, `NUL` and `0`.
>
> I know that the ASCII character `'0'` evaluates to `48` or `0x30`.
>
> The `NULL` pointer is usually defined as:
>
> ```c
> #define NULL 0
> ```
>
> Or
>
> ```c
> #define NULL (void *)0
> ```
>
> In addition, there is the `NUL` character `'\0'` which seems to evaluate to `0` as well.
>
> Are there times when these three values can not be equal?
>
> Is this also true on 64 bit systems?

It appears that a number of people misunderstand what the differences between NULL, '\0' and 0 are. So, to explain, and in attempt to avoid repeating things said earlier:

A constant expression of type `int` with the value 0, or an expression of this type, cast to type `void *` is a **null pointer constant**, which if converted to a pointer becomes a **null pointer**. It is guaranteed by the standard to compare **unequal to any pointer to any object or function**.

`NULL` is a macro, defined in as a **null pointer constant**.

`\0` is a construction used to represent the **null character**, used to terminate a string.

A **null character** is a byte which has all its bits set to 0.

---

**Note:** This answer applies to the C language, not C++.

**Null Pointers**

The integer constant literal `0` has different meanings depending upon the context in which it's used. In all cases, it is still an integer constant with the value `0`, it is just described in different ways.

If a pointer is being compared to the constant literal `0`, then this is a check to see if the pointer is a null pointer. This `0` is then referred to as a null pointer constant. The C standard defines that `0` cast to the type `void *` is both a null pointer and a null pointer constant.

Additionally, to help readability, the macro `NULL` is provided in the header file `stddef.h`. Depending upon your compiler it might be possible to `#undef NULL` and redefine it to something wacky.

Therefore, here are some valid ways to check for a null pointer:

```c
if (pointer == NULL)
```

`NULL` is defined to compare equal to a null pointer. It is implementation defined what the actual definition of `NULL` is, as long as it is a valid null pointer constant.

```c
if (pointer == 0)
```

`0` is another representation of the null pointer constant.

```c
if (!pointer)
```

This `if` statement implicitly checks "is not 0", so we reverse that to mean "is 0".

The following are INVALID ways to check for a null pointer:

```c
int mynull = 0;
<some code>
if (pointer == mynull)
```

To the compiler this is not a check for a null pointer, but an equality check on two variables. This *might* work if mynull never changes in the code and the compiler optimizations constant fold the 0 into the if statement, but this is not guaranteed and the compiler has to produce at least one diagnostic message (warning or error) according to the C Standard.

Note that the value of a null pointer in the C language does not matter on the underlying architecture. If the underlying architecture has a null pointer value defined as address 0xDEADBEEF, then it is up to the compiler to sort this mess out.

As such, even on this funny architecture, the following ways are still valid ways to check for a null pointer:

```c
if (!pointer)
if (pointer == NULL)
if (pointer == 0)
```

The following are INVALID ways to check for a null pointer:

```c
#define MYNULL (void *) 0xDEADBEEF
if (pointer == MYNULL)
if (pointer == 0xDEADBEEF)
```

as these are seen by a compiler as normal comparisons.

**Null Characters**

`'\0'` is defined to be a null character - that is a character with all bits set to zero. `'\0'` is (like all character literals) an integer constant, in this case with the value zero. So `'\0'` is completely equivalent to an unadorned `0` integer constant - the only difference is in the *intent* that it conveys to a human reader ("I'm using this as a null character.").

`'\0'` has nothing to do with pointers. However, you may see something similar to this code:

```c
if (!*char_pointer)
```

checks if the char pointer is pointing at a null character.

```c
if (*char_pointer)
```

checks if the char pointer is pointing at a non-null character.

Don't get these confused with null pointers. Just because the bit representation is the same, and this allows for some convenient cross over cases, they are not really the same thing.

**References**

See [Question 5.3 of the comp.lang.c FAQ](http://c-faq.com/null/ptrtest.html) for more. See [this pdf](http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1124.pdf) for the C standard. Check out sections 6.3.2.3 Pointers, paragraph 3.

> No, you won't compare `ptr` to *all-bits-zero*. This is not a `memcmp`, but this is a comparison using a builtin operator. The one side is a null pointer constant `'\0'`, and the other side is a pointer. Aswell as with the other two versions with `NULL` and `0`. Those three do the same things.
>
> You are taking the builtin comparison operator as a thing that would compare bit-strings. But that's not what it is. It compares two values, which are abstract concepts. So a null pointer that internally is represented as `0xDEADBEEF` is still a null pointer, no matter what its bitstring looks like, and it will still compare equal to `NULL`, `0`, `\0` and all other null pointer constant forms.

---

[If NULL and 0 are equivalent as null pointer constants, which should I use?](http://c-faq.com/null/nullor0.html) in the C FAQ list addresses this issue as well:

> C programmers must understand that `NULL` and `0` are interchangeable in pointer contexts, and that an uncast `0` is perfectly acceptable. Any usage of NULL (as opposed to `0`) should be considered a gentle reminder that a pointer is involved; programmers should not depend on it (either for their own understanding or the compiler's) for distinguishing pointer `0`'s from integer `0`'s.
>
> It is only in pointer contexts that `NULL` and `0` are equivalent. `NULL` should not be used when another kind of `0` is required, even though it might work, because doing so sends the wrong stylistic message. (Furthermore, ANSI allows the definition of `NULL` to be `((void *)0)`, which will not work at all in non-pointer contexts.) In particular, do not use `NULL` when the ASCII null character (`NUL`) is desired. Provide your own definition

```c
#define NUL '\0'
```

> if you must.

