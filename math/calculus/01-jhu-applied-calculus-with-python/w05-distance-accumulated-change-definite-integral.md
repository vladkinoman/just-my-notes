# Distance, Accumulated Change, and the Definite Integral

## Area under a line (intuition)

Find the area of a triangle (/|, where area below is b from 0 to 1)

Typical formula: $A = \frac{1}{2} b h = 1/2 \cdot 1 \cdot 1 = 1/2$

We approximate using rectangles of an identical base, but different height:

1. **Base** of a rectangle: $\Delta x = \frac{b - a}{n} = \frac{1-0}{n}$
2. **Sample point** (on the x axis, we have x1 > 0, xn = 1): $x_i = a + i \Delta x = i \cdot \frac{1}{n} = \frac{i}{n}$
3. **Height**: $f(x_i) = f(i/n) = i/n$
4. **Area**: 
$$
\displaystyle A = \lim_{n \to \infty} \Delta x \cdot \sum_{i=1}^n f(x_i) = \lim_{n \to \infty} \frac{1}{n^2} \cdot \sum_{i=1}^n i = \lim_{n \to \infty} \frac{1}{n} \cdot \frac{n (n+1)}{2} = \lim_{n \to \infty} \frac{n^2 + n}{2n^2} = 1/2
$$

> We are looking at the leading terms.
 
## Riemann Sums

Riemann sums are used to estimate the area between the graph of a function f(x) and the x-axis on some interval, [a,b].

We can find a Riemann sum for a function when we have a table of function values, as well as when we have a function expression.

We divide the interval [a,b] into n subintervals with endpoints x0 = a, x1, ⋯ , xn−1, xn=b. Let $\Delta x_i = x_{i+1} - x_{i}$ represent the length of the ith subinterval. 

**Left-hand Riemann Sum**. 
$$
\displaystyle\sum_{i=0}^{n-1}f(x_{i})\Delta x_{i} = f(x_0)(x_1 - x_0) + f(x_1)(x_2 - x_1) + \cdots + f(x_{n-1})(x_n - x_{n-1})
$$

**Right-hand Riemann Sum**. 
$$
\displaystyle\sum_{i=0}^{n-1}f(x_{i+1})\Delta x_{i} = f(x_1)(x_1 - x_0) + f(x_2)(x_2 - x_1) + \cdots + f(x_n)(x_n - x_{n-1})
$$

If a function is either strictly increasing or strictly increasing, then we know whether each Riemann sum overestimates or underestimates the true value:

- For a **decreasing** function, a left endpoint sum is an overestimate and a right endpoint sum is an underestimate.
- For an **increasing** function, a left endpoint sum is an underestimate and a right endpoint sum is an overestimate.

Increasing the number of subintervals n, results in a more accurate estimate.

Python implementation:
```python
x = [ # variable values ]
f = [ # function values ]
n = # number of subintervals
left_rect = [f[i]*(x[i+1]-x[i]) for i in range(0,n)]
right_rect = [f[i+1]*(x[i+1]-x[i]) for i in range(0,n)]
LHS = sum(left_rect)
RHS = sum(right_rect)
```

> This is nice when you have a table of values.

Ex.  Find left-hand and right-hand Riemann sums for the function ff(x) = x^2 + 2x + 1 on the interval [−1,1], using four rectangles.

In this case, a=−1, b=1, and n=4. The endpoints of the subintervals are a, a+dx, a+2⋅dx, …, a+(n−1)⋅dx, a+n⋅dx = b. We can say that the ith endpoint is a+i⋅dx, for 0≤i≤n.

- For the left endpoints, shown in the list x_left, we let i range from 0 to n−1, by choosing range(0, n).
- Similarly, for the right endpoints in x_right, we let i range from 1 to n by choosing range(1, n + 1).

```python
x = symbols('x')
f = x**2  + 2*x + 1
a = -1
b = 1
n = 4
dx = (b - a)/n 
x_left = [a + i*dx for i in range (0, n)]
x_right = [a + i*dx for i in range(1,n+1)]
f_left = [f.subs(x,i) for i in x_left]
f_right = [f.subs(x,i) for i in x_right]
LHS = sum(f_left)*dx
RHS = sum(f_right)*dx
print(f'The left-hand sum is {LHS} and the right-hand sum is {RHS}')
```

## The Definite Integral

The definite integral of f from a to b is 

$$
\displaystyle\int_a^b f(x)\,dx = \lim_{n\to\infty}\sum_{i=0}^{n-1} f(x_{i}) \Delta x_{i} =  \lim_{n\to\infty}\sum_{i=0}^{n-1} f(x_{i+1}) \Delta x_{i}
$$

> If the limit exists, f is "integrable". x in the integral is a dummy variable (u can use theta or t). $\int$ sign means "s" ("summing things"). dx is a "bookend" (форзац)

f(x) is called the **integrand**, a is the lower limit (of integration), and b is the upper limit (of integration). 

The definite integral is obtained by letting the number of subintervals n in either a left-hand or right-hand Riemann sum become larger and larger: $n\to\infty$. As n increases, the estimate becomes more and more accurate, and the left- and right-hand sums both approach the same number.

Computing using python:

```python
# the second argument is a tuple
integrate(f, (x, a, b))
# or
Integral(f, (x, a, b)).doit()
```

Properties of the def integral:

1. minus
2. area from a to a = 0
3. cdx = c(b-a)
4. f(x)+-g(x)
5. cf(x) = c out
6. int from a to c = int from a to b + int from b + c
7. if f(x) >= g(x), same applies to integrals.

## Area Under a Graph

If a function f(x) is positive for all x on the interval [a,b], then the definite integral $\displaystyle\int_{a}^{b}f(x)\,dx$ gives the area under the graph of f(x) and above the x-axis.

If f(x) is positive for some x values and negative for some xxx values on [a,b], then $\displaystyle\int_{a}^{b}f(x)\,dx$ is A1−A2​, where A1​ is the area of the region above the x-axis and below the graph of f and A2 is the area of the region below the x-axis and above the graph of f.

Thus, if we want to find the **total area** between the graph of f(x) and the x-axis on the interval [a,b], we can separately integrate over the subintervals where f is positive and those where f is negative, change all of the results to positive numbers, and then add.

## Interpreting the Definite Integral

If the function f(x) represents a rate of change, then the definite integral $\displaystyle\int_{a}^{b}f(x)\,dx$ can be interpreted as total change between x=a and x=b.

The units for $\displaystyle\int_{a}^{b}f(x)\,dx$ are the product of the units of f(x) and the units of x.

For example, suppose $v(t)\text{ meters per second}$ represents the velocity of a cyclist traveling in one direction on a straight path.

Then the units for $\displaystyle\int_{0}^{60}v(t)\,dt$ are $\displaystyle\frac{\text{meters}}{\text{second}}\times\text{second} = \text{meters}$. This definite gives the total distance traveled by the cyclist over the time period from t=0 to 60 seconds later.

If a country's population is increasing at the rate $\frac{dP}{dt}\text{ people per year}$, then $\displaystyle\int_{2010}^{2020}\frac{dP}{dt}\,dt$ gives the total amount of people that the population has increased by from 2010 to 2020.

If water is flowing out of a tank at the rate $W'(t)\text{ cubic feet per minute}$, then $\displaystyle\int_{1}^{5}W'(t)\,dt$ gives the total amount of water, in cubic feet, that has flowed out of the tank between t=1 minute and t=5 minutes.

## Sample problems

> Some problems, like LRS calculator must use parsing: `sympy.parsing.sympy_parser import parse_expr`. This is useful when you are trying to parse function you got from the `input`.

**Sample problem 1**

a) Approximate the total change in the population of the city between 1960 and 2010, using the rate of change at the beginning of each decade.

```python
year = [1960, 1970, 1980, 1990, 2000, 2010]
rate = [36, 40, 63, 64, 10, 8]
a = 1960
b = 2010
left_rect = [rate[i] * (year[i+1] - year[i]) for i in range(0, len(year)-1)]
LHS = sum(left_rect)
# 2130
```

b) Is the approximation from part (a) an overestimate or an underestimate?

~~As we see by first points, it's an increasing function, and because we applied a left endpoint sum, we got an underestimate.~~

If a function is increasing, then the left-hand Riemann sum provides an underestimate of its definite integral. If a function is decreasing, then the left-hand Riemann sum is an overestimate.

Here, the function we are integrating (the rate of change in the population), is neither increasing nor decreasing over the entire time period. It appears to be increasing from 1960 to 2010, then decreasing, and we don't know what was happening in between the values given in the table.

For this reason, it cannot be determined whether the approximation is an underestimate or an overestimate.

**Sample Problem 2 - Interpreting the Definite Integral**. A farm purchases a new piece of machinery, valued at 200,000. The machine's value depreciates at the rate $r(t) = 24e^{-0.22t}$ thousand dollars per year, where t is the number of years since it was purchased.

a. What does the definite integral $\displaystyle\int_{a}^{b} r(t) \ dt$ represent?  
It represents the total price that the machine lost during the period [a,b], where a, b are years.  

> The definite integral of a rate of change gives the total change between the bounds of the integral. The units for the definite integral are the product of the units for the function and the units for the independent variable.  
Since r(t) is measured in thousands of dollars per year and t is measured in years, the integral $\displaystyle\int_{a}^{b}r(t) \ dt$ is measured in thousands of dollars.  
This definite integral gives the **total loss in value (in thousands of dollars) of the machinery from a years to b years after it was purchased.**

b. Find the value of the machine 5 years after it was purchased.

> Note that since $\displaystyle\int_{a}^{b}r(t) \ dt$ is measured in thousands of dollars, we multiply by 1000 so that the units match up.

```python
t = symbols('t')
val_diff_of_5_years = Integral(24*exp(-0.22*t), (t, 0, 5)).doit()
val_after_5_years = 200000 - val_diff_of_5_years*1000
print(val_after_5_years)
# 127222.300039790
```

So, the value of the machine 5 years after it was purchased is `$`27222.30.

**Sample Problem 3 - Integrals and Area**. Let h(x)=16−x^2.

a. Compute $\displaystyle\int_{0}^{6}h(x) \ dx$
```python
x = symbols('x')
h_x = 16 - x**2
integral = integrate(h_x, (x, 0, 6))
# 24
```
b. Find the total area between the graph of h(x) and the x-axis over the interval [0,6].

If we want to find the total area between the graph of f(x) and the x-axis on the interval [a,b], we can separately integrate over the subintervals where f is positive and those where f is negative, change all of the results to positive numbers, and then add.

First, we must determine where on the interval [0,6] the graph of the given function h(x) is above or below the x-axis. We can do this by solving g(x)=0.

```python
x = symbols('x') 
h = 16 - x**2 
solveset(h, x)
# {-4, 4}
```

Of the two solutions, 4 is in our interval.

By testing the values of h in the two intervals [0,4] and [4,6], we can determine that h is positive in the first and negative in the second.

Thus, the total area will be given by $∫_0^4g(x)\, dx−∫_4^6h(x)\, dx$.

We can find the total area with the following code. We use the evalf() function to obtain the area as a floating-point number.

```python
x = symbols('x') #solution
h = 16 - x**2 
# area above x axis 
above = integrate(h, (x, 0, 4)) 
# area below x axis 
below = -integrate(h, (x, 4, 6)) 
# total area 
total_area = above + below
total_area.evalf()
# 61.3333333333333
```

The total area is 184/3, which is approximately 61.33333

