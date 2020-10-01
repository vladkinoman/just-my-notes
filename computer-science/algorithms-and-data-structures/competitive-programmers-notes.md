# Competitive programmer's notes

> These are my notes, which I write after reading the Competitive Programmer's Handbook by Antti Laaksonen (I thank him for this magic book :pray:). Mostly it's just information that I don't know or don't remember well.

## Introduction

### Programming languages

The most popular languages used in contests are C++, Python and Java.

Many people think that C++ is the best choice for a competitive programmer, and C++ is nearly always available in contest systems. The benefits of using C++ are that it is a very efficient language and its standard library contains a large collection of data structures and algorithms.

If large integers are needed in the problem, Python can be a good choice, because it contains built-in operations for calculating with large integers. Still, most problems in programming contests are set so that using a specific programming language is not an unfair advantage.

### C++ code template

A typical C++ code template for competitive programming looks like this:

```c++
#include <bits/stdc++.h>
using namespace std;

int main () {
    // solution comes here
}
```

The `#include` line at the beginning of the code is a feature of the g++ compiler that allows us to include the entire standard library.

The code can be compiled using the following command:

```bash
$ g++ -std=c++11 -O2 -Wall test.cpp -o test
```

This command produces the binary file `test` from the source code `test.cpp`. The compiler follows the C++11 standard (`-std=c++11`), optimizes the code (`-02`) and shows warnings about possible errors (`-Wall`). 

### Input and output

Input and output is sometimes a bottleneck in the program. The following lines at the beginning of the code make input and output more efficient:

```c++
ios::sync_with_stdio(0);
cin.tie(0);
```

Note that the newline "`\n`" works faster than `endl` , because `endl` always causes a flush operation.

`scanf` and `printf` are a faster than those commands.

Sometimes the program should read a whole line from the input, possibly containing spaces. This can be accomplished by using the `getline` function:

```c++
string s;
getline(cin, s);
```

In some contest systems, files are used for input and output. An easy solution for this is to write the code as usual using standard streams, but add the following lines to the beginning of the code:

```c++
freopen("input.txt", "r", stdin);
freopen("output.txt", "w", stdout);
```

### Working with numbers

The most used integer type in competitive programming is int , which is a 32-bit type with a value range of `− 2^31 . . . 2^31 − 1` or about `−2 · 10^9 . . . 2 · 10^9`. If the type `int` is not enough, the 64-bit type long long can be used. It has a value range of `−2^63 . . . 2^63 − 1` or about `− 9 · 10^18 . . . 9 · 10^18`.

The following code defines a long long variable:

```c++
long long x = 123456789123456789LL;
```

A common mistake when using the type `long long` is that the type `int` is still used somewhere in the code. For example, the following code contains a subtle error:

```c++
int a = 123456789;
long long b = a*a;
cout << b << "\n"; // -1757895751 because both numbers are of typre int and the result is also of type int
```

The problem can be solved by changing the type of `a` to `long long` or by changing the expression to `(long long)a*a`  (typecasting).

Usually contest problems are set so that the type `long long` is enough. Still, it is good to know that the g++ compiler also provides a 128-bit type `__int128_t` with a value range of `− 2^127 . . . 2^127 − 1` or about `− 10^38 . . . 10^38` . However, this type is not available in all contest systems.

### Modular arithmetic

We denote by `x` mod `m` the remainder when `x` is divided by `m` . For example, 17 mod 5 = 2, because 17 = 3 · 5 + 2.

Sometimes, the answer to a problem is a very large number but it is enough to output it ”modulo m” (RU: по модулю `m`), i.e., the remainder when the answer is divided by `m` (for example, ”modulo 10^9 + 7”). The idea is that even if the actual answer is very large, it suffices to use the types `int` and `long long`.

An important property of the remainder is that in addition, subtraction and multiplication, the remainder can be taken before the operation:

```mathematica
( a + b ) mod m = ( a mod m + b mod m ) mod m
( a − b ) mod m = ( a mod m − b mod m ) mod m
( a · b ) mod m = ( a mod m · b mod m ) mod m
```

Thus, we can take the remainder after every operation and the numbers will never become too large.

Usually we want the remainder to always be between `0 . . . m − 1`. However, in C++ and other languages, the remainder of a negative number is either zero or negative. An easy way to make sure there are no negative remainders is to first calculate the remainder as usual and then add `m` if the result is negative. However, this is only needed when there are subtractions in the code and the remainder may become negative.

### Floating point numbers

The usual floating point types in competitive programming are the 64-bit `double` and, as an extension in the g++ compiler, the 80-bit `long double` . In most cases, `double` is enough, but `long double` is more accurate.

An easy way to output the answer is to use the `printf` function and give the number of decimal places in the formatting string. For example, the following code prints the value of `x` with 9 decimal places:

```c++
printf("%.9f\n", x);
```

A difficulty when using floating point numbers is that some numbers cannot be represented accurately as floating point numbers, and there will be rounding errors. For example, the result of the following code is surprising:

```c++
double x = 0.3*3+0.1;
printf("%.20f\n", x); // 0.99999999999999988898
```

Due to a rounding error, the value of x is a bit smaller than 1, while the correct value would be 1.

It is risky to compare floating point numbers with the `==` operator, because it is possible that the values should be equal but they are not because of precision errors. A better way to compare floating point numbers is to assume that two numbers are equal if the difference between them is less than ε, where ε is a small number.

In practice, the numbers can be compared as follows ( ε = 10^− 9 ):

```c++
if (abs(a-b) < 1e-9) {
// a and b are equal
}
```

Note that while floating point numbers are inaccurate, integers up to a certain limit can still be represented accurately. For example, using `double`, it is possible to accurately represent all integers whose absolute value is at most 2^53 .

### Shortening code

#### Type names

Using the command `typedef` it is possible to give a shorter name to a datatype: 

```c++
typedef long long ll;
typedef vector<int> vi;
```

#### Macros

Another way to shorten code is to define macros. A macro means that certain strings in the code will be changed before the compilation. In C++, macros are defined using the `#define` keyword

```c++
#define F first
#define S second
#define PB push_back
#define MP make_pair
```

After this, the code

```c++
v.push_back(make_pair(y1,x1));
v.push_back(make_pair(y2,x2));
int d = v[i].first+v[i].second;
```

can be shortened as follows:

```c++
v.PB(MP(y1,x1));
v.PB(MP(y2,x2));
int d = v[i].F+v[i].S;
```

A macro can also have parameters:

```c++
#define REP(i,a,b) for (int i = a; i <= b; i++)
```

After this, the code

```c++
for (int i = 1; i <= n; i++) {
	search(i);
}
```

can be shortened as follows:

```c++
REP(i,1,n) {
	search(i);
}
```

Be aware of bugs:

```c++
#define SQ(a) a*a
// could cause a bug:
cout << SQ(3+3) << "\n"; // corresponds to 3+3*3+3=15, a literal substitution
// a better version of the macro is as follows:
#define SQ(a) (a)*(a)
```

### Math

The sum of a geometric progression can be calculated as follows:
$$
a + ak + ak^2 + ... + b = \frac{bk-a}{k-1}
$$
where a is the first number, b is the last number and the ration between consecutive numbers is k. 

A special case of a sum of a geometric progression is the formula
$$
1 + 2 + 4 + 8 + . . . + 2^{n − 1} = 2^n − 1.
$$
A **harmonic sum** is a sum of the form
$$
\sum_{x=1}^n{\frac{1}{x} = 1 + \frac{1}{2} + \frac{1}{3} + ... + \frac{1}{n}}.
$$
An upper bound for a harmonic sum is  log₂(n) + 1. Namely, we can modify each term 1/k so that k becomes the nearest power of two that does not exceed k.
For example, when n = 6, we can estimate the sum as follows:
$$
1 + \frac12 + \frac 13 + \frac 14 + \frac 15 + \frac 16 \le 1 + \frac12 + \frac 12 + \frac 14 + \frac 14 + \frac 14.
$$
This upper bound consists of log₂(n) + 1 parts (1, 2 · 1/2, 4 · 1/4, etc.), and the value of each part is at most 1.

---

A **set** S is a collection of elements.

If each element of A also belongs to S, we say that A is a **subset** of S , denoted
by A ⊂ S . A set S always has 2^|S| subsets, including the empty set.

Some often used sets are N (natural numbers), Z (integers), Q (rational numbers) and R (real numbers).

We can also construct a set using a rule of the form
$$
\{f(n): n \in S\},
$$
where f(n) is some function. This set contains all elements of the form f(n), where n is an element in S. For example, the set 
$$
X = \{2n: n \in \Z \}
$$
contains all even integers.

---

The value of a logical expression is either **true** (1) or **false** (0). The most important logical operators are ¬ (**negation**), ∧ (**conjunction**), ∨ (**disjunction**), ⇒ (**implication**) and ⇔ (**equivalence**).

A **predicate** is an expression that is true or false depending on its parameters. Predicates are usually denoted by capital letters. For example, we can define
a predicate P(x) that is true exactly when x is a prime number. Using this
definition, P(7) is true but P(8) is false.

A **quantifier** connects a logical expression to the elements of a set. The most important quantifiers are ∀ (**for all**) and ∃ (**there is**). For example,
$$
∀ x ( ∃ y ( y < x ))
$$
means that for each element x in the set, there is an element y in the set such that y is smaller than x. This is true in the set of integers, but false in the set of natural numbers.

---

The function ⌊x⌋ (**floor**) round the number x down to an integer, and the function ⌈x⌉ (**ceiling**) round the number x up to an integer. For example,
$$
\lfloor3/2\rfloor=1\ and\ \lceil3/2\rceil=2
$$
The **factorial** can be defined recursively:
$$
0! = 1\\
n! = n \cdot (n-1)!
$$
There is a closed-form formula for calculating **Fibonacci numbers**, which is
sometimes called **Binet’s formula**:
$$
f(n) = \frac{(1+\sqrt5)^n-(1-\sqrt5)^n}{2^n\sqrt5}.
$$

---

The **logarithm** of a number x is denoted log k (x), where k is the base of the
logarithm. According to the definition, log k (x) = a exactly when k^a = x .

A useful property of logarithms is that log k (x) equals the number of times we have to divide x by k before we reach the number 1. For example, log 2 (32) = 5 because 5 divisions by 2 are needed:
$$
32 \rightarrow 16 \rightarrow 8 \rightarrow 4 \rightarrow 2 \rightarrow 1
$$
Logarithms are often used in the analysis of algorithms, because <u>many efficient algorithms halve something at each step</u>. Hence, we can estimate the efficiency of such algorithms using logarithms.

Properties:
$$
log_k(ab) = log_k(a) + log_k(b)\\
log_k(x^n) = n \cdot log_k(x)\\
log_k(\frac ab) = log_k (a) - log_k (b)
$$
Another useful formula is
$$
log_u(x) = \frac{log_kx}{log_ku},
$$
and using this, it is possible to calculate logarithms to any base if there is a way to calculate logarithms to some fixed base.

The **natural logarithm** ln(x) of a number x is a logarithm whose base is e ≈ 2.71828. Another property of logarithms is that the number of digits of an integer x in base b is ⌊log b (x) + 1⌋ . For example, the representation of 123 in base 2 is 1111011 and ⌊log 2 (123) + 1⌋ = 7.

## Time complexity

The **time complexity** of an algorithm estimates how much time the algorithm will use for some input. The idea is to represent the efficiency as a function whose parameter is the size of the input.

The time complexity of an algorithm is denoted O ( · · · ) where the three dots represent some function.

Looks like "Order of magnitude" = "Order of growth". 

## Sorting

A useful concept when analyzing sorting algorithms is an **inversion**: a pair of array elements (array[a], array[b]) such that a < b and array[a] > array[b], i.e., the elements are in the wrong order. For example, the array

```
1 | 2 | 2 | 6 | 3 | 5 | 9 | 8
```

has three inversions: (6, 3), (6, 5) and (9, 8). An array is completely sorted when there are no inversions. On the other hand, if the array elements are in the reverse order, the number of inversions is the largest possible:
$$
1 + 2 + ... + (n-1) = \frac{n(n-1)}{2} = O (n^2)
$$
Swapping a pair of consecutive elements that are in the wrong order removes
exactly one inversion from the array. Hence, if a sorting algorithm can only swap
consecutive elements, each swap removes <u>at most</u> one inversion, and the time
complexity of the algorithm is at least O(n^2).