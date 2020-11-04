# Terms and phrases of C lang that are fundamental and difficult to learn

## Table of Contents

1. [Tokens](#Tokens)
2. [Objects and types](#Objects-and-types)
3. [Expressions](#Expressions)
4. [Runtime Errors](#Runtime-Errors)

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