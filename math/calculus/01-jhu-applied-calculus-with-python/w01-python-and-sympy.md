# Python & SymPy

## SymPy basics

SymPy is a library for working with math expr. in **symbolic form**.

- Symb. com. allows us to manipulate expr. with variables that are not assigned a value.
- Symb. com. retains the exact val. of expr., rather than rounding them into decimals.

The alternative to symb. comp. is **numerical computation**. Values are represented as either ints or floating-point numbers.

> [SymPy tutorial](https://docs.sympy.org/latest/tutorial/index.html).

Importing:

```python
from sympy import *
```

To use vars as unknowns, we define them with **symbols()**.

```python
x = symbols('x') # or x = Symbol("x")
x + 1
# prints x + 1
a, b, c = symbols('a, b, c')
tau = symbols('tau')
```

We use **expression.subs(x, number)** to substitute any *number* for the var x in an expression.

> Don't forget to define expression before!

Cool feature of symb. comp. is retaining exact values:

```python
Rational(1, 3)
# prints 1/3
```

SymPy keeps the same meaning for all arith. operators including division (/) & floor division (//).

> In Python, / results in either an int or a float. If the quotient happens to be a non-terminating decimal, it is truncated.

Use **expr.evalf()** to convert an expr. to a float (a decimal approx. of the answer).

```python
expr = sqrt(2) # sqrt(2) is an irrational
expr.evalf() # prints 1.41421356237310
```

Expand and factor:

```python
g = (x+y)**2
i = g.expand() # expands to x**2 + 2*x*y + y**2
i.factor() ## factor back to (x+y)**2
```

Use **expr.simplify()** in order to simplify an expression.
