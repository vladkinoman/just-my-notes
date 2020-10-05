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

Using `equal_range`, the code becomes shorter:

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

## Data structures 

### Dynamic arrays

A **dynamic array** is an array whose size can be changed during the execution of the program. The most popular dynamic array in C++ is the `vector` structure, which can be used almost like an ordinary array.

```c++
vector<int> v;
v.push_back(3); // [3]
v.push_back(2); // [3,2]
v.push_back(5); // [3,2,5]
```

After this, the elements can be accessed like in an ordinary array:

```c++
cout << v[0] << "\n"; // 3
cout << v[1] << "\n"; // 2
cout << v[2] << "\n"; // 5
```

The function `size` returns the number of elements in the vector. The following code iterates through the vector and prints all elements in it:

```c++
for (int i = 0; i < v.size(); i++) {
	cout << v[i] << "\n";
}
```

A shorter way to iterate through a vector is as follows (for each):

```c++
for (auto x : v) {
	cout << x << "\n";
}
```

The function `back` returns the last element in the vector, and the function `pop_back` <u>removes</u> the lase elements:

```c++
vector<int> v;
v.push_back(5);
v.push_back(2);
cout << v.back() << "\n"; // 2
v.pop_back();
cout << v.back() << "\n"; // 5
```

The following code creates a vector with five elements:

```c++
vector<int> v = {2,4,2,5,1};
```

Another way to create a vector is to give the number of elements and the initial value for each element:

```c++
// size 10, initial value 0
vector<int> v(10);
```

```c++
// size 10, initial value 5
vector<int> v(10, 5);
```

The internal implementation of a vector uses an ordinary array. If the size of the vector increases and the array becomes too small, a new array is allocated and all the elements are moved to the new array. However, this does not happen often and the average time complexity of `push_back` is O (1).

The `string` structure is also a dynamic array that can be used almost like a vector. In addition, there is special syntax for strings that is not available in other data structures. Strings can be combined using the `+` symbol. The function `substr(k,x)` returns the substring that begins at position k and has length x, and the function `find(t)` finds the position of the first occurrence of a substring t .

```c++
string a = "hatti";
string b = a+a;
cout << b << "\n"; // hattihatti
b[5] = ’v’;
cout << b << "\n"; // hattivatti
string c = b.substr(3,4);
cout << c << "\n"; // tiva
```

### Set structures

A **set** is a data structure that maintains a collection of elements. The basic operations of sets are element insertion, search and removal.

The C++ standard library contains two set implementations: The structure `set` is based on a **balanced binary tree** and its operations work in O (log n) time. The structure `unordered_set` uses **hashing**, and its operations work in O (1) time on average.

The choice of which set implementation to use is often a matter of taste. The benefit of the `set` structure is that it maintains the order of the elements and provides functions that are not available in `unordered_set` . On the other hand, `unordered_set` can be more efficient.

```c++
set<int> s;
s.insert(3);
s.insert(2);
s.insert(5);
cout << s.count(3) << "\n"; // 1 - the element is in the set
cout << s.count(4) << "\n"; // 0
s.erase(3); // remove the element from the set
s.insert(4);
cout << s.count(3) << "\n"; // 0
cout << s.count(4) << "\n"; // 1
```

A set can be used mostly like a vector, but it is not possible to access the elements using the [] notation. The following code creates a set, prints the number of elements in it, and then iterates through all the elements:

```c++
set<int> s = {2,5,6,8};
cout << s.size() << "\n"; // 4
for (auto x : s) {
	cout << x << "\n";
}
```

An important property of sets is that all their elements are *distinct*. Thus, the function count always returns either 0 (the element is not in the set) or 1 (the element is in the set), and the function insert never adds an element to the set if it is already there. The following code illustrates this:

```c++
set<int> s;
s.insert(5);
s.insert(5);
s.insert(5);
cout << s.count(5) << "\n"; // 1
```

C++ also contains the structures `multiset` and `unordered_multiset` that otherwise work like `set` and `unordered_set` but they can contain multiple instances of an element. For example, in the following code all three instances of the number 5 are added to a multiset:

```c++
multiset<int> s;
s.insert(5);
s.insert(5);
s.insert(5);
cout << s.count(5) << "\n"; // 3
```

The function erase removes all instances of an element from a multiset:

```c++
s.erase(5);
cout << s.count(5) << "\n"; // 0
```

Often, only one instance should be removed, which can be done as follows:

```c++
s.erase(s.find(5));
cout << s.count(5) << "\n"; // 2
```

### Map structures

A **map** is a generalized array that consists of key-value-pairs. While the keys in an ordinary array are always the consecutive integers 0, 1, . . . , n − 1, where n is the size of the array, the keys in a map can be of any data type and they do not have to be consecutive values.

The C++ standard library contains two map implementations that correspond to the set implementations: the structure `map` is based on a **balanced binary tree** and accessing elements takes O (log n) time, while the structure `unordered_map` uses **hashing** and accessing elements takes O (1) time on average.

```c++
map<string,int> m;
m["monkey"] = 4;
m["banana"] = 3;
m["harpsichord"] = 9;
cout << m["banana"] << "\n"; // 3
```

If the value of a key is requested but the map does not contain it, the key is automatically added to the map with a default value. For example, in the following code, the key "aybabtu" with value 0 is added to the map.

```c++
map<string,int> m;
cout << m["aybabtu"] << "\n"; // 0
```

The function count checks if a key exists in a map:

```c++
if (m.count("aybabtu")) {
	// key exists
}
```

The following code prints all the keys and values in a map:

```c++
for (auto x : m) {
	cout << x.first << " " << x.second << "\n";
}
```

### Iterators and ranges

Many functions in the C++ standard library operate with iterators. An **iterator** is a variable that points to an element in a data structure.

The iterator `begin` points to the first element in the data structure, and the iterator `end` points to the position *after* the last element.

```c++
{ 3, 4, 6, 8, 12, 13, 14, 17 }
  ↑							↑
  s.begin()					s.end()
```

Note the asymmetry in the iterators: `s.begin()` points to an element in the data structure, while `s.end()` points outside the data structure. Thus, the range defined by the iterators is *half-open*.

#### Working with rangers

Usually, we want to process all elements in a data structure, so the iterators `begin` and `end` are given for the function.

```c++
sort(v.begin(), v.end());
reverse(v.begin(), v.end());
random_shuffle(v.begin(), v.end());
```

These functions can also be used with an ordinary array. In this case. the functions are given pointers to the array instead of iterators:

```c++
sort(a, a+n);
reverse(a, a+n);
random_shuffle(a, a+n);
```

#### Set iterators

Iterators are often used to access elements of a set. The following code creates an iterator it that points to the smallest element in a set:

```c++
set<int>::iterator it = s.begin();
```

A shorter way to write the code is as follows:

```c++
auto it = s.begin();
```

Iterators can be moved using the operators `++` (forward) and `--` (backward), meaning that the iterator moves to the next or previous element in the set.

The following code prints the largest element in the set:

```c++
auto it = s.end(); it--;
cout << *it << "\n";
```

The function `find(x)` returns an iterator that points to an element whose value is x. However, if the set does not contain x , the iterator will be end.

```c++
auto it = s.find(x);
if (it == s.end()) {
	// x is not found
}
```

The function `lower_bound(x)` returns an iterator to the smallest element in the set whose value is *at least x*, and the function `upper_bound(x)` returns an iterator to the smallest element in the set whose value is *larger than x*. In both functions, if such an element does not exist, the return value is `end`. These functions are
not supported by the `unordered_set` structure which does not maintain the order of the elements.

For example, the following code finds the element nearest to *x*:

```c++
// assume that the set is not empty
auto it = s.lower_bound(x);
if (it == s.begin()) {
    cout << *it << "\n";
} else if (it == s.end()) {
    it--;
    cout << *it << "\n";
} else {
    // if none of the previous cases hold, the element nearest to x
    // is either the element that corresponds to `it` or the prev element
    int a = *it; it--;
    int b = *it;
    if ( x-b < a-x) cout << b << "\n";
    else cout << a << "\n";
}
```

### Other structures

#### Bitset

A **bitset** is an array whose each value is either 0 or 1. For example, the following code creates a bitset that contains 10 elements:

```c++
bitset<10> s;
s[1] = 1;
s[3] = 1;
s[4] = 1;
s[7] = 1;
cout << s[4] << "\n"; //1
cout << s[5] << "\n"; //0
```

The benefit of using bitsets is that they require less memory than ordinary arrays, because each element in a bitset only uses one bit of memory. For example, if n bits are stored in an int array, 32n bits of memory will be used, but a corresponding bitset only requires n bits of memory. In addition, the values of a bitset can be efficiently manipulated using bit operators, which makes it possible
to optimize algorithms using bit sets.

The following code shows another way to create the above bitset:

```c++
bitset<10> s(string("0010011010")); // from right to left
cout << s[4] << "\n"; // 1
cout << s[5] << "\n"; // 0
```

The function `count` returns the number of <u>ones</u> in the bitset:

```c++
bitset<10> s(string("0010011010"));
cout << s.count() << "\n"; // 4
```

The following code shows examples of using bit operations:

```c++
bitset<10> a(string("0010110110"));
bitset<10> b(string("1011011000"));
cout << (a&b) << "\n"; // 0010010000
cout << (a|b) << "\n"; // 1011111110
cout << (a^b) << "\n"; // 1001101110
```

#### Deque

A **deque** is a dynamic array whose size can be efficiently changed at both ends of the array. Like a vector, a deque provides the functions `push_back` and `pop_back` , but it also includes the functions `push_front` and `pop_front` which are not available in a vector.

The internal implementation of a deque is more complex than that of a vector, and for this reason, <u>a deque is slower than a vector</u>. Still, both adding and removing elements take O(1) time on average at both ends.

#### Stack

A **stack** is a data structure that provides two O (1) time operations: adding an element to the top, and removing an element from the top. It is only possible to access the top element of a stack.

````c++
stack<int> s;
s.push(3);
s.push(2);
s.push(5);
cout << s.top(); // 5
s.pop();
cout << s.top(); // 2
````

#### Queue

A **queue** also provides two O (1) time operations: adding an element to the end of the queue, and removing the first element in the queue. It is only possible to access the first and last element of a queue.

```c++
queue<int> q;
q.push(3);
q.push(2);
q.push(5);
cout << q.front(); // 3
q.pop();
cout << q.front(); // 2
```

#### Priority queue

A **priority queue** maintains a set of elements. The supported operations are insertion and, depending on the type of the queue, retrieval and removal of either the minimum or maximum element. Insertion and removal take O (log n) time, and retrieval takes O (1) time.

While an ordered set efficiently supports all the operations of a priority queue, the benefit of using a priority queue is that <u>it has smaller constant factors</u>. A priority queue is usually implemented using a *heap structure* that is much simpler than a balanced binary tree used in an ordered set.

By default, the elements in a C++ priority queue are sorted in decreasing order, and it is possible to find and remove the largest element in the queue. The following code illustrates this:

```c++
priority_queue<int> q;
q.push(3);
q.push(5);
q.push(7);
q.push(2); // 7 5 3 2
cout << q.top() << "\n"; // 7
q.pop();
cout << q.top() << "\n"; // 5
q.pop();
q.push(6);
cout << q.top() << "\n"; // 6
q.pop(); // 3 2
```

If we want to create a priority queue that supports finding and removing <u>the smallest element,</u> we can do it as follows:

```c++
priority_queue<int,vector<int>,greater<int>> q; // TODO: think about it 
```

#### Policy-based data structures

The g++ compiler also supports some data structures that are not part of the C++ standard library. Such structures are called *policy-based* data structures. To use these structures, the following lines must be added to the code:

```c++
#include <ext/pb_ds/assoc_container.hpp>
using namespace __gnu_pbds;
```

After this, we can define a data structure `indexed_set` that is like `set` but can be indexed like an array. The definition for int values is as follows:

```c++
typedef tree<int,null_type,less<int>,rb_tree_tag,
			tree_order_statistics_node_update> indexed_set;
```

Now we can create a set as follows:

```c++
indexed_set s;
s.insert(2);
s.insert(3);
s.insert(7);
s.insert(9);
```

The speciality of this set is that we have access to the indices that the elements would have in a sorted array. The function `find_by_order` returns an iterator to the element at a given position:

```c++
auto x = s.find_by_order(2);
cout << *x << "\n"; // 7
```

And the function `order_of_key` returns the position of a given element:

```c++
cout << s.order_of_key(7) << "\n"; // 2
```

If the element does not appear in the set, we get the position that the element would have in the set (the element is not inserted in the set at the same time):

```c++
cout << s.order_of_key(6) << "\n"; // 2
cout << s.order_of_key(8) << "\n"; // 3
```

Both the functions work in <u>logarithmic time</u>.

### Comparison to sorting

It is often possible to solve a problem using either data structures or sorting. Sometimes there are remarkable differences in the actual efficiency of these approaches, which may be hidden in their time complexities.

Let us consider a problem where we are given two lists A and B that <u>both</u> contain n elements. Our task is to calculate the number of elements that belong to both of the lists. For example, for the lists:
$$
A = [ 5, 2, 8, 9, 4]\ and\ B = [ 3, 2, 9, 5, 1],
$$
the answer is 3 because the numbers 2, 5 and 9 belong to both of the lists.

> I think there was an error: there were 4 elements in the set B.

A straightforward solution to the problem is to go through all pairs of elements in O(n^2), but next we will focus on more efficient algorithms.

#### Algorithm 1

We construct a set of the elements that appear in A, and after this, we iterate through the elements of B and check for each elements if it also belongs to A .

This is efficient because the elements of A are in a set. Using the set structure, the time complexity of the algorithm is O (n log n).

#### Algorithm 2

It is not necessary to maintain an ordered set, so instead of the set structure we can also use the `unordered_set` structure. This is an easy way to make the algorithm more efficient, because we only have to change the underlying data structure (we use hashing now). The time complexity of the new algorithm is O (n).

#### Algorithm 3

Instead of data structures, we can use sorting. First, we sort both lists A and B. After this, we iterate through both the lists at the same time and find the common elements. The time complexity of sorting is O (n log n), and the rest of the algorithm works in O (n) time, so the total time complexity is O (n log n).

This is the most effective algorithm. It only uses half the time compared to Algorithm 2 (the book tells us why by showing the table). Sorting is a simple procedure and it is done only once at the beginning of Algorithm 3, and the rest of the algorithm works in linear time. On the other hand, Algorithm 1 maintains a complex balanced binary tree during the whole algorithm.