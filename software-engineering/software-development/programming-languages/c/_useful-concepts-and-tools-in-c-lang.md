# Useful concepts and tools in C language

## Table of Contents

1. [Useful modules](#Useful-modules)
2. [Copying](#Copying)
3. [Sorting](#Sorting)
4. [Searching](#Searching)
5. [String processing](#String processing)
   1. [strcat and its improvement](#strcat-and-its-improvement)
   2. [Pascal strings](#Pascal-strings)
   3. [malloc](#malloc)
6. [References](#References)

## Useful modules

## Copying

## Sorting

## Searching

## String processing

### strcat and its improvement

> A lot was taken from Joel Spolsky's blog.

Consider the following code fragment from K&R:

```c
void strcat( char* dest, char* src )
{
    while (*dest) dest++;
    while (*dest++ = *src++);
}
```

My god! Look at this line:

```c
while (*dest++ = *src++);
```

Pure magic, isn't it? Well, at first glance, it seems so. Let's look into the postfix increment increment operation `src++`. According to K&R (p.60-61, RU version):

> However, in the ++n expression, the variable is incremented before being used and in the n++ expression after being used.

So, when we use `src++` we can obtain an intermediate value before incrementation (so called rvalue, check my _terms file for more information). ++src won't let us to get that value of the operand. You should know that `*` operation will give us lvalue. Let's get back to our loop. According to K&R (p. 117, RU version):

>The value of `*src++` is the character that `src` pointed to before `src` was incremented; the postfix `++` doesn't change `src` until after this character has been fetched. In the same way, the character is stored into the old `dest` position before `dest` is incremented.

According to StackOverflow, this "magic" expression can also be explained in the following way:

> In `*s++`, we have unary `*` (pointer dereference operator) and unary `++` (postfix increment operator). In this case, `++` has higher precedence (also said to "bind tighter") than `*`. If we had said `++*s`, we would increment the *value at* `*s` rather than the *address pointed to by* `s` because *prefix* increment has lower precedence (actually, they have the same [precedence](https://www.tutorialspoint.com/cprogramming/c_operators.htm), but that's resolved by different rules; they effectively have lower precedence in this situation) as dereference, but we used *postfix* increment, which has higher precedence. If we had wanted to use prefix increment, we could have done `*(++s)`, since the parenthesis would have overridden all lower precedences and forced `++s` to come first, but this would have the undesirable side effect of leaving an empty character at the beginning of the string.

Explanations of other expressions such as `a++ + ++b` (spaces are mandatory) can be found on these links: [ecomputernotes — arithmetic expressions](https://ecomputernotes.com/what-is-c/types-and-variables/arithmetic-expressions), [stackoverflow — order of evaluation for multiple increment operator on pointer](https://stackoverflow.com/questions/27131756/order-of-evaluation-for-multiple-increment-operator-on-pointer). Also, that expression could have an unspecified behavior if there was only one variable: `i++ + ++i`. Read about this in the _terms_and_phrases file.

Ok, let's back to the function. This code can be improved. According to Joel Spolsky:

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
char bigString[1000];  /* He never knows how much to allocate */
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

### Pascal strings

> A lot was taken from Joel Spolsky's blog.

**Pascal string** is a string which stores a byte count in the first byte of the string. It can contain zeros and are not null terminated. Because a byte can only store numbers between 0 and 255, Pascal strings are limited to 255 bytes in length, but because they are not null terminated they occupy the same amount of memory as ASCIZ strings (with `\0` at the end). Finding the length of a string in Pascal is one assembly instruction instead of a whole loop. It is monumentally faster.

The old Macintosh operating system used Pascal strings everywhere. Many <u>C programmers</u> on other platforms <u>used Pascal strings for speed</u>. Excel uses Pascal strings internally which is why strings in many places in Excel are limited to 255 bytes, and it’s also one reason Excel is blazingly fast.

For a long time, if you wanted to put a Pascal string literal in your C code, you had to write (we can call it null terminated pascal string):

```c
char* str = "\006Hello!";
```

Yep, you had to count the bytes by hand, yourself, and hardcode it into the first byte of your string.

### malloc

> A lot was taken from Joel Spolsky's blog.

Why should we use **malloc** instead of `char bigString[1000]`. According to Joel Spolsky, because otherwise, you see, a clever hacker will read my code and notice that I’m only allocating 1000 bytes and *hoping* it will be enough, and they’ll find some clever way to trick me into **strcat**ting a 1100 byte string into my 1000 bytes of memory, thus overwriting the stack frame and changing the return address so that when this function returns, it executes some code which the hacker himself wrote. This is what they’re talking about when they say that a particular program has a **buffer overflow** susceptibility. It was the number one cause of hacks and worms in the olden days before Microsoft Outlook made hacking easy enough for teenagers to do.

How much *should* we allocate?

```c
char* bigString;
int i = 0;
i = strlen("John, ")
+ strlen("Paul, ")
+ strlen("George, ")
+ strlen("Joel ");
bigString = (char*) malloc (i + 1);
/* remember space for null terminator! */
...
```

We have to scan through all the strings once just figuring out how big they are, then we scan through them again concatenating. At least if you use Pascal strings the **strlen** operation is fast. Maybe we can write a version of **strcat** that reallocates memory for us.

That opens *another* whole can of worms: memory allocators. Do you know how **malloc** works? The nature of **malloc** is that it has a long linked list of available blocks of memory called the *free chain*. When you call **malloc**, it walks the linked list looking for a block of memory that is big enough for your request. Then it cuts that block into two blocks — one the size you asked for, the other with the extra bytes, and gives you the block you asked for, and puts the leftover block (if any) back into the linked list. When you call **free**, it adds the block you freed onto the free chain. Eventually, the free chain gets chopped up into little pieces and you ask for a big piece and there are no big pieces available the size you want. So **malloc** calls a timeout and starts rummaging around the free chain, sorting things out, and merging adjacent small free blocks into larger blocks. This takes 3 1/2 days. The end result of all this mess is that the performance characteristic of **malloc** is that it’s never very fast (it always walks the free chain), and sometimes, unpredictably, it’s shockingly slow while it cleans up.

> This is, incidentally, the same performance characteristic of garbage collected systems, surprise surprise, so all the claims people make about how garbage collection imposes a performance penalty are not entirely true, since typical **malloc** implementations had the same kind of performance penalty, albeit milder.

Smart programmers minimize the potential distruption of **malloc** by always allocating blocks of memory that are powers of 2 in size. You know, 4 bytes, 8 bytes, 16 bytes, 18446744073709551616 bytes, etc. For reasons that should be intuitive to anyone who plays with Lego, this minimizes the amount of weird fragmentation that goes on in the free chain. Although it may seem like this wastes space, it is also easy to see how it never wastes more than 50% of the space. So your program uses no more than twice as much memory as it needs to, which is not that big a deal.

Suppose you wrote a smart **strcat** function that reallocates the destination buffer automatically. Should it always reallocate it to the exact size needed? My teacher and mentor [Stan Eisenstat](http://www.cs.yale.edu/people/faculty/eisenstat.html) suggests that when you call **realloc**, you should always double the size of memory that was previously allocated. That means that you never have to call **realloc** more than **lg n** times, which has decent performance characteristics even for huge strings, and you never waste more than 50% of your memory.



## References

1. https://www.joelonsoftware.com/2001/12/11/back-to-basics/
2. https://stackoverflow.com/questions/810129/how-does-whiles-t-copy-a-string
3. https://www.tutorialspoint.com/cprogramming/c_operators.htm
4. [ecomputernotes — arithmetic expressions](https://ecomputernotes.com/what-is-c/types-and-variables/arithmetic-expressions)
5. [stackoverflow — order of evaluation for multiple increment operator on pointer](https://stackoverflow.com/questions/27131756/order-of-evaluation-for-multiple-increment-operator-on-pointer).