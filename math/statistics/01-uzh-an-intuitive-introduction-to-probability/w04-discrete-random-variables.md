# Discrete random variables

[TOC]

A **random var.** assigns a single num. value to each basic outcome in the sample space.

Their names: X, Y, Z, etc.

**Disc. random var.** X can take on only a finite number of values (or at most a countably infinite number).

p(x) = P(x) = P(X=x) = Pr(x)

> P(X=x): rand. var. X takes on a specific value and then it's ordered by x.

When we sum P() we get to the concept of the Probability distribution. A probability mass function (abbreviated PMF) completely describes the probability properties of the random variable. It shows the p. that a random var. X is exactly equal to some deterministic value x.

The cumulative distribution function (abbreviated CDF) shows the p. that a random var. X takes a value less than or equal to a deterministic value x.

Notation: F(x) = P(X≤x), where -∞ < x < +∞.

> It means: F(x) = P(X=1) + P(X=2) +...+ P(X=x).

> Ex. X is the sum of the outcomes of the two dice. The state space S is {2, 3, ..., 11, 12}.
>
> P(X=2) = 1/36
>
> P(X=3) = 2/36, ..., P(X=12) = 1/36
>
> P(X=x) = 0 for all values x not in {2, 3, 4, ..., 12}
>
> - The # of pos. outcomes for X is clearly infinite, so X is a disc. rand. var.
> - All pos. outcomes for the sum of two fair dice are not equally likely (тобто ймовірність отримати 7 вище ніж отримати 2). Therefore X is not uniformly distributed.
>
> If you have a table, then you can get a graphical representation of P(X=x). Like a Column diagram, or a Staggered chart for Cumulative distribution of F(d) (for step function).

> Ex. Roulette. 0 - 36.
>
> We assume an absolute fair game. We assume that all 37 numbers are equally likely. This p. dist. is also called the **uniform probability distribution**.
>
> P(R=0) = P(R=1) = ... = P(R=36) = 1/37
>
> The Column graph gives an idea that all numbers are equally likely (all columns are similar). This is a discrete uniform distribution (every one of n values has equal p 1/n).

## Expected value

more possible values in rand values = graph. repr. gets messy.

We like summarize info into Summary Measures.

First one is Average Mean (or Expected Value, мат. сподіванння :ukraine: ). **Mean** of a disc. rand. var. X is the probability weighted sum of all possible values.

μ = E(x) = x1 * p(x1) + x2 * p(x2) + ... + xk * p(xk)

How to understand? A: if I repeat that experiment many times, then the average will get close to μ.

>  Ex. Roulette bet on red:
>
> - red = net win of 1
> - black = net loss of 1
>
> What is the expected value? How much money will you win or lose on average?
>
> Rand. var B and its values 1 (win), -1 (lose).
>
> P(B = 1) = 18/37 = 0.4865
>
> P(B =-1) = 19/37 = 0.5135 (19 = 18 black + 1 green)
>
> E(B) = 1x18/37 + (-1)x19/37 = -1/37 = -0.027027 - this is how much chips you will lose if you will bet on this color. "House advantage" (lang. of gambling) - on avg the casino wins money.

> Ex.
>
> Offer:
>
> - Extra fee = 84$
> - Deductible = 100 $
>
> Buy the insurance?
>
> Random var = accident payment
>
> accident? damage exceeds 800 = you need to pay 800 in that case. No? 0 - no accident. A0 has two values: 800 & 0.
>
> > we neglect accident like bumper damage of say 500
>
> With extra insurance:
>
> A1 has two values: 100 & 0 (no accident).
>
> P of accident = p
>
> Expected payments:
>
> - without extra insurance:
>
> E(A0) = 800 x p + 0 x (1-p) = 800 p
>
> - with extra insurance:
>
> E(A1) + 84 = 100 x p + 0 x (1-p) + 84 = 100p + 84
>
> At which p would these payments be the same? 8 1/3 %.
>
> If p is high = buy the insurance, if p is small = you shouldn't buy the insurance.

## Measures of dispersion

We have a limited mind, so we like to aggregate all of this info, the possible variables, the possible p. into a single number. But there's a drawback! We lose a ton of info. 

> Ex. μ=3.5 - no indication about the **variation** in the actual numbers
>
> We have bars, 6 different numbers, there is uncertainty, there's only a 1 in 6 chance of them coming, but 3.5 doesn't give me any of that info.
>
> μ of 6 diffrent numbers = μ of die with three 1s and three 6s.

Sam Savage of Stanford University: "the flaw of averages". People rely too much on averages and ignore variation.

Simple average deviation:

Given μ = E(x) .

Take the difference E(X-μ) = (x1 - μ)p(x1) + (x2 - μ)p(x2) + ... + (xk-μ)p(xk)

This concept of average deviation doesn't work b/c: E(X-μ) = 0.

Mean absolute deviation:

MAD = E(|X-μ|) = |x1 - μ|p(x1) + |x2 - μ|p(x2) + ... + |xk-μ|p(xk)

Doesn't work in practice, b/c the abs value isn't easy, It has a kink at 0. Language of math: it has a non-differentiability at 0.

Squaring the numbers!

**Variance** of discrete random variable is the probability-weighted sum of all possible squared deviations from the mean.

> A deviation of a -2 gives a +4 squared deviation, a dev of a +2 gives us a +4 sq. dev. No more canceling of negatives and positives.

Suppose X has k possible values, x1, x2, ..., xk, then the variance of X is

σ^2 = Var(X) =  E((X-μ)^2) = (x1 - μ)^2p(x1) + (x2 - μ)^2p(x2) + ... + (xk-μ)^2p(xk)

How to get from squared euros to just euros? With the square root.

So, the standard deviation  σ = SD(X) = sqrt(Var(X)).

Standard deviation is a measure (based on the variance) for the average deviation of the values of a random variable X from its mean μ.

Our preferred summary measures for variation, or in economics and finance people like to talk about volatility, are the concepts variances and standard deviation.

## Application of Random Variables: Financial Model

If anyone mentions it, they mean random variables.

They use economic models to forecast to handle economic or financial risks.

We see empirical probabilities.

![](w04-model-of-an-investment-fund.png)

Investors are interested in sum metrics, not this numbers.

**Expected Return**

- fund return: 

random variable R with 6 possible values

- expected return:

E(R) = (-15) x 0.02 + (-7.5) x 0.05 + ... + 14 x 0.2 = 4.95%

Again, we loss information. We now need to model the volatility (we use variance and stddev).

**Variance**

Variance of the return:

Var(R) = (-15-4.95)^2 x 0.02 + (-7.5-4.95)^2 x 0.05 + ... + (14-4.95)^2 x 0.2 

= 43.8975

According to our fin. model, the variance of the investment fund's return is 43.8975%^2 ("percent square").

**Standard Deviation**

Stddev of the return:

σ = sqrt(Var(R)) ~ 6.6255

Stddev is measure for volatility in economics and finance.

## Binomial distribution

> the most widely used prob. distrib. that has discrete outcomes.

**Bernoulli Random Variable**

Bern. r. v. B allows for only two outcomes, b=1 and b=0, usually called **success** and **failure**.

P of success: P(B=1) = p

P of failure: P(B=0) = 1-p

Mean of Bernoulli:

E(x) = μ = 1 x p + 0 x (1- p) = p

Variance of B:

Var(B) = σ^2 = p(1-p)

It gets interesting when we repeat a Bern. rand. var. over and over again - **Bernoulli trials**. We have a ser. of identical trials each & every time, all of them are independent.

We don't just have one Bern R. Var, we have a whole sum of Rand Var - **Binomial Random Variable**: X = B1 + B2 + ... + Bn. They are all independent and identically distributed (IID - people in p t often use this abbreviation).

X has the Binomial Distribution B(n, p), where n is # of repetitions of the trial, little p - p of the success.

E(X) = E(B1 + B2 + ... + Bn) = p + p + ... + p = n x p

Var(X) = Var(B1 + B2 + ... + Bn) = p(1-p) + ... + p(1-p) = n x p(1-p)

> Ex. **Coin flip**. 
>
> Head = 1, tail = 0. Flip 5 times. How many times do we get success?
>
> Y = number of heads
>
> Y = 0: TTTTT
>
> P (Y=0) = 1/2 x 1/2 x 1/2 x 1/2 x 1/2 = 1/32 = 0.03125
>
> But it gets tricky when 
>
> Y = 1 head: HTTTT, THTTT, TTHTT, TTTHT, TTTTH
>
> Excel: BINOM.DIST calculates these numbers:
>
> BINOM.DIST(# of successes; n - # of repeated Bernoulli trials; little p - p of success; FALSE - p of exactly 0, just a technicality).
>
> Five coin flips
>
> ...
>
> P(Y=5) = BINOM.DIST(5, 5, 0.5, FALSE) = 0.03125
>
> E(Y) = 5 x 0.5 = 2.5
>
> Var(Y) = 5 x 0.5 x (1-0.5) = 1.25
>
> Next, the concept of cumulative distribution, when the last argument is TRUE:
>
> ....
>
> P(Y=0)
>
> ....
>
> P(Y=4) = BINOM.DIST(4, 5, 0.5, TRUE) = 0.96875
>
> P(Y=5) = BINOM.DIST(5, 5, 0.5, TRUE) = 1

> Ex. **Advertising stunt** (рекламний трюк) that a beer brewing company in the US pulled in the 1981 Super Bowl. Live on TV. The Schlitz Brewing Company asked 100 beer drinkers (their favorite is Michelob) to blind taste btw their beer Schlitz and the Michelob, which one do you like better?
>
> Let's take this advertising stunt and put it into a prob. framework.
>
> - success:  Schlitz is my favorite
> - failure: Michelob is my favorite
>
> Let's assume that it's essentially impossible to distinguish btw these 2 beers b/c they all taste alike.
>
> P(success) = 0.5
>
> P(failure) = 0.5
>
> n = 100 trials
>
> It's a blind tasting, so we have a binomial setup. Now, we can analyze this stunt using the binomial distribution.
>
> Q: less than 1/3 favorite Schlitz, p? 
>
> P(Y<33.333) = P(Y ≤ 33) = BINOM.DIST(33; 100; 0.5; TRUE) = 0.00044
>
> It's unlikely that if we are Schlitz we look so bad with this ad.
>
> Q: pretty good outcome? 45 or more.
>
> P(Y≥45) = 1 - P(Y≤44) = 1 - BINOM.DIST(44; 100; 0.5; TRUE) = 1 - 0.13563 = 0.86437
>
> But
>
> P(Y<40)  = 0.0176
>
> P(Y=50) = BINOM.DIST(50; 100; 0.5; FALSE) = 0.07959
>
> P(Y≥50) = 0.53979
>
> What happened?
>
> Exactly 50/10 loyal Michelob favored Schlitz.
>
> The adv. stunt wasn't that risky.
>
> In the US, you can do comparative advertising, not in Switzerland.

## Application of the Binomial Distribution: Airline Overbooking

Zurich - London, 200 seats, airlines can sell 210-220 tickets.

A: canceling. Airlines need money.

So, airline seats are the most perishable consumption good that exist.

airlines fresh = you can buy it, buy it until before the departure. It went "bad". 

So, airlines wants to get **benefit**. Source of extra revenue.

you have 200 seats, sold 210, suddenly 205 people show up. OMG! Buy some people of traveling: vouchers. No volunteers for vouchers - kick off people! It **costs** you:

- compensation
- loss of goodwill
- dissatisfaction

We want to look at how they trade off the benefits on potentially more revenue, against the cost of disgruntled customers and giving out vouchers or perhaps have to pay for hotel nights for customers. This a large business called Operations Management, and *Revenue Management* its special field.

People makes decision whether to show up. Independently vs. same probability p. Indep. isn't quite correct b/c we can have groups travelling. We are simplifying assumptions:

- all passengers make decision to show up independently with constant p.

Under these assumptions we can **apply binomial distribution**.

> bumpcost = 500$. It's a voucher or a hotel room.
>
> we are assuming probability of no shows of 0.07 (from some reports on airline overbooking). 200 sold, so on average only 186 people show up.

The objective of the airline overbooking problem is to find the optimal trade-off between the benefit of selling more tickets than you have seats on an airplane, and the cost of perhaps having to push off customers from the airplane who had booked a regular ticket.
