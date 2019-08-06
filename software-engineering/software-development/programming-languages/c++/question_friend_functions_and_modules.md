# Friend Functions Questions

## Where should the friend function of the other class be implemented and what we should to add to the .h files

Suppose: B class has a friend-function from class A and this function
use private member value from class B.

```C++
// B.h
class B
{
    int b;
public:
    B();
    B(int b);
    void f();
    friend void print_b(B x); // OK, print_b isn't a member-function
    friend void A::print_b_from_A(B x); //ERROR, print_b_from_A belongs to A class
};

```

```C++
// A.cpp
// friend function
void A :: print_b_from_A(B x)
{
    cout << "b from A = " << x.b << endl;
}
```

Question: Could it be possible to implement? If so, where should the function be implemented? What should we add to .h files?

Answer: Уes! The friend function should be implemented in A.cpp file but it is important to have `class B` declaration in A.h file just to help compiler to understand what `B x` expression is. We don't need to add declarations or includes to B.h if we will keep the correct order of including of A.h and B.h files.

Proof: First of all, if you wok in Visual Studio IDE you need to add `pragma once` to all your headers:

```C++
#pragma once
//A.h

class A
{
```

```C++
#pragma once
//B.h

class B
{
```

Then, add to main.cpp (file with main function) these lines in this order:

```C++
#include "A.h"
#include "B.h"
```

And, after that, you need to add next line to the A.h file to declare class B:

```C++
//A.h

class B;

class A
{
```

So we forward declare class B, so that it's visible in class A definition where we use object of class B in our friend function. It won't work if you include B.h primarily in main.cpp.

As you can see compiler says nothing about using `b` variable in the function of A because it's the friend function.

## What should we add to .h files if we changed the order of including (first B, then A) and still use friend function from the main class

Suppose: In main.cpp we include first B then A files.

```C++
#include "B.h"
#include "A.h"
```

And now we have that B.h includes first and the includes A.h file:

```C++
//B.h
#pragma once

class B
{
	int b;
public:
	B();
	B(int b);
	void f();
	friend void print_b(B x);
	friend void A::print_b_from_A(B x);
};
```

```C++
//A.h
#pragma once

class B;

class A
{
	int a;
public:
	A();
	A(int a);
	void print_b_from_A(B);
};	
```

After that we get an error: `Error C2653 'A': is not a class or namespace name`.

Question: What should we add to .h files if we changed the order of including (first B, then A) and still use friend function from the main class?

Answer: This sample generates C2653 error because a scope name is used but not declared. The compiler expects a class, structure, union, or namespace name before a scope operator (`::`). If we want to keep that including order we can't just use `class A;` declaration (because compiler wants to check that class for containing `print_b_from_A(B x)` method not the name like it was with `class A;` I guess). We need to add next line to the B.h file:

```C++
//B.h
#pragma once

#include "A.h"

class B
{

```

Also it is necessarily  to not touch file A.h at all. We don't want to change or delete `class B;` line because we use name `B` in the code:

```C++
//A.h
#pragma once

class B; // we need this declaration

class A
{
	//...
	void print_b_from_A(B); // here, we use name B 
};	
```

## Sources

1. [Compiler Error C2653](https://docs.microsoft.com/en-us/cpp/error-messages/compiler-errors-2/compiler-error-c2653?view=vs-2019)