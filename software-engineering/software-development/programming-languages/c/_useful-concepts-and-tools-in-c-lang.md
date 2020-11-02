# Useful concepts and tools in C language

## Table of Contents

1. [Useful modules](#Useful-modules)
2. [Copying](#Copying)
3. [Sorting](#Sorting)
4. [Searching](#Searching)
5. [String processing](#String processing)
6. [References](#References)

## Useful modules

## Copying

## Sorting

## Searching

## String processing

Consider the following code fragment from K&R:

```c
void strcat( char* dest, char* src )
{
    while (*dest) dest++;
    while (*dest++ = *src++);
}
```

My god, look at this line:

```c
while (*dest++ = *src++);
```

Pure magic, isn't it? Well, at first glance, it seems so. Let's look into the postfix increment increment operation `src++`. According to K&R (p.60-61, RU version):

> `src++`. The result of the operation is the value of the operand before its incrementation .

So, when we use `src++` we can obtain an intermediate value before incrementation (so called rvalue). ++src won't let us to get that value of the operand. You should know that `*` operation will give us lvalue. Let's get back to our loop. According to K&R (p. 117, RU version):

>
>
>The value of `*src++` is the character that `src` pointed to before `src` was incremented; the postfix `++` doesn't change `src` until after this character has been fetched. In the same way, the character is stored into the old `dest` position before `dest` is incremented.

Also, this code can be improved. According to Joel Spolsky:

```c
char* mystrcat( char* dest, char* src )
{
    while (*dest) dest++;
    while (*dest++ = *src++);
    return --dest;
}
```

At very little extra cost we’re returning a pointer to the *end* of the new, longer string. That way the code that calls this function can decide to append further without rescanning the string:

```c
char bigString[1000];  /* I never know how much to allocate */
char *p = bigString;
bigString[0] = '\0';
p = mystrcat(p,"John, ");
p = mystrcat(p,"Paul, ");
p = mystrcat(p,"George, ");
p = mystrcat(p,"Joel ");
```

This is, of course, linear in performance, not n-squared, so it doesn’t suffer from degradation when you have a lot of stuff to concatenate. So we avoided the Shlemiel the painter's algorithm! Who is Shlemiel? He’s the guy in this joke:

> Shlemiel gets a job as a street painter, painting the dotted lines down the middle of the road. On the first day he takes a can of paint out to the road and finishes 300 yards of the road. “That’s pretty good!” says his boss, “you’re a fast worker!” and pays him a kopeck.
>
> The next day Shlemiel only gets 150 yards done. “Well, that’s not nearly as good as yesterday, but you’re still a fast worker. 150 yards is respectable,” and pays him a kopeck.
>
> The next day Shlemiel paints 30 yards of the road. “Only 30!” shouts his boss. “That’s unacceptable! On the first day you did ten times that much work! What’s going on?”
>
> “I can’t help it,” says Shlemiel. “Every day I get farther and farther away from the paint can!”



## References

1. https://stackoverflow.com/questions/810129/how-does-whiles-t-copy-a-string
2. https://www.joelonsoftware.com/2001/12/11/back-to-basics/