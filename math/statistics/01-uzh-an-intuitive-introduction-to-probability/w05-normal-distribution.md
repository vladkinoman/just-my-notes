# Normal distribution

[TOC]

most famous p. distribution.

## Continuous Random Variables

Cont. r. v. X can take on a continuum of possible values.

Ex. time to finish a task, length of an item, thickness.

Stock prices are discrete. Nevertheless, it's easier to model those processes (those in Ex.) with cont. rand. variables,

There's an infinite # of numbers  btw 0 & 1. We cannot count them.

Sum of those p from the interval can be > 1. It's not possible! So the p of every number must be zero, or said differently, no individual number can have a positive probability.

Theorem:

- for every continuous rand. var. X in the universe, P(X=x) = 0 for all possible values x.

**Random variable on [0, 1]**

P(0.0 ≤ X ≤ 0.25) = 0.25 = 25%

P(0.25 ≤ X ≤ 0.5) = 0.25 = 25%

P(0.5 ≤ X ≤ 0.75) = 0.25 = 25%

P(0.75 ≤ X ≤ 1.0) = 0.25 = 25%

It's a **uniform distribution** on the interval [0, 1]!

Same will be with P(0.0 ≤ X ≤ 0.1) = ... = 0.1

It doesn't make sense to talk about p of points. But as soon as we have a little range within our larger range, we can talk about positive probabilities.

In disc. r. v, we have single numbers, and they have probabilities. Here, we represent probabilities through areas underneath a curve.

The representation of p. underneath curves corresponds to what we learned about integration.

**Function for the Curve**

Curve is described by probability density function (pdf) f:

- f(x) >= 0 for all elements
- the entire area underneath curve = 1:

$$
\int^{+\infty}_{-\infty} f(x) dx = 1
$$

**PDF and CDF**

Since it doesn't make sense to talk about individual probs., the only probs. we can talk about is for areas. The key function is the cumulative dist. function.

The cumulative distribution function (cdf) F at a point x0 is the area under the graph of f up to x0:
$$
F(x_0) = P(X \le x_0) = \int^{x_0}_{-\infty} f(x) dx
$$
**Using the CDF**
$$
P(a < X < b) = P(a < X \le b) = P(a \le X \le b)
$$
$$
 = F(b) - F(a) = \int^{b}_{a} f(x) dx
$$

> Ex. P(0.18 ≤ X ≤ 0.28) = F(0.28) - F(0.18) = 0.28 - 0.18 = 0.1 
<p> 
- f(x): rectangle, area underneath the density 
- F(x): the CDF starts out at 0, moves up (/) to 1, and then stays 1 forever.

## Normal distribution

bell curve - the most famous probability distribution

It shows up in many applications.

**Central Limit Theorem**

The probability distribution of a sum of independent random variables of comparable variance tends to a normal distribution as the number of summed random variables increases.

> ugly proof

It's extremely relevant in everyday applications, b/c we have process when lots of little things come together:

- Large markets: many sellers & many buyers. We have lots of opinions of what should be a price -> we see the normal distribution in action.
- Production process: various variables (pressure, temperature,...). They compound to something that's often very well approximated by the normal distribution.
- Field of statistics: p distributions of sample means or sample proportions. The normal distribution shows up as the samples get large.
- Business, there is an area of operations management. Something called quality management, the so-called Six Sigma, and there normal distribution is used.
- Finance: concept of value at risk. Normal distribution is there too, but it's became widely criticized for some various reasons. Nevertheless, p distr. close or similar to the normal distr. are used there to this day.

Bell func. is symmetric around the mean, the spread determined by the stddev.

Density function:
$$
f(x) = 1/ \sqrt{(2\pi\sigma)} * e^{-(x - \mu)^2/2\sigma^2}
$$

> the larger sigma gets, the larges the standard deviation. the smaller it gets, the more narrow the curve gets and the higher it is
>
> mu gives us point where it's centered, and smaller mu moves the curve to  the left, the larger mu moves the curve to the right.

It's the areas underneath the bell curve. Those are the probabilities.

And we calculate those with the CDF.

No simple formula for the CDF F of the normal distribution. We can only approximate these areas.

before - table lookups

nowadays - software packages

**Normal distribution in Excel**

F(X) = P(X ≤ x) = NORM.DIST(x, mu, sigma, TRUE)

F(65) = P(X≤ 65) - shaded area on the left of 65

P(X > 65) = 1 - P(X≤65) = 0.3446 - shaded are on the right of 65

**Normal distribution in Python**

Ex. x=65, mu = 60, sigma = 5.

Using NormalDist from statistics (since Python 3.8).

```python
from statistics import NormalDist
NormalDist(mu=60,sigma=5).cdf(65)
# 0.8413447460685429
1-NormalDist(mu=60,sigma=5).cdf(65)
# 0.15865525393145707
1-NormalDist(mu=58,sigma=5).cdf(65)
# 0.08075665923377107
```

People [here](https://stackoverflow.com/a/54933227) are saying that this is significantly faster than norm.cdf  from scipy.stats and a fair bit faster than both scipy and math  implementations of erf.

Using norm from scipy stats:

```python
from scipy.stats import norm
# cdf(X < x)
norm.cdf(65, 60, 5)
# cdf(X > x)
1 - norm.cdf(65, 60, 5)
# cdf(x1 < X < x2)
print norm.cdf(v2, m, s) - norm.cdf(v1, m, s)
```

More: [documentation](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.norm.html).

## Calculating normal probabilities

Ex. FERY makes or builds pillars and elevated roadways in Florida. Florida has a lot of swamp. You have to put a solid foundation into the swamp. 

After pillar is constructed it is measured and tested in various ways.

- One particular parameter x is the following:

  - Pillar may think into the swamp. Companies put a lot of pressure on the foundation of the pillar, push it into the ground and then take the pressure away and see whether the pillar has actually sunk, or whether it's stood up to the pressure.

  - Pillars are allowed to sink a bit, but not too much. x describes this particular physical feature has average value of 0.8. 

- But it doesn't always read just exactly the average. It varies (lots of uncertainty). The stddev is 0.1.

Pillar is classified as a failure if the extra value, that x takes on, is 1 or larger. Because then the pillar is not considered safe.

Question is, how likely is it that there's a failure in the pillar?

We can use the NORM.DIST function:

mu =0.8, sigma = 0.1, cut-off value x = 1

P of a "good" pillar:

P(X ≤ 1) = F(1) = NORM.DIST(1, 0.8, 0.1, TRUE) ~ 0.97725

We care about are to the right, because that's a failure:

P(X>1) = 1 - P(X ≤ 1) = 1- 0.977725 = 0.02275 

Carl calculated many probabilities and got that 5 of them = 0.97725. They have on thing in common:

Here always (x-mu)/sigma = -1. This is the key takeaway.

**Common Property**

The actual values x, mu and sigma do not matter, only the ratio of x-mu and sigma matters!

That's really what determines the probability.

It's a key property that all normal distributions have and it leads us to the so called standardized normal distribution.

**Standardized normal distribution**

Any normal dist. can be transformed into the standardized normal distribution. Which has a mean 0, and the stddev 1.

Know the concept of a z score, or a z value? You worked with stan. normal dist. rand. variables.

**NORM.S.DIST in Excel**

it has two arguments in the new version, the z and the true (it's just z in the old version of 2011).

NORM.DIST(1,0.8,0.1, TRUE) = 0.97727

Z = (x - mu)/sigma = (1-0.8)/0.1 = 2

NORM.S.DIST(2, TRUE) = 0.97727

> You need Z values in order to build a QQ plot. See the exercise of this week.

f(x) (original distribution) and f(z) (standard dist) differ slightly. f(z) is proportionally bigger, but the p to the left of x=1 is the same as in the standard normal to the left of z=2.

## Calculations with the Normal Distribution

What is the p that we get an X in a range of variables?

P(a < X < b) = P(a ≤ X ≤ b) = F(b) - F(a)

What is the p that a phys. param. X ends up at a particular pillar btw 0.7 and 1?

P(0.7 < X < 1) = P(X ≤ 1) - P(X ≤ 0.7) = NORM.DIST(1, 0.8, 0.1, TRUE) - NORM.DIST(0.7, 0.8, 0.1, TRUE) ~ 0.97725 - 0.15866 = 0.81859

we can do the same using Z.

**Properties of Normal Distributions**

P(μ - σ ≤ X ≤ μ + σ) = P(-1 ≤ Z ≤ 1) = 0.6827

P(μ - 2σ ≤ X ≤ μ + 2σ) = P(-2 ≤ Z ≤ 2) = 0.9545

P(μ - 23 ≤ X ≤ μ + 3σ) = P(-3 ≤ Z ≤ 3) = 0.9973

Theory doesn't like a 2.3 failure p. Let's say, they want a failure p of only 0.1 percent. So, they want a 99.95% p of producing a good pillar.

Where will this cut off X have to be? Now, we were given p and we want to find X.

NORM.DIST(?, 0.8, 0.1, TRUE) = 1 - 0.001.

Use NORM.INV function!

**Inverse of a Normal Distribution in Excel**

xp = NORM.INV(p, mu, sigma) is the pth **quantile** (or **percentile**) of the prob. distribution.

On the plot, we have the area p to the left of the value xp.

In our application, if the cut off (X) is 1.109, then there's 99.9% p to the left. In theory, that means there's a 99.9% chance of a pillar having an X less than 1.109. It's a good pillar. And there is only 0.1% chance of being above this cut off.

## Application of the Normal Distribution

Manufacturing company. Uses a lot f zinc.

Zinc is a metal that doesn't rust and so it's used to cover iron or other metals which may rust.

Company had to buy a lot of zinc -> the bottom line of this company was very sensitive to the price of zinc on the world market.

Company developed a forecasting model and for the price of zinc 1 month in the future.

They use the Normal Distribution to forecast the price. Based on historical prices and resent price changes they always estimated the mean (mu) and volatility (sigma). 

**Data for Normal Model**

Expected price, mu = 2250 (US$ per ton)

Volatility, sigma = 110 (US$ per ton)

P that market price = $2288.12?

0! We are using the Normal Model here. The p of any number is 0.

*In-class quiz question 1*

> What is the p that the spot market price one month from now exceeds $2300?

```python
>>> 1-NormalDist(2250, 110).cdf(2300)
0.32471814186337733
```

*In-class quiz question 2*

> What is the p that the spot market price one month from now will be larger than $2200 but also smaller than 2400?

```python
>>> NormalDist(2250, 110).cdf(2400)-NormalDist(2250, 110).cdf(2200)
0.5889408374272485
```

*In-class quiz question 3*

> There is a 90% p that one month from now the price of zinc falls below what level?
>
> So, what is cut-off value btw the bottom 90% and the top 10% of possible spot market prices one month from now?

```python
>>> NormalDist(2250, 110).inv_cdf(0.9)
2390.9706722099063
```

The interpretation: 90% chance that we fall below $2390.97 and there is only a 10% chance that the zinc price will be above $2390.97.

*In-class quiz question 4*

> Provide a symmetric 90% interval of possible spot market prices around the expected value of $2250.

90% symmetric around the mean: left bound at 0.05, right bound at 0.95.

```python
>>> NormalDist(2250, 110).inv_cdf(0.95)
2430.9338989646617
>>> NormalDist(2250, 110).inv_cdf(0.05)
2069.066101035338
```

With 90% probability the price will fall between the lower bound of $2069 per metric ton and the upper bound of $2430 per metric ton.