# Sample Problems 

# Sample Problems - Exponential and Logarithmic Functions

## Sample problem 1 - evaluating logarithms
$(a)\ ln \left(1/e^3\right)$:
```python
math.log(1/(math.e**3))
# -3.0
```
$(b)\ e^{\ln{2} - \ln{4}}:$
```python
math.exp(math.log(2) - math.log(4))
# 0.5
```
## Sample Problem 2 - Simplifying Exponential and Logarithmic Expressions
Use the properties of logarithms to write the expression $\ln{x} - 3\ln{y} + 4\ln{(z + 1)}$ as a single logarithm. You may use SymPy.
```python
from sympy import *
x, y, z=symbols('x, y, z', positive=True)
g = logcombine(ln(x) - 3*ln(y) + 4*ln(z + 1))
print(g)
print(g.expand()) # verifying
```

## Sample Problem 3 - Solving Exponential and Logarithmic Equations
$(a)\ e^{3x^{2}} = (e^{4})^{4x + 3}$
```python
from sympy import *
x = symbols('x')
solveset(exp(3*x**2) - exp(16*x + 12), x, domain = S.Reals)
# [-2/3, 6]
```
$(b)\ \ln(x+1) - \ln(x) = 1$
```python
from sympy import *
x = symbols('x')
solve(ln(x+1) - ln(x) - 1, x, domain = S.Reals)
# [1/(-1 + E)]
```

## Sample Problem 4 - Finding an Exponential Function.
The function g(x) has the form $g(x) = 3^{kx}$, where k is a constant. If g(−4)=9, then what is the value of k?
```python
from sympy import *
k = symbols('k')
sol = solveset(3**(-4*k) - 9,k, domain = S.Reals)
# {-log(9)/(4*log(3))}
sol.evalf()
# {-0.5}
```
## Sample Problem 5 - Predictions with an Exponential Function
The population P of Miami, Florida is given by the function $P(t) = 362,000e^{0.01t}$, where t is the number of years since 2000.

(a) According to the function P(t), what was the population of Miami in the year 2010?

(b) According to the function P(t), in what year will the population of Miami reach 450,000 people?

```python
from sympy import *
t = symbols('t')
p_2010 = 362000 * exp(0.01*10)
print(p_2010.evalf()) # we could use expr.subs(t, 10)
# 400071.872343384 - round to the whole number: 400072 people.
t_solution = solve(362000 * exp(0.01*t) - 450000, t)
print(t_solution[0] + 2000)
# 2021.76033709386
# or we could solve using solveset:
pop = 362000*exp(0.01*t)
# Solve for t when pop = 450000
solveset(Eq(pop, 450000), t, domain=S.Reals)
sol=-100.0*log(181) + 100.0*log(225)
sol.evalf()
# {21.7603370938594}
# Thus, we can say that according to the exponential function, 
# the population of Miami will reach 450,000 in the year 2021 or 2022.
```
