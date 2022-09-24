# The Fundamental Theorem of Calculus

## Antiderivatives and Indefinite Integrals

### Definitions

An **antiderivative** of the function f(x) is a function F(x) whose derivative equals f(x), that is, F′(x)=f(x).

If F(x) is one antiderivative of f(x), then f(x) has a **family of antiderivatives**, F(x)+C for any constant C.

If F′(x)=f(x), the **indefinite integral of the function** f(x) is ∫f(x)dx=F(x)+C, where C is a constant. 

If the integral of f exists, then f is called **integrable**.

Remember the difference between definite and indefinite integrals:

- indefinite int. = family of functions
- def. int. = number (#)

### Antiderivative Formulas

Same, but we have two differences.

Power Rule for Antiderivatives:

- For any real number n≠−1, $\displaystyle \int x^n\, dx=1/(n+1) \cdot x^{n+1}+C$
- $\displaystyle \int x^{−1}\, dx = \int \frac{1}{x}dx = ln⁡|x| + C$

> we need that || to match domains of the integral function (all reals except x=0) and the function on the right (x>0).

## The Fundamental Theorem of Calculus

The Fundamental Theorem of Calculus tells us that the definite integral of a function's derivative (rate of change) over an interval is equal to the total change in the function values over that interval.

**The Fundamental Theorem of Calculus** (Newton + Leibnitz). If F′(x) is continuous (smooth) on [a,b], then $\displaystyle \int_a^b F′(x)\, dx = F(x) |_a^b = F(b) − F(a)$.

> | is a evaluation bar. Also, u pick F(x) w| c = 0, b/c F(B)-F(a) + c - c.

> this is a connection btw finding slopes of tangent lines (derivative) & net accumulation (integral).

If we know an antiderivative for a function, we can apply the Fundamental Theorem of Calculus to quickly find the function's definite integral.

### Understanding

Part 1:

$\displaystyle A(t) = \int_a^t f(x)\, dt$ is accumulative function. The lower limit doesn't really matter, because:

$$\displaystyle\frac{d}{dt}\left[\int_a^t f(x)\, dt\right] = f(t)$$

Part 2:

$$\displaystyle \int_a^b f(x)\, dx = \int_a^b \frac{d}{dx} [F(x)]\, dx = F(b) − F(a)$$


Ex. 

$$
\displaystyle \frac{d}{dx}\left(\int_a^b f(x)\, dx\right) = 0
$$

> this is a def integral = #

Ex.

$$
\displaystyle \frac{d}{dx}\left(\int_a^x f(t)\, dt\right) = f(x)
$$

> A(x): this is a net accumulator, although defined in terms of x. Fund. theorem kicks in: so, the derivative of the net accumulator function, that is the original function with a change of variable, and that's f of x.

Ex.

$$
\displaystyle \frac{d}{dx}\left(\int_2^{1/x} \arctan t\, dt\right) = \arctan\left(\frac{1}{x}\right) \cdot -\frac{1}{x^2}
$$

> Again, we have a net accumulator A(1/x), but this time it is a composition. So, we need to apply a chain rule: $\frac{d}{dx} A(1/x) = A(1/x) \cdot \frac{d}{dx}(1/x)$.

Ex.

$$
\displaystyle \int_\pi^{2\pi} \cos \theta\, d\theta = \sin \theta |_\pi^{2\pi} = 0 - 0 = 0.
$$

## Applications

We can use the Fundamental Theorem of Calculus to help us calculate definite integrals in two applications.

### Total Change

Rearranging the equation from the Fundamental Theorem of Calculus, we can say that $\displaystyle F(b) = F(a) + \int_a^b F′(x)\, dx$.

That is, if we know the rate of change F′(x) and an initial value F(a), then we can evaluate the function at some other value, b.

### Average Value

The average value of f(x) on the interval [a,b] is given by $\displaystyle f_{\text{avg}}=1/(b−a) \int_a^bf(x)\, dx$.

The units for the average value of f(x) are the same as the units for f(x).

Recall that to take the average of n numbers, we add the numbers and divide by n. The average value formula for a function generalizes this idea, using the integral to take the sum of infinitely many function values.

## Sample problems

**Sample Problem 2 - Average Value**. 

The temperature in a city on a certain day is f(t)=58 − 0.2t + 0.09t^2−0.0005t^3−0.0001t^4 degrees Fahrenheit, where t represents hours since midnight. Find the average temperature in the city over the whole day.

```python
t = symbols('t')
f_t = 58 - 0.2*t + 0.09*t**2 - 0.0005*t**3 - 0.0001*t**4
(1/(24-0))*integrate(f_t, (t, 0, 24))
# 64.5164800000000
F = (1/(24-0))*integrate(f_t, (t, 0, 24))
(F-32) * 5/9
# 18.0647111111111
```

**Sample Problem 3 - Accumulated Change**. The valuation (in dollars) of a business is given by the function V(t), where t represents the year, with t=0 corresponding to 2005. The company was worth approximately $5.2 million in 2007 and $7.2 million in 2011. 

(a) Find $\int_2^6 V′(t)\, dt$.

(b) If V′(t)=500000−25t2, estimate the valuation of the business in 2015.

You may use SymPy to make calculations.

a. EZ, V(t=6) - V(t=2) = 7.2 - 5.2 = 2 million

b. The most recent valuation we have for the business is from 2011. However, since we now have a function approximating the rate of change in valuation, we can compute the total change in valuation between 2011 and 2015. We do this by integrating the rate of change.

Since t=6 corresponds to 2011 and t=10 corresponds to 2015, the change in valuation from 2011 to 2015 is given by $∫_6^{10}V′(t)\, dt$.

By adding the known net worth in 2011 to the change between 2011 and 2015, we find the company's net worth in 2015:

$$V(10)=V(6)+\int_6^{10}V′(t)\, dt$$

We can compute this with SymPy using the following code.

```python
t = symbols('t')
V_prime = 500000 - 25*t**2
# valuation in 2011 or t = 6 
V_6 = 7200000 
# change from 2011 to 2015 
change_6_10 = integrate(V_prime, (t, 6, 10)) 
# add change to valuation from 2011 
V_10 = V_6 + change_6_10
```

The result is 27580400/3, which can be evaluated as the floating-point number 9193466.66666667 (use `evalf()`).

Therefore, the valuation in 2015 was approximately `$`9,193,466.67
