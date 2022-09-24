# Conditional probability

The p. of Event A occurring is P(A). Information update: Event B occurred. Now we are changing the p. What is the p of Event A occurring given that Event B occurred?

New p: **P(A|B), "the conditional probability of A given B"**.

Ex. P(A=French) = 22.4%, P(A=French|B=Zurich) = 3.2%.

A ∩ B (joint), but don't think of the S. B is the new sample space! Outcomes outside B are no longer possible. Q: **How likely is the event A within a new state space B?** It's cond. prob.

> Q: Knowing that B has occurred, makes the probability of A to occur more likely.
>
> Incorrect!

**Definition**. P(A|B) = P(A ∩ B) / P(B).

> Normalizing our probs. on the sp B the event that occurred.

Ex. P(A) was higher (1/2) before the event B occurred (now it's 1/3). So: Events A and B are **dependent**.

Ex. P(A) = 1/2, but P(A|B') = 1/2. B' occurred, but it didn't change the p of A. So: Events A and B' are **independent**.

> Question 2
>
> P(A) = 0.3 and P (A|B) = 0.2 What can you tell about P(B)?
>
> Answer: I cannot calculate P(B) without also knowing P(B/A).

General multiplication rule for **dependent** events:

- P(A ∩ B) = P(A|B) * P(B)
- P(A ∩ B) = P(B|A) * P(A)

Ex. Swiss population data:

- 17.6% of Swiss res. live in Zurich
- 19.6% of all Zurich are 0-19 y old.
- Q: prop of Swiss res. both live in Zurich and 0-19: 0.176 * 0.196 = 0.034496 ~3.45%.

Probability concept: **Empirical Probability**.

P(Zurich) = 0.176, P(0-19 years|Zurich) = 0.196

P(Z & 0-19) = P(Z ∩ 0-19) = P(Z) * P(0-19|Z) = 0.0345

It's an every day concept: a proportion of a proportion, and then we multiply.

Independence:

P(A) = P(A|B) & P(B) = P(B|A)

Multiplication rule for **independent** events:

P(A ∩ B) = P(A) * P(B).

Ex.
W_i = event that machine works well on day i
F_i = event that machine fails on day i
P(W_1 ∩ W_2) = P(W_1) x P(W_2 | W_1) = 0.9 x ?
If **yes** (independence), P(W_1 ∩ W_2) = P(W_1) x P(W_2) = 0.9^2 = 0.81

> Bathtub curve: middle range = indep. is okay assumption, front end/back end ≠ indep.

---

**Contingency tables and probability tables**
A contingency table shows counts of cases on one categorical variable contingent on the value of another (for every combination of both variables). Contingency tables are useful for calculating conditional probabilities, as they contain all the ingredients necessary for the computation.

Ex. Amazon

We want to investigate which host sends more buyers to the internet shopping website Amazon.com. In order to answer this question, we must gather data on two (categorical) variables:

1. The host that identifies the originating site, which is either MSN,
   RecipeSource, or Yahoo.
2. A binary variable that indicates whether the visit results in a purchase.

The contingency table below shows data for web shoppers at Amazon.com. It contains the following pieces of information:

- The website through which a customer ended up at Amazon.com
- Whether the customer made a purchase or not 

|             |  MSN  | Recipe Source | Yahoo |   Total    |
| :---------: | :---: | :-----------: | :---: | :--------: |
| No Purchase | 6.973 |     4.282     | 5.848 |   17.103   |
|  Purchase   |  285  |       1       |  230  |    516     |
|    Total    | 7.258 |     4.283     | 6.078 | **17.619** |

> difficult to look at it -> transform them into proportions, using empirical probability.

The contingency table above shows counts (number of customers) and not probabilities. We can transform the counts into probabilities by dividing each number by the total (**17.619** in this case). The table below shows the probabilities corresponding to the counts in the contingency table above.

|             |  MSN  | Recipe Source | Yahoo | Total |
| :---------: | :---: | :-----------: | :---: | :---: |
| No Purchase | 0.396 |     0.243     | 0.332 | 0.971 |
|  Purchase   | 0.016 |     0.000     | 0.013 | 0.029 |
|    Total    | 0.412 |     0.243     | 0.345 |  1.0  |

Very right column, very bottom row = marginal probabilities (b/c margins of the table).

> The marginal probability is the unconditional probability on an event. This probability is not conditioned on any other event.
> *Notation*: The marginal probabilities of two arbitrary events A and B is denoted by respectively P( A) and P( B).

Joint probabilities are in the middle (MSN & other).

> The joint probability is the probability of simultaneous events. This is the probability of the intersection of two or more events.
> *Notation*: The joint probability of two arbitrary events A and B is denoted by P( A ⋂ B).

In general, for two arbitrary events A and B, P(A|B) ≠ P(B|A).

**Set-up of a probability table**

A1, A2, ..., Am (rows) are mutually exclusive (can't happen simultaneously) and collectively exhaustive events.

B1, B2, ..., Bk (columns) are k mutually exclusive and collectively exhaustive events.

The margin is the sum of the interior. Probability tables don't show us the conditional probabilities, but we can calculate them 

Ex. "What is the probability that overnight stay in other, is from a person visiting from Europe?"

P(Europe|other) = P ("Europe" ∩ "other") / P(other) = 0.381/0.400 = 95.25%

> look at the row "other" first

Ex. "So, what is the probability that an European visitor will stay an overnight  in other?"

> look at the row "Europe" first

**Bayes rule**

Ex. manufacturer and suppliers:

- suppliers S, T, U
- these parts that these suppliers deliver to the manuf. are either good or defective:
  - Good - 90%, bad - 10%
- the company looked at some rec. data: is there any diff. btw S, T, and U:
  - good: 60% sup. by S, 25% by T, 15% by U
  - bad: 40% sup. by S, 30% by T, 30% by U
- man's Q: which of my supp. delivers the best parts?
  P(good|S), P(good|T), P(good|U)

The proportion of good parts is the largest for sup. S, the prop. of bad parts is the largest for sup. U. 

We flipped the conditional probabilities:

- Given P(S|good),..., P(U|bad)
- Calculated P(good, S),..., P(bad,U)

Recall the gen. mult. rule...

And so, 

P(A|B) * P(B) = P(B|A) * P(A)

**P(A|B)** = **P(B|A)** * P(A) / P(B) //flipping formula

Recall from prob. tables:

P (B) = P (A ∩ B) + P (A^c ∩ B) = P (B|A) * P (A) + P (B|A^c) * P(A^c)

put this formula into flipping formula, you get:

**P(A|B) = P(B|A) * P(A)/P(B|A) * P(A) + P(B|A^c) * P(A^c)**

It's the famous Bayes rule for 2 events. It says:

"Knowing the cond. prob both P(B|A) & P(B|A^c) we can "flip" A and calculate P(A|B)."

Bayes rule "scales up":

Let A1, A2, ..., Am be mutually exclusive (disjoint) and totally exhaustive:

**P(A1|B) = P(B|A1) * P(A1)/P(B|A1) * P(A1) +...+P(B|Am)*P(B|Am)**