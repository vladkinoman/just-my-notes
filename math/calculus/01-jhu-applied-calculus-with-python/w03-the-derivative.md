# The Derivative

**Def**. The derivative of f(x) at x = 0, denoted by f'(x) (f prime of x, y' - y prime) is:

$$
\displaystyle f'(x) = \lim_{h \to 0}{\frac{f(a+h) - f(a)}{h}}
$$

if the limit exists.

**The derivative**

- = slope of the tangent line, f'(a) = m. f′(a), the derivative of f at the number a, is the slope of the tangent line to y=f(x) at the point (a,f(a)).

  We can use the point-slope form of a line to write the equation of a tangent line.

  The tangent line to the graph of f(x) at the point where x=a is the line with slope f′(a) including the point (a,f(a)). It has the equation:

  y - f(a) = f'(a)(x - a)

- = instantaneous rate of change. f′(a) is the instantaneous rate of change of f(x) with respect to x when x=a. 
- = instantaneous velocity (f starts off with position f). If an object's position at time t is given by the function p(t), then the object's instantaneous velocity at the time t=a is given by the derivative of the position function, p′(a).
- = marginal cost (economy).
- = etc.

Physics: f(x) - positional f, f'(x) - velocity (миттєва швидкість руху матеріальної точки), f''(x) - acceleration (миттєве прискорення).

Notation:

$$\displaystyle f'(x) = y' = \frac{dy}{dx} = \frac{df}{dx} = \frac{d}{dx}f(x)$$

> The fractions with d are also called the Leibniz's notation.

> f'''(x) is ok to write, use $f^{(i)}(x)$ for others. This notation uses numbers: $\frac{d^4f}{dx^4}$.

Ex. Position function  $s(t) = \frac{1}{t^2}$. Find:

a. $v_{avg}$ over time [1, 2]? $v_{avg} = \frac{\Delta s}{\Delta t} = \frac{s(2) - s(1)}{2 - 1} = -3/4$.

> also, $v_{avg} = m_{secant}$ (m is a slope). Formula for $m_{secant}$ is also called "Difference quotient".

b. $v_{inst}$ at t=1?

> How fast am I moving? = instantaneous velocity.

Ex.

$$
\displaystyle
f(x) = \left\{
\begin{array}{rl}
x sin{\frac{1}{x}}, & x \ne 0\\
0, & x = 0\,
\end{array}
\right.
$$

$$
\displaystyle f'(0) = \lim_{h \to 0}{\sin{\frac{1}{n}}}
$$

> sin is continuous, so can move limit inside.

$$
\displaystyle = \sin{\lim_{h \to 0}{\frac{1}{n}}} = DNE
$$

> this does not have well-defined derivative.

Imagine:

$$
 \displaystyle
f(x) = \left\{
\begin{array}{rl}
x^2 sin{\frac{1}{x}}, & x \ne 0\\
0, & x = 0\,
\end{array}
\right.
$$

$$
\displaystyle f'(0) = \lim_{h \to 0}{h \cdot (-1)} \le \lim_{h \to 0}{h \cdot sin{\frac 1 h} \le \lim_{h \to 0}{h \cdot (+1)}}
$$

If you have a function that is bounded and lim -> 0, then use the squeeze theorem.

$$
\displaystyle = \lim_{h \to 0}{h \cdot sin{\frac 1 h}} = 0
$$

by squeeze theorem.

Ex.

$\frac{d}{dx} |x|$. Use limits

$$
\displaystyle f'(x) = \lim_{h \to 0}{\frac{|x+h| - |x|}{h}} = \left. 
\begin{array}{rl}
\text{if }x > 0, & \lim_{h \to 0^+}{...} = 1\\
\text{if }x > 0, & \lim_{h \to 0^+}{...} = -1\\
\text{if }x = 0, & \lim_{h \to 0^+}{|h|/h} = DNE\\
\end{array} 
\right.
$$

So, 

$$
\displaystyle
f'(x) = \left\{
\begin{array}{rl}
1, & x > 0\\
-1, & x < 0\,
\end{array}
\right. = |x|/x
$$

f fails to be differentiable:

- f' = lim = DNE
- Theorem: if f diff, then it's continuous; if not continuous (counter positive0, then it's not diff.
- f'(x) = slope of the tangent line. / - m+, \ - m-, — - m=0, | - UNDEFINED. Remember that when f(x) is defined, the f'(x) might be undefined. It happens.

## Units of the derivative

The units of the derivative $\frac{dy}{dx}$ are units of units of $\frac{\text{units of }y}{\text{units of }x}$. 

For example, if an object's position (in meters) at time t (in minutes) is given by the function p(t), then its velocity is p'(t) meters per minute.

If the cost of producing x items is C(x) dollars, then the derivative C′(x) is measured in dollars per item.

## Interpretation of the derivative

If the derivative of the function f(x) is not changing rapidly near the point x=a, then the derivative at x=a is approximately equal to the change in f(x) when x increases by 1 unit.

For x-values near x=a, we can use the tangent line to the graph of f at a to approximate function values.

**Tangent Line Approximation**. f(x)≈f(a)+f′(a)(x−a).

## Derivatives and growth

The first derivative tells us whether a function's values are increasing or decreasing.

- If f′(x) > 0 on an interval, then f(x) is increasing on that interval.
- If f′(x) < 0 on an interval, then f(x) is decreasing on that interval.
- If f′(x) = 0 on an interval, then f(x) is constant on that interval.

The second derivative tells us whether the first derivative is increasing or decreasing on an interval. 

- If f′′(x)>0 on an interval, then f′(x) is increasing on that interval.
- If f′′(x)<0 on an interval, then f′(x) is decreasing on that interval.

We can combine the information from the first and second derivatives as follows.

If the sign of the first and second derivative are the same, then the rate of change is speeding up:

- If f′(x)>0 and f′′(x)>0 on an interval, then f(x) is increasing at a faster and faster rate on that interval.
- If f′(x)<0 and f′′(x)<0 on an interval, then f(x) is decreasing at a faster and faster rate on that interval. 

If the sign of the first and second derivative are different, then the rate of change is slowing down:

- If f′(x)>0 and f′′(x)<0 on an interval, then f(x) is increasing at a slower and slower rate on that interval.
- If f′(x)<0 and f′′(x)>0 on an interval, then f(x) is decreasing at a slower and slower rate on that interval.

## Sympy

You can take a derivative using limits, but there is a simple way:

```python
from sympy import *
x, h = symbols("x h")
f = x**2
d = Derivative(f, x).doit()
print(d)
# 2*x
```

You can also use the diff f:

```python
d = diff(f, x)
print(d)
# 2*x
```

To take the 2nd derivative:

```python
diff(f, x, x)
# or
diff(f, x, 2)
print(d)
# 2
```

## Sample Problems

**Sample problem 1**.

```python
from sympy import *
x = symbols('x')
q_x = (x + 1)/exp(x)
d_q = diff(q_x, x)
x0 = 1
m = d_q.subs(x, x0)
tng_line = m * (x - x0) + q_x.subs(x, x0)
# -(x - 1)*exp(-1) + 2*exp(-1)
```

**Sample problem 2**. An object's position at time t≥0 is given by p(t)=5t^4 − 3t^2+2. 

```python
t = symbols('t')
p_t = 5*t**4 - 3*t**2 + 2
# a
v_t = diff(p_t, t)
print(v_t)
# 20*t**3 - 6*t
# b
a_t = diff(p_t, t, t)
print(a_t)
# 6*(10*t**2 - 1)
```

**Sample problem 3**. The cost C (in dollars) to produce x kilograms of a chemical is given by a function C=f(x). Interpret the meaning of the following statements:

a. f(150) = 1700.  
It means you have to pay 1700 to produce 150 kilograms of a chemical.
b. f'(150) = 4.  
We can find the tangent line to f at the point (150, 1700).  
y = 1700 + 4(x-150)  
If this derivative is not changing rapidly near the point (150, 1700), then  
f(x) ~ 1700 + 4(x-150)  
f(151) ~ 1700 + 4(151-150) = 1704 dollars

> 
f′ represents the rate of change in the chemical's production cost per kilogram. Depending on how much of the chemical is already produced, it may become more or less expensive to produce more.  
**This equation tells us** that when x=150 kilograms of the chemical are produced, the cost of producing more of the chemical is 4 dollars per kilogram. That is, the 151st kilogram of the chemical will cost about 4 to produce.  
From this equation, we could approximate the cost of producing 151 kilograms as f(151)≈f(150)+f′(150)=1700+4=1704 dollars.

**Sample problem 4**. A diver's distance F from the water's surface (measured in meters) is a function of t, time in minutes since she began the dive. When she is 20 meters below the surface, she continues to descend, at a slower and slower rate. What does this tell us about the signs of the first and second derivatives of F?

When s = 20, F'>0 and F''<0, which means F is increasing at a slower and slower rate on that interval.

>   
If the diver is descending, this means her distance from the surface is increasing. Thus we can say that F', which is the rate of change in her distance from the surface over time, must be positive.  
The second derivative F'' represents the rate of change in the first derivative over time. If the diver is descending at a slower and slower rate, this means that the pace at which she moves away from the water's surface, F', is decreasing. Thus, F'' must be negative.

