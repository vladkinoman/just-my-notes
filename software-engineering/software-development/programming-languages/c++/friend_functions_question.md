# Friend Functions

What if B class has a friend-function from class A and this function
use private member value from class B.


```
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

```
// function
void A :: print_b_from_A(B x)
{
	cout << "b from A = " << x.b << endl;
}
```

Question: Could it be possible to implement? If so, where should the function be implemented? 