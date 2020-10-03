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
a + ak + ak^2 + \dots + b = \frac{bk-a}{k-1}
$$
where a is the first number, b is the last number and the ration between consecutive numbers is k. 

A special case of a sum of a geometric progression is the formula
$$
1 + 2 + 4 + 8 + \dots + 2^{n − 1} = 2^n − 1.
$$
A **harmonic sum** is a sum of the form
$$
\sum_{x=1}^n{\frac{1}{x} = 1 + \frac{1}{2} + \frac{1}{3} + \dots + \frac{1}{n}}.
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

The efficient general sorting algorithms work in O (n log n) time, and many algorithms that use sorting as a subroutine also have this time complexity.

### Inversions

A useful concept when analyzing sorting algorithms is an **inversion**: a pair of array elements (array[a], array[b]) such that a < b and array[a] > array[b], i.e., the elements are in the wrong order. For example, the array

```
1 | 2 | 2 | 6 | 3 | 5 | 9 | 8
```

has three inversions: (6, 3), (6, 5) and (9, 8). An array is completely sorted when there are no inversions. On the other hand, if the array elements are in the reverse order, the number of inversions is the largest possible:
$$
1 + 2 + \dots + (n-1) = \frac{n(n-1)}{2} = O (n^2)
$$
Swapping a pair of consecutive elements that are in the wrong order removes
exactly one inversion from the array. Hence, if a sorting algorithm can only swap
consecutive elements, each swap removes <u>at most</u> one inversion, and the time
complexity of the algorithm is at least O(n^2).

### Sorting lower bound

Is it possible to sort an array faster than in O(n log n) time? It turns out that this is not possible when we restrict ourselves to sorting algorithms that are based on comparing array elements.

The lower bound for the time complexity can be proved by considering sorting as a process where each comparison of two elements gives more information about the contents of the array. The process creates the following tree:

```
						x < y ?
				 _______|	  |_______
				/					  \
		 x < y ?						x < y ?
		/		\					   /	    \
x < y ?			x < y ? 		x < y ? 		x < y ?
/	\			/	\			/	\			/	\
```

Here ” x < y ?” means that some elements x and y are compared. If x < y , the process continues to the left, and otherwise to the right. The results of the process are the possible ways to sort the array, a total of n! ways. For this reason, the height of the tree must be at least
$$
log_2 (n!) = log_2(1) + log_2(2) + \dots + log_2(n).
$$
We get a <u>lower bound</u> for this sum by choosing the last n/2 elements and changing the value of each element to log 2 (n/2) (yeah, just do it). This yields an estimate
$$
log_2(n!) \ge \frac{n}{2} \cdot log_2(\frac{n}{2}),
$$
so the height of the tree and the minimum possible number of steps in a sorting algorithm <u>in the worst case is at least **n log n**</u> .

### Counting sort

> RU: Сортировка подсчётом.

The lower bound n log n does not apply to algorithms that do not compare array elements but use some other information. An example of such an algorithm is counting sort that sorts an array in O (n) time assuming that every element in the array is an integer between 0 . . . c and c = O (n).

The algorithm creates a *bookkeeping* array, whose indices are elements of the original array. The algorithm iterates through the original array and calculates how many times each element appears in the array.

Construction of the bookkeeping array takes O (n) time. After this, the sorted array can be created in O (n) time because the number of occurrences of each element can be retrieved from the bookkeeping array. Thus, the total time complexity of counting sort is O (n) (worst-case performance is O (n+k), where k is the range of the non-negative key values).

Counting sort is a very efficient algorithm but it can only be used when the constant c is small enough, so that the array elements can be used as indices in the bookkeeping array.

### Sorting in C++

The following code sorts a vector in increasing order:

```c++
vector<int> v = {4,2,5,3,5,8,3};
sort(v.begin(),v.end());
```

The default sorting order is increasing, but a reverse order is possible as follows:

```c++
sort(v.rbegin(),v.rend());
```

An ordinary array can be sorted as follows:

```c++
int n = 7; // array size
int a[] = {4,2,5,3,5,8,3};
sort(a,a+n);
```

You can sort strings:

```c++
string s = "monkey";
sort(s.begin(), s.end());
```

#### Comparison operators

The function sort requires that a **comparison operator** is defined for the data type of the elements to be sorted. When sorting, this operator will be used whenever it is necessary to find out the order of two elements.

Most C++ data types have a built-in comparison operator, and elements of those types can be sorted automatically. For example, numbers are sorted according to their values and strings are sorted in alphabetical order.

Pairs (pair) are sorted primarily according to their first elements (first). However, if the first elements of two pairs are equal, they are sorted according to their second elements (second):

```c++
vector<pair<int,int>> v;
v.push_back({1,5});
v.push_back({2,3});
v.push_back({1,2});
sort(v.begin(), v.end());
```

In a similar way, tuples (tuple) are sorted primarily by the first element, secondarily by the second element, etc.:

```c++
vector<tuple<int,int,int>> v;
v.push_back({2,1,4});
v.push_back({1,5,3});
v.push_back({2,1,3});
sort(v.begin(), v.end());
```

After this, the order of the tuples is (1, 5, 3), (2, 1, 3) and (2, 1, 4).

User-defined **structs** do not have a comparison operator automatically. The operator should be defined inside the struct as a function **operator<**, whose parameter is another element of the same type. The operator should return true if the element is smaller than the parameter, and false otherwise.

For example, the following `struct P` contains the `x` and `y` coordinates of a point. The comparison operator is defined so that the points are sorted primarily by the `x` coordinate and secondarily by the `y` coordinate.

```c++
struct P {
int x, y;
bool operator<(const P &p) {
		if (x != p.x) return x < p.x;
		else return y < p.y;
	}
};
```

#### Comparison functions

It is also possible to give an external comparison function to the sort function as a **callback function**. For example, the following comparison function `comp` sorts strings primarily by length and secondarily by alphabetical order:

```c++
bool comp(string a, string b) {
    if (a.size() != b.size()) return a.size() < b.size();
    return a < b;
}
```

Now a vector of strings can be sorted as follows:

```c++
sort(v.begin(), v.end(), comp);
```

### Binary search: method 2

> The first one is well known. I used it in the course Algorithms by Princeton. The search maintains an active region in the array, which initially contains all array elements. The search recursively goes to the left or right half of the region, depending on the value of the middle element.

An alternative method to implement binary search is based on an efficient way to iterate through the elements of the array. The idea is to make jumps and slow the speed when we get closer to the target element.

The search goes through the array from left to right, and the initial jump length is n/2. At each step, the jump length will be halved: first n/4, then n/8, n/16, etc., until finally the length is 1. After the jumps, either the target element has been found or we know that it does not appear in the array.

The following code implements the above idea:

```c++
int k = 0;
for (int b = n/2; b >= 1; b /= 2) {
	while (k+b < n && array[k+b] <= x) k += b;
}
if (array[k] == x) {
	// x found at index k
}
```

During the search, the variable b contains the current jump length. The time complexity of the algorithm is O (log n), because the code in the while loop is performed at most twice for each jump length.

#### C++ functions

The C++ standard library contains the following functions that are based on
binary search and work in <u>logarithmic time</u>:

- `lower_bound` returns a pointer to the first array element whose value is <u>at</u>
  <u>least x</u>.
- `upper_bound` returns a pointer to the first array element whose value is
  <u>larger than x</u>.
- `equal_range` returns both above pointers.

The functions assume that the array is sorted. If there is no such element, the pointer points to the element after the last array element. For example, the following code finds out whether an array contains an element with value x :

```c++
auto k = lower_bound(array,array+n,x) - array; // <- notice
if (k < n && array[k] == x) {
	// x found at index k
}
```

Then, the following code counts the number of elements whose value is x :

```c++
auto a = lower_bound(array, array+n, x);
auto b = upper_bound(array, array+n, x);
cout << b-a << "\n";
```

Using equal_range , the code becomes shorter:

```c++
auto r = equal_range(array, array+n, x);
cout << r.second-r.first << "\n";
```

#### Finding the smallest solution

An important use for binary search is to find the position where the value of a function changes. Suppose that we wish to find the smallest value k that is a valid solution for a problem. We are given a function `ok(x)` that returns true if x is a valid solution and false otherwise. In addition, we know that `ok(x)` is false when x < k and true when x ≥ k . The situation looks as follows:

```
|     x |     0      1   ...     k-1     k   k+1   ...  
| ----: | ----:  ----:  :---:  ----:  ---:  ---:  :---:
| ok(x) | false  false   ...   false  true  true   ...
```

Now, the value of k can be found using binary search:

```c++
int x = -1;
for (int b = z; b >= 1; b /= 2) {
	while (!ok(x+b)) x += b;
}
int k = x+1;
```

The search finds the largest value of x for which `ok(x)` is false. Thus, the next value k = x + 1 is the smallest possible value for which `ok(k)` is true. The initial jump length z has to be large enough, for example some value for which we know beforehand that `ok(z)` is true.

The algorithm calls the function `ok` O (log z) times, so the total time complexity depends on the function `ok`. For example, if the function works in O (n) time, the total time complexity is O (n log z).

#### Finding the maximum value

Binary search can also be used to find the maximum value for <u>a function that is first increasing and then decreasing</u>. Our task is to find a position k such that

- f(x) < f(x+1) when x < k, and
- f(x) > f(x+1) when x ≥ k.

The idea is to use binary search for finding the largest value of x for which f (x) < f (x + 1). This implies that <u>k = x + 1</u> because f (x + 1) > f (x + 2). The following code implements the search:

```c++
int x = -1;
for (int b = z; b >= 1; b /= 2) {
	while (f(x+b) < f(x+b+1)) x += b;
}
int k = x+1;
```

Note that unlike in the ordinary binary search, here it is not allowed that consecutive values of the function are equal. In this case it would not be possible to know how to continue the search.