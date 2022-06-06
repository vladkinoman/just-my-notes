# Arrays vs. pointers

## What is the purpose of arrays in C, when pointers could have done the job?

> [Source](https://softwareengineering.stackexchange.com/questions/115444/what-is-the-purpose-of-arrays-in-c-when-pointers-could-have-done-the-job).

Array notation is convenient, easier to read, and less prone to errors. It provides a formalism over pointers. It might be syntactic sugar, but we all need a little sweetness once in awhile, don't we?

As with all abstractions, you give up a little flexibility for the convenience that the abstraction provides.

---

If you have a matrix made of "nested pointers" (say `int **p`) what you have in each "row" (outer dimension) is a pointer that points to the first element in that row, so accessing a value requires two memory access. Plus, the memory it requires is `sizeof(*int)*n + n*m*sizeof(int)`.

In the bidimensional array scenario `int p[n][m]`, accessing an element requires just one memory access, because the address of the row is calculated rather than looked up; and the memory required is just `n*m*sizeof(int)`.

Another place where an array cannot be replaced by a pointer is inside structures.

```c
struct s {
    int[2];
    float;
}
```

is definitively not the same as

```c
struct s {
   *int;
   float;
}
```

the size of the array is important there, and pointers do not have that information.

So yes, unidimensional arrays and single pointers are *mostly* interchangeable, but their similarities end there.

---

Arrays are contiguous memory created on the stack. You can't guarantee contiguous stack memory without this syntactic sugar, and even if you could, you'd have to allocate a separate pointer in order to be able to do the pointer arithmetic (unless you wanted to do `*(&foo + x)`, which I'm not sure but it might violate l-value semantics, but is at least quite awkward, and would scream out for some kind of syntactic sugar).

> 2: Only arrays declared as automatics end up on the stack. Anything else (i.e., `static`s) usually ends up elsewhere depending on on the environment. 

Design-wise, it also is a form of encapsulation, since you can refer to the collection with a single identifier (which would otherwise require a separate pointer). And even if you could allocate them contiguously and allocated a separate pointer to reference them, you'd have either `int fooForSomething, fooForSomethingElse`... which forces a fair amount of creativity as your collection grows, so you might think to simplify with `int foo1, foo2` ..., which looks just like an array but is harder to maintain.

## Is an array name a pointer?

> [Source](https://stackoverflow.com/questions/1641957/is-an-array-name-a-pointer).

When an array is used as a value, its name represents <u>the address of the first element</u>.
When an array is not used as a value its name represents the whole array.

```c
int arr[7];

/* arr used as value */
foo(arr);
int x = *(arr + 1); /* same as arr[1] */

/* arr not used as value */
size_t bytes = sizeof arr;
void *q = &arr; /* void pointers are compatible with pointers to any object */
```

---

If an expression of array type (such as the array name) appears in a larger expression and it isn't the operand of either the `&` or `sizeof` operators, then the type of the array expression is converted from "N-element array of T" to "pointer to T", and the value of the expression is the address of the first element in the array.

**In short, the array name is not a pointer, but in most contexts it is treated *as though* it were a pointer.**

> **Edit**
>
> Answering the question in the comment:
>
> > If I use sizeof, do i count the size of only the elements of the array? Then the array “head” also takes up space with the information about length and a pointer (and this means that it takes more space, than a normal pointer would)?
>
> When you create an array, the only space that's allocated is the space for the elements themselves; no storage is materialized for a separate pointer or any metadata. Given
>
> ```c
> char a[10];
> ```
>
> what you get in memory is
>
> ```c
>    +---+
> a: |   | a[0]
>    +---+ 
>    |   | a[1]
>    +---+
>    |   | a[2]
>    +---+
>     ...
>    +---+
>    |   | a[9]
>    +---+
> ```
>
> The *expression* `a` refers to the entire array, but there's no *object* `a` separate from the array elements themselves. Thus, `sizeof a` gives you the size (in bytes) of the entire array. The expression `&a` gives you the address of the array, *which is the same as the address of the first element*. The difference between `&a` and `&a[0]` is the type of the result1 - `char (*)[10]` in the first case and `char *` in the second.
>
> Where things get weird is when you want to access individual elements - the expression `a[i]` is defined as the result of `*(a + i)` - given an address value `a`, offset `i` elements (*not bytes*) from that address and dereference the result.
>
> The problem is that `a` isn't a pointer or an address - it's the entire array object. Thus, the rule in C that whenever the compiler sees an expression of array type (such as `a`, which has type `char [10]`) *and* that expression isn't the operand of the `sizeof` or unary `&` operators, the type of that expression is converted ("decays") to a pointer type (`char *`), and the value of the expression is the address of the first element of the array. Therefore, the *expression* `a` has the same type and value as the expression `&a[0]` (and by extension, the expression `*a` has the same type and value as the expression `a[0]`).
>
> C was derived from an earlier language called B, and in B `a` *was* a separate pointer object from the array elements `a[0]`, `a[1]`, etc. Ritchie wanted to keep B's array semantics, but he didn't want to mess with storing the separate pointer object. So he got rid of it. Instead, the compiler will convert array expressions to pointer expressions during translation as necessary.
>
> Remember that I said arrays don't store any metadata about their size. As soon as that array expression "decays" to a pointer, all you have is a pointer to a single element. That element may be the first of a sequence of elements, or it may be a single object. There's no way to know based on the pointer itself.
>
> When you pass an array expression to a function, all the function receives is a pointer to the first element - it has no idea how big the array is (this is why the `gets` function was such a menace and was eventually removed from the library). For the function to know how many elements the array has, you must either use a sentinel value (such as the 0 terminator in C strings) or you must pass the number of elements as a separate parameter.

---

An array declared like this

```c
int a[10];
```

allocates memory for 10 `int`s. You can't modify `a` but you can do pointer arithmetic with `a`.

A pointer like this allocates memory for just the pointer `p`:

```c
int *p;
```

It doesn't allocate any `int`s. You can modify it:

```c
p = a;
```

and use array subscripts as you can with a:

```c
p[2] = 5;
a[2] = 5;    // same
*(p+2) = 5;  // same effect
*(a+2) = 5;  // same effect
```

> 2: Arrays are not always allocated on the stack. That's an implementation detail that will vary from compiler to compiler. In most cases static or global arrays will be allocated from a different memory region than the stack. Arrays of const types may be allocated from yet another region of memory.

---

The array name by itself yields a memory location, so you can treat the array name like a pointer:

```c
int a[7];

a[0] = 1976;
a[1] = 1984;

printf("memory location of a: %p", a);

printf("value at memory location %p is %d", a, *a);
```

And other nifty stuff you can do to pointer (e.g. adding/substracting an offset), you can also do to an array:

```c
printf("value at memory location %p is %d", a + 1, *(a + 1));
```

Language-wise, if C didn't expose the array as just **some sort of "pointer"**(pedantically it's just a memory location. It cannot point to arbitrary location in memory, nor can be controlled by the programmer). We always need to code this:

```c
printf("value at memory location %p is %d", &a[1], a[1]);
```

---

An array is an array and a pointer is a pointer, but in most cases array names are *converted* to pointers. A term often used is that they *decay* to pointers.

Here is an array:

```c
int a[7];
```

`a` contains space for seven integers, and you can put a value in one of them with an assignment, like this:

```c
a[3] = 9;
```

Here is a pointer:

```c
int *p;
```

`p` doesn't contain any spaces for integers, but it can point to a space for an integer. We can, for example, set it to point to one of the places in the array `a`, such as the first one:

```c
p = &a[0];
```

What can be confusing is that you can also write this:

```c
p = a;
```

This does *not* copy the contents of the array `a` into the pointer `p` (whatever that would mean). Instead, the array name `a` is converted to a pointer to its first element. So that assignment does the same as the previous one.

Now you can use `p` in a similar way to an array:

```c
p[3] = 17;
```

The reason that this works is that the array dereferencing operator in C, `[ ]`, is defined in terms of pointers. `x[y]` means: start with the pointer `x`, step `y` elements forward after what the pointer points to, and then take whatever is there. Using pointer arithmetic syntax, `x[y]` can also be written as `*(x+y)`.

For this to work with a normal array, such as our `a`, the name `a` in `a[3]` must first be converted to a pointer (to the first element in `a`). Then we step 3 elements forward, and take whatever is there. In other words: take the element at position 3 in the array. (Which is the fourth element in the array, since the first one is numbered 0.)

So, in summary, array names in a C program are (in most cases) converted to pointers. One exception is when we use the `sizeof` operator on an array. If `a` was converted to a pointer in this context, `sizeof a` would give the size of a pointer and not of the actual array, which would be rather useless, so in that case `a` means the array itself.

> 6: A similar automatic conversion is applied to function pointers - both `functionpointer()` and `(*functionpointer)()` mean the same thing, strangely enough.

> 32: An array name is not a pointer. It's an identifier for a variable of type array, which has an implicit conversion to pointer of element type.
>
> > 30: Also, apart from `sizeof()`, the other context in which there's no array->pointer decay is operator `&` - in your example above, `&a` will be a pointer to an array of 7 `int`, not a pointer to a single `int`; that is, its type will be `int(*)[7]`, which is not implicitly convertible to `int*`. This way, functions can actually take pointers to arrays of specific size, and enforce the restriction via the type system.

## Passing an array as an argument to a function in C

> [Source](https://stackoverflow.com/questions/6567742/passing-an-array-as-an-argument-to-a-function-in-c).

> I wrote a function containing array as argument, and call it by passing value of array as follows.
>
> ```c
> void arraytest(int a[])
> {
>     // changed the array a
>     a[0]=a[0]+a[1];
>     a[1]=a[0]-a[1];
>     a[0]=a[0]-a[1];
> }
> 
> void main()
> {
>     int arr[]={1,2};
>     printf("%d \t %d",arr[0],arr[1]);
>     arraytest(arr);
>     printf("\n After calling fun arr contains: %d\t %d",arr[0],arr[1]);
> }
> ```
>
> What I found is though I am calling `arraytest()` function by passing values, the original copy of `int arr[]` is changed.
>
> Can you please explain why?

When passing an array as a parameter, this

```c
void arraytest(int a[])
```

means exactly the same as

```c
void arraytest(int *a)
```

so you *are* modifying the values in main.

For historical reasons, arrays are not first class citizens and cannot be passed by value.

> 4: Which notation is better under which circumstances?
>
> > 28: I would use the second option, as it seems less confusing and better indicates that you don't get a copy of the array.

> 2: Can you explain the "historical reasons"? I suppose passing by values would need a copy and so a waste of memory.. thanks
>
> > 7: Originally C didn't have any pass by value, except for single values. It wasn't until `struct` was added to the language that this was changed. And then it was considered too late to change the rules for arrays. There were already 10's of users. :-) 

---

**1. Standard array usage in C with natural type decay (adjustment) from array to ptr**

@Bo Persson correctly states in his great answer [here](https://stackoverflow.com/a/6567846/4561887):

> When passing an array as a parameter, this
>
> ```c
> void arraytest(int a[])
> ```
>
> means exactly the same as
>
> ```c
> void arraytest(int *a)
> ```

Let me add some comments to add clarity to those two code snippets:

```c
// param is array of ints; the arg passed automatically "adjusts" (frequently said
// informally as "decays") from `int []` (array of ints) to `int *` 
// (ptr to int)
void arraytest(int a[])

// ptr to int
void arraytest(int *a)
```

However, let me add also that the above two forms also:

1. mean exactly the same as

   ```c
    // array of 0 ints; automatically adjusts (decays) from `int [0]`
    // (array of zero ints) to `int *` (ptr to int)
    void arraytest(int a[0])
   ```

2. which means exactly the same as

   ```c
    // array of 1 int; automatically adjusts (decays) from `int [1]`
    // (array of 1 int) to `int *` (ptr to int)
    void arraytest(int a[1])
   ```

3. which means exactly the same as

   ```c
    // array of 2 ints; automatically adjusts (decays) from `int [2]`
    // (array of 2 ints) to `int *` (ptr to int)
    void arraytest(int a[2])
   ```

4. which means exactly the same as

   ```c
    // array of 1000 ints; automatically adjusts (decays) from `int [1000]`
    // (array of 1000 ints) to `int *` (ptr to int)
    void arraytest(int a[1000])
   ```

5. etc.

**In every single one of the array examples above, and as shown in the example calls in the code just below, the input parameter type adjusts (decays) to an `int \*`**, and can be called with no warnings and no errors, even with build options `-Wall -Wextra -Werror` turned on (see [my repo here](https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world#additional-c-and-c-build-notes-ex-wgcc-or-clang-compilers) for details on these 3 build options), like this:

```c
int array1[2];
int * array2 = array1;

// works fine because `array1` automatically decays from an array type
// to a pointer type: `int *`
arraytest(array1);
// works fine because `array2` is already an `int *` 
arraytest(array2);
```

As a matter of fact, the "size" value (`[0]`, `[1]`, `[2]`, `[1000]`, etc.) inside the array parameter here is apparently just for aesthetic/self-documentation purposes, and can be any positive integer (`size_t` type I think) you want!

**In practice, however, you should use it to specify the minimum size of the array you expect the function to receive, so that when writing code it's easy for you to track and verify.** The [MISRA-C-2012](https://www.misra.org.uk/MISRAHome/MISRAC2012/tabid/196/Default.aspx) standard ([buy/download the 236-pg 2012-version PDF of the standard for £15.00 here](https://www.misra.org.uk/shop/buy_now.php)) goes so far as to state (emphasis added):

> Rule 17.5 The function argument corresponding to a parameter declared to have an array type shall have an appropriate number of elements.
>
> ...
>
> If a parameter is declared as an array with a specified size, the corresponding argument in each function call should point into an object that has at least as many elements as the array.
>
> ...
>
> **The use of an array declarator for a function parameter specifies the function interface more clearly than using a pointer. The minimum number of elements expected by the function is explicitly stated, whereas this is not possible with a pointer.**

In other words, they recommend using the explicit size format, even though the C standard technically doesn't enforce it--*it at least helps clarify to you as a developer, and to others using the code, what size array the function is expecting you to pass in.*

**2. Forcing type safety on arrays in C**

(Not recommended (correction: [*sometimes* recommended, especially for fixed-size multi-dimensional arrays](https://stackoverflow.com/a/67814330/4561887)), but possible. See my brief argument against doing this at the end. Also, for my multi-dimensional-array [ex: 2D array] version of this, see [my answer here](https://stackoverflow.com/a/67814330/4561887).)

As @Winger Sendon points out in a comment below my answer, we can force C to treat an array *type* to be different based on the array *size*!

First, you must recognize that in my example just above, using the `int array1[2];` like this: `arraytest(array1);` causes `array1` to automatically decay into an `int *`. HOWEVER, **if you take the \*address of\* `array1` instead and call `arraytest(&array1)`, you get completely different behavior!** Now, it does NOT decay into an `int *`! This is because if you take the *address of* an array then you *already* have a pointer type, and pointer types do NOT adjust to other pointer types. Only array types adjust to pointer types. So instead, the type of `&array1` is **`int (\*)[2]`**, which means *"pointer to an array of size 2 of int"*, or *"pointer to an array of size 2 of type int"*, or said also as *"pointer to an array of 2 ints"*. **So, you can FORCE C to check for type safety on an array by passing explicit pointers to arrays, like this:**

```c
// `a` is of type `int (*)[2]`, which means "pointer to array of 2 ints"; 
// since it is already a ptr, it can NOT automatically decay further
// to any other type of ptr 
void arraytest(int (*a)[2])
{
    // my function here
}
```

This syntax is hard to read, but similar to that of a [*function pointer*](https://www.geeksforgeeks.org/function-pointer-in-c/). The online tool, [cdecl](https://cdecl.org/), tells us that `int (*a)[2]` means: *"declare a as pointer to array 2 of int"* (pointer to array of 2 `int`s). Do NOT confuse this with the version withOUT parenthesis: `int * a[2]`, which means: *"declare a as array 2 of pointer to int"* (AKA: array of 2 *pointers* to `int`, AKA: array of 2 `int*`s).

Now, this function REQUIRES you to call it with the address operator (`&`) like this, using as an input parameter a POINTER TO AN ARRAY OF THE CORRECT SIZE!:

```c
int array1[2];

// ok, since the type of `array1` is `int (*)[2]` (ptr to array of 
// 2 ints)
arraytest(&array1); // you must use the & operator here to prevent
                    // `array1` from otherwise automatically decaying
                    // into `int *`, which is the WRONG input type here!
```

This, however, will produce a warning:

```c
int array1[2];

// WARNING! Wrong type since the type of `array1` decays to `int *`:
//      main.c:32:15: warning: passing argument 1 of ‘arraytest’ from 
//      incompatible pointer type [-Wincompatible-pointer-types]                                                            
//      main.c:22:6: note: expected ‘int (*)[2]’ but argument is of type ‘int *’
arraytest(array1); // (missing & operator)
```

You may [test this code here](https://onlinegdb.com/Hkt4CVvYD).

To force the C compiler to turn this warning into an error, so that you MUST always call `arraytest(&array1);` using only an input array of the corrrect size *and* type (`int array1[2];` in this case), add `-Werror` to your build options. If running the test code above on onlinegdb.com, do this by clicking the gear icon in the top-right and click on "Extra Compiler Flags" to type this option in. Now, this warning:

> ```c
> main.c:34:15: warning: passing argument 1 of ‘arraytest’ from incompatible pointer type [-Wincompatible-pointer-types]                                                            
> main.c:24:6: note: expected ‘int (*)[2]’ but argument is of type ‘int *’    
> ```

will turn into this build error:

> ```c
> main.c: In function ‘main’:
> main.c:34:15: error: passing argument 1 of ‘arraytest’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>      arraytest(array1); // warning!
>                ^~~~~~
> main.c:24:6: note: expected ‘int (*)[2]’ but argument is of type ‘int *’
>  void arraytest(int (*a)[2])
>       ^~~~~~~~~
> cc1: all warnings being treated as errors
> ```

Note that you can also create "type safe" pointers to arrays of a given size, like this:

```c
int array[2]; // variable `array` is of type `int [2]`, or "array of 2 ints"

// `array_p` is a "type safe" ptr to array of size 2 of int; ie: its type
// is `int (*)[2]`, which can also be stated: "ptr to array of 2 ints"
int (*array_p)[2] = &array;
```

...but I do NOT *necessarily* recommend this (using these "type safe" arrays in C), as it reminds me a lot of the C++ antics used to force type safety everywhere, at the exceptionally high cost of language syntax complexity, verbosity, and difficulty architecting code, and which I dislike and have ranted about many times before (ex: see ["My Thoughts on C++" here](https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles/blob/master/git %26 Linux cmds%2C help%2C tips %26 tricks - Gabriel.txt)).

For additional tests and experimentation, see also the link just below.

**References**

See links above. Also:

1. My code experimentation online: https://onlinegdb.com/B1RsrBDFD

**See also:**

1. My answer on multi-dimensional arrays (ex: 2D arrays) which expounds upon the above, and uses the "type safety" approach for multi-dimensional arrays where it makes sense: [How to pass a multidimensional array to a function in C and C++](https://stackoverflow.com/questions/2828648/how-to-pass-a-multidimensional-array-to-a-function-in-c-and-c/67814330#67814330)

---

You are not passing the array as copy. It is only a pointer pointing to the address where the first element of the array is in memory.

---

Arrays in C are converted, in most of the cases, to a pointer to the first element of the array itself. And more in detail arrays passed into functions are always converted into pointers.

Here a quote from [K&R2nd](http://alvand.basu.ac.ir/~dezfoulian/files/Programming/Prentice Hall - The C Programming Language- Brian W. Kernighan, Dennis M. Ritchie, 2nd ed., ISBN .pdf):

> When an array name is passed to a function, what is passed is the location of the initial element. Within the called function, this argument is a local variable, and so an array name parameter is a pointer, that is, a variable containing an address.

Writing:

```c
void arraytest(int a[])
```

has the same meaning as writing:

```c
void arraytest(int *a)
```

So despite you are not writing it explicitly it is as you are passing a pointer and so you are modifying the values in the main.

For more I really suggest reading [this](http://eli.thegreenplace.net/2009/10/21/are-pointers-and-arrays-equivalent-in-c).

Moreover, you can find other answers on SO [here](https://stackoverflow.com/questions/1641957/is-an-array-name-a-pointer-in-c)

---

7



**Passing a multidimensional array as argument to a function.** Passing an one dim array as argument is more or less trivial. Let's take a look on more interesting case of passing a 2 dim array. In C you can't use a pointer to pointer construct (`int **`) instead of 2 dim array. Let's make an example:

```c
void assignZeros(int(*arr)[5], const int rows) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < 5; j++) {
            *(*(arr + i) + j) = 0;
            // or equivalent assignment
            arr[i][j] = 0;
        }
    }
```

Here I have specified a function that takes as first argument a pointer to an array of 5 integers. I can pass as argument any 2 dim array that has 5 columns:

```c
int arr1[1][5]
int arr1[2][5]
...
int arr1[20][5]
...
```

You may come to an idea to define a more general function that can accept any 2 dim array and change the function signature as follows:

```c
void assignZeros(int ** arr, const int rows, const int cols) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            *(*(arr + i) + j) = 0;
        }
    }
}
```

This code would compile but you will get a runtime error when trying to assign the values in the same way as in the first function. So in C a multidimensional arrays are not the same as pointers to pointers ... to pointers. An `int(*arr)[5]` is a pointer to array of 5 elements, an `int(*arr)[6]` is a pointer to array of 6 elements, and they are a pointers to different types!

Well, how to define functions arguments for higher dimensions? Simple, we just follow the pattern! Here is the same function adjusted to take an array of 3 dimensions:

```c
void assignZeros2(int(*arr)[4][5], const int dim1, const int dim2, const int dim3) {
    for (int i = 0; i < dim1; i++) {
        for (int j = 0; j < dim2; j++) {
            for (int k = 0; k < dim3; k++) {
                *(*(*(arr + i) + j) + k) = 0;
                // or equivalent assignment
                arr[i][j][k] = 0;
            }
        }
    }
}
```

How you would expect, it can take as argument any 3 dim arrays that have in the second dimensions 4 elements and in the third dimension 5 elements. Anything like this would be OK:

```c
arr[1][4][5]
arr[2][4][5]
...
arr[10][4][5]
...
```

But we have to specify all dimensions sizes up to the first one.

---

You are passing the value of the memory location of the first member of the array.

Therefore when you start modifying the array inside the function, you are modifying the original array.

Remember that `a[1]` is `*(a+1)`.

---

In C, except for a few special cases, an array reference always "decays" to a pointer to the first element of the array. Therefore, it isn't possible to pass an array "by value". An array in a function call will be passed to the function as a pointer, which is analogous to passing the array by reference.

EDIT: There are three such special cases where an array does not decay to a pointer to it's first element:

1. `sizeof a` is not the same as `sizeof (&a[0])`.
2. `&a` is not the same as `&(&a[0])` (and not quite the same as `&a[0]`).
3. `char b[] = "foo"` is not the same as `char b[] = &("foo")`.

## What is array to pointer decay?

What is array to pointer decay? Is there any relation to array pointers?

> 80: little known: The unary plus operator can be used as an "decay operator": Given `int a[10]; int b(void);`, then `+a` is an int pointer and `+b` is a function pointer. Useful if you want to pass it to a template accepting a reference.
>
> > 23: since this question is tagged both C and C++, I'd like to clarify that although `+a` and `+b` are legal in C++ , it is illegal in C (C11 6.5.3.3/1 "The operand of the unary `+` or `-` operator shall have arithmetic type") 

> 25: `std::decay` from C++14 would be a less obscure way of decaying an array over unary +

It's said that arrays "decay" into pointers. A C++ array declared as `int numbers [5]` cannot be re-pointed, i.e. you can't say `numbers = 0x5a5aff23`. More importantly the term decay signifies loss of type and dimension; `numbers` decay into `int*` by losing the dimension information (count 5) and the type is not `int [5]` any more. Look here for [cases where the decay doesn't happen](https://stackoverflow.com/questions/17752978/exception-to-array-not-decaying-into-a-pointer).

If you're passing an array by value, what you're really doing is copying a pointer - a pointer to the array's first element is copied to the parameter (whose type should also be a pointer the array element's type). This works due to array's decaying nature; once decayed, `sizeof` no longer gives the complete array's size, because it essentially becomes a pointer. This is why it's preferred (among other reasons) to pass by reference or pointer.

Three ways to pass in an array1:

```php
void by_value(const T* array)   // const T array[] means the same
void by_pointer(const T (*array)[U])
void by_reference(const T (&array)[U])
```

The last two will give proper `sizeof` info, while the first one won't since the array argument has decayed to be assigned to the parameter.

1 The constant U should be known at compile-time.

> 9: How is the first passing by value? 
>
> > 11: by_value is passing a pointer to the first element of the array; in the context of function parameters, `T a[]` is identical to `T *a`. by_pointer is passing the same thing, except the pointer value is now qualified `const`. If you want to pass a pointer *to the array* (as opposed to a pointer to the first element of the array), the syntax is `T (*array)[U]`.

----

Arrays are basically the same as pointers in C/C++, but not quite. Once you convert an array:

```csharp
const int a[] = { 2, 3, 5, 7, 11 };
```

into a pointer (which works without casting, and therefore can happen unexpectedly in some cases):

```csharp
const int* p = a;
```

you lose the ability of the `sizeof` operator to count elements in the array:

```csharp
assert( sizeof(p) != sizeof(a) );  // sizes are not equal
```

This lost ability is referred to as "decay".

For more details, check out this [article about array decay](http://web.archive.org/web/20081208122434/http://www.transcendentaxis.com/dthompson/blog/archives/9).

> 56: Arrays are *not* basically the same as pointers; they are completely different animals. In most contexts, an array can be treated *as though* it were a pointer, and a pointer can be treated *as though* it were an array, but that's as close as they get. 
>
> > 21: please pardon my imprecise language. I was trying to get to the answer without getting bogged down in a lengthy backstory, and "basically...but not quite" is as good an explanation as I ever got in college. I'm sure anyone who's interested can get a more accurate picture from your upvoted comment.

---

Here's what the standard says (C99 6.3.2.1/3 - Other operands - Lvalues, arrays, and function designators):

> Except when it is the operand of the sizeof operator or the unary & operator, or is a string literal used to initialize an array, an expression that has type ‘‘array of type’’ is converted to an expression with type ‘‘pointer to type’’ that points to the initial element of the array object and is not an lvalue.

This means that pretty much anytime the array name is used in an expression, it is automatically converted to a pointer to the 1st item in the array.

Note that function names act in a similar way, but function pointers are used far less and in a much more specialized way that it doesn't cause nearly as much confusion as the automatic conversion of array names to pointers.

The C++ standard (4.2 Array-to-pointer conversion) loosens the conversion requirement to (emphasis mine):

> An lvalue or rvalue of type “array of N T” or “array of unknown bound of T” **can** be converted to an rvalue of type “pointer to T.”

So the conversion doesn't *have* to happen like it pretty much always does in C (this lets functions overload or templates match on the array type).

This is also why in C you should avoid using array parameters in function prototypes/definitions (in my opinion - I'm not sure if there's any general agreement). They cause confusion and are a fiction anyway - use pointer parameters and the confusion might not go away entirely, but at least the parameter declaration isn't lying.

---

"Decay" refers to the implicit conversion of an expression from an array type to a pointer type. In most contexts, when the compiler sees an array expression it converts the type of the expression from "N-element array of T" to "pointer to T" and sets the value of the expression to the address of the first element of the array. The exceptions to this rule are when an array is an operand of either the `sizeof` or `&` operators, or the array is a string literal being used as an initializer in a declaration.

Assume the following code:

```css
char a[80];
strcpy(a, "This is a test");
```

The expression `a` is of type "80-element array of char" and the expression "This is a test" is of type "15-element array of char" (in C; in C++ string literals are arrays of const char). However, in the call to `strcpy()`, neither expression is an operand of `sizeof` or `&`, so their types are implicitly converted to "pointer to char", and their values are set to the address of the first element in each. What `strcpy()` receives are not arrays, but pointers, as seen in its prototype:

```cpp
char *strcpy(char *dest, const char *src);
```

This is not the same thing as an array pointer. For example:

```csharp
char a[80];
char *ptr_to_first_element = a;
char (*ptr_to_array)[80] = &a;
```

Both `ptr_to_first_element` and `ptr_to_array` have the same *value*; the base address of a. However, they are different types and are treated differently, as shown below:

```yaml
a[i] == ptr_to_first_element[i] == (*ptr_to_array)[i] != *ptr_to_array[i] != ptr_to_array[i]
```

Remember that the expression `a[i]` is interpreted as `*(a+i)` (which only works if the array type is converted to a pointer type), so both `a[i]` and `ptr_to_first_element[i]` work the same. The expression `(*ptr_to_array)[i]` is interpreted as `*(*a+i)`. The expressions `*ptr_to_array[i]` and `ptr_to_array[i]` may lead to compiler warnings or errors depending on the context; they'll definitely do the wrong thing if you're expecting them to evaluate to `a[i]`.

```csharp
sizeof a == sizeof *ptr_to_array == 80
```

Again, when an array is an operand of `sizeof`, it's not converted to a pointer type.

```csharp
sizeof *ptr_to_first_element == sizeof (char) == 1
sizeof ptr_to_first_element == sizeof (char *) == whatever the pointer size
                                                  is on your platform
```

`ptr_to_first_element` is a simple pointer to char.

> Isn't `"This is a test" is of type "16-element array of char"` a `"15-element array of char"`? (length 14 + 1 for \0)

## Is it legal to treat a pointer like an array?

> [Source](https://stackoverflow.com/questions/61287803/is-it-legal-to-treat-a-pointer-like-an-array).

In the C programming language these rules are (simplified):

- Pointers can be translated into integers of size `sizeof(uintptr_t)` and vice versa.
- The numeric value 0 translates to the *null pointer*, and null pointers translate to the numeric value 0.
- Null pointers are invalid and hence must not be dereferenced.
- Pointers can be *subtracted* from each other, resulting in an integer compatible to `ptrdiff_t`, and the value of the resulting integer is the distance in elements between these two pointers, assuming that both pointers refer to the same object. Written in "types" `⟪ptrdiff_t⟫ = ⟪pointer A⟫ - ⟪pointer B⟫`, only arithmetic valid rearrangements of this are valid.
- You can't add pointers
- You can't multiply pointers
- There is no mandate that number representations of pointers can be used for pointer arithmetic. I.e. you must not assume that `(pointer_A - pointer_B) == k*((uintptr_t)pointer_A - (uintptr_t)pointer_B))` for any value of `k`.

## C treating array as pointer

> [Source](https://stackoverflow.com/questions/62914014/c-treating-array-as-pointer).

> In C I learnt that the name of array is a pointer to the first index, but why I can't write the following:
>
> ```c
> int mat[5][4];
> *mat=1;
> ```

> In C I learnt that the name of array is a pointer to the first index

This is not exactly so.

According to the C Standard (6.3.2.1 Lvalues, arrays, and function designators)

> 3 Except when it is the operand of the sizeof operator or the unary & operator, or is a string literal used to initialize an array, an expression that has type ‘‘array of type’’ is converted to an expression with type ‘‘pointer to type’’ that points to the initial element of the array object and is not an lvalue. If the array object has register storage class, the behavior is undefined.

This declaration

```c
int mat[5][4];
```

declares a two-dimensional array. So the array designator used in expressions (with rare exceptions listed in the quote) is implicitly converted to pointer to its first element that is to pointer of the type `int ( * )[4]`.

Dereferencing the pointer like in this statement

```c
*mat=1;
```

you will get an array lvalue of the type `int[4]`. And as a result you are trying to assign a one-dimensional array with the scalar integer value 1. But arrays do not have the assignment operator. They are non-modifiable lvalues.

Instead you could write for example

```c
**mat = 1;
```

In this case the expression `**mat` yields a scalar lvalue of the type `int` (the first scalar element of the type `int` of the first "row"/element of the array `m`).

Here is a demonstrative program.

```c
#include <stdio.h>

int main(void) 
{
    int mat[5][4];
    **mat = 1;
    
    printf( "**mat is equal to %d and equivalent to mat[0][0] that is also equal to %d\n",
            **mat, mat[0][0] );
}           
```

Its output is

```c
**mat is equal to 1 and equivalent to mat[0][0] that is also equal to 1
```

In fact all these expressions used in the printf calls

```c
printf( "%d\n", **mat );            
printf( "%d\n", ( *mat )[0] );
printf( "%d\n", *mat[0] );          
printf( "%d\n", mat[0][0] );
```

yield the same element of the array.

---

2D arrays are essentially 1D arrays of 1D arrays. `*mat` is equivalent to `mat[0]` and gives you the first element of the array, which is itself a 1D array (`int[4]`).

You can't assign a number to an array.

> name of array is a pointer to the first index

I often see this explanation, but the difference between "array" and "name of array" is moot.

A better explanation is that an array can be *automatically converted* to the pointer to its first element.

## Pointer arithmetic and arrays: what's really legal?

> [Source](https://stackoverflow.com/questions/2383837/pointer-arithmetic-and-arrays-whats-really-legal).

> Consider the following statements:
>
> ```c
> int    *pFarr, *pVarr;
> 
> int    farr[3] = {11,22,33};
> int    varr[3] = {7,8,9};
> 
> pFarr = &(farr[0]);
> pVarr = varr;
> ```
>
> At this stage, both pointers are pointing at the start of each respective array address. For *pFarr, we are presently looking at 11 and for *pVarr, 7.
>
> Equally, if I request the contents of each array through *farr and *varr, i also get 11 and 7.
>
> So far so good.
>
> Now, let's try `pFarr++` and `pVarr++`. Great. We're now looking at 22 and 8, as expected.
>
> But now...
>
> Trying to move up `farr++` and `varr++` ... and we get "wrong type of argument to increment".
>
> Now, I recognize the difference between an array pointer and a regular pointer, but since their behaviour is similar, why this limitation?
>
> This is further confusing to me when I also consider that in the same program I can call the following function in an ostensibly correct way and in another incorrect way, and I get the same behaviour, though in contrast to what happened in the code posted above!?
>
> ```c
> working_on_pointers ( pFarr, farr );  // calling with expected parameters
> working_on_pointers ( farr, pFarr );  // calling with inverted parameters 
> ```
>
> .
>
> ```c
> void working_on_pointers ( int *pExpect, int aExpect[] ) {
> 
>     printf("%i", *pExpect);  // displays the contents of pExpect ok
>     printf("%i", *aExpect);  // displays the contents of aExpect ok
> 
>     pExpect++;               // no warnings or errors
>     aExpect++;               // no warnings or errors
> 
>     printf("%i", *pExpect);  // displays the next element or an overflow element (with no errors)
>     printf("%i", *aExpect);  // displays the next element or an overflow element (with no errors)
> 
> }
> ```
>
> Could someone help me to understand why array pointers and pointers behave in similar ways in some contexts, but different in others?
>
> So many thanks.
>
> **EDIT:** Noobs like myself could further benefit from this resource: **http://www.panix.com/~elflord/cpp/gotchas/index.shtml**

The difference is because for `farr++` to have any effect, somewhere the compiler would need to store that `farr` will evaluate to the address of the second element of the array. But there is no place for that information. The compiler only allocates place for `3` integers.

Now when you declare that a *function parameter* is an array, the function parameter won't be an array. The function parameter will be a pointer. There are no array parameters in C. So the following two declarations are equivalent

```c
void f(int *a);
void f(int a[]);
```

It doesn't even matter what number you put between the brackets - since the parameter really will be a pointer, the "size" is just ignored.

This is the same for functions - the following two are equivalent and have a function pointer as parameter:

```c
void f(void (*p)());
void f(void p()); 
```

While you can call both a function pointer and a function (so they are used similar), you also won't be able to write to a function, because it's not a pointer - it merely *converts* to a pointer:

```c
f = NULL; // error!
```

Much the same way you can't modify an array.

---

In C, you *cannot* assign to arrays. So, given:

```c
T data[N];
```

where `T` is a type and `N` is a number, you cannot say:

```c
data = ...;
```

Given the above, and that `data++;` is trying to assign to `data`, you get the error.

There is one simple rule in C about arrays and pointers. It is that, in value contexts, the name of an array is equivalent to a pointer to its first element, and in object contexts, the name of an array is equivalent to an array.

Object context is when you take the size of an array using `sizeof`, or when you take its address (`&data`), or at the time of initialization of an array. In all other contexts, you are in value context. This includes passing an array to a function.

So, your function:

```c
void working_on_pointers ( int *pExpect, int aExpect[] ) {
```

is equivalent to

```c
void working_on_pointers ( int *pExpect, int *aExpect ) {
```

The function can't tell if it was passed an array or a pointer, since all it sees is a pointer.

There are more details in the answers to the following questions:

- [type of an array](https://stackoverflow.com/questions/2035066/type-of-an-array),
- [`sizeof` behaving unexpectedly](https://stackoverflow.com/questions/2207732/sizeof-behaving-unexpectedly),

Also see this part of [C for smarties](http://web.torek.net/torek/c/expr.html#therule) website, which is very well-written.