# Structuring risks

> Keywords: loan, bond, default, pooling risks, investment grade bonds, junk bonds, toxic junk, exogenous shock, exogenous negative shock.

Ways to get money for a company:

1. Company needs a loan (кредит, позик) from bank. Bank gives us $ and pay the loan back.
2. 2nd way to get some $ is to borrow them from financial markets:
- a **bond** (облігація) is a debt obligation by a company in which the company pays bank $1.

> It's an obligation to us, the lenders. We => $ & they => us the $ back. Along the way we hopefully get some interest.

Something can go WRONG:

- Company could go _bankrupt_ & then _default on its loan_.

> it doesn't pay back the loan
- in the case of default $0

Black & white scenarios:

- No default & we get $ back
- Default    & no & back.

That's why investors in general rely on rating agencies. They're telling whether it's a risky investment, or whether it's not.

**Investment grade** bonds: AAA, AA+, AA, ..., BBB, BBB-.
Speculative grade (**junk**) bonds: BB+, BB, ..., B, B-, CCC+, ...
Ratings are very important:

- the larger the R = the safer.
- some investors (like pension funds) are only allowed invest into safe ones.

Historical Default Rates:
```
AAA 0.02%
AA+ 0.06%
...
BB+ 1.07%
...
C   29.96%
(Probability concept: **Empirical Probabilities**)
```

How are these Rs affected the financial crisis?

- in the crisis, or before it hap., this risk, these bonds got _pooled_.

> If you followed crisis, there is a _mortgage backed security_, where these debts were actually the debts of house buyers. Those loans were put together in the sort of funds of these bonds.

**Junk bonds**

junky bonds => good risks

How with the junky bonds that we put together into a portfolio we can create some good risks.

We analyze 2 jb, X & Y.

- X has a p of default of 0.10
- Y has a p of default of 0.10

What people in finance do: take junky bonds => new type of asset that is safe.

**Outcomes**

- dd: both X and Y default
- dn
- nd: X does not default, Y does
- nn: neither X nor Y default

_Default probabilities_ for both junk bonds: P(d) = 0.1, P(n) = 0.9.

What is going happen to a portfolio?

|  Outcome    |   X   |   Y   |  X+Y  |
| :---------: | :---: | :---: | :---: |
|     dd      |   0   |   0   |   0   |
|     dn      |   0   |   1   |   1   |
|     nd      |   1   |   0   |   1   |
|     nn      |   1   |   1   |   2   |

With independence we can use the * rule.

Assuming independence:

|              | Y:default(d) |Y:no default (n)|       |
| :----------: | :----------: | :------------: | :---: |
|X:default(d)  |    0.01      |     0.09       |   0.1 |
|X:no def(d)   |    0.09      |     0.81       |   0.9 |
|              |     0.1      |      0.9       |   1.0 |

Now, we do next:

- we are taking the money from X & Y & => investors.
- but we create new investments I (an investment grade) & J (a junk bond).
- apply the rule: the first $ that comes in goes to asset I, any remaining funds go to asset J.

|  Outcome    |   I   |   J   |  I+J  |
| :---------: | :---: | :---: | :---: |
|     dd      |   0   |   0   |   0   |
|     dn      |   1   |   0   |   1   |
|     nd      |   1   |   0   |   1   |
|     nn      |   1   |   1   |   2   |

👉️ clean accounting: whatever X+Y pay in, are paid out via I+G.
But, are I & J different here?

- I pays in 3/4 cases. I seems good, b/c 1% chance of default. 99% chance of paying off = gets a high R = has investment grade status. Even though X & Y are junk ingredients. But because of this splitting up the $ that comes in, in this peculiar way, I become safe.
- J is super junk, or, how the pros in finance call it, _Toxic Junk_.

This is structure finance.

**Collateralized debt obligations**

The market for coll. debt. obl. (CDOs) is a multi-trillion dollar market. 

> Banks do this with mortgages, car loans, in countries where you have student loans. A gigantic market where people take group debts together & cut it off in this _trenches_.

Remember: junk + junk = safe + toxic junk

**Mistake here**: we assumed independence!

Now: 
- assume dependence. When X defaults => tells us about the likelihood that Y defaults.
- think about a positive correlation when 1 asset defaults, actually the p of the other asset's default increases.

|              | Y:default(d) |Y:no default (n)|       |
| :----------: | :----------: | :------------: | :---: |
|X:default(d)  |    0.06      |     0.04       |   0.1 |
|X:no def(d)   |    0.04      |     0.86       |   0.9 |
|              |     0.1      |      0.9       |   1.0 |

Asset I: dependence

|  Outcome    |   Prob|   I   |
| :---------: | :---: | :---: |
|     dd      |   0.06|   0   |
|     dn      |   0.04|   1   |
|     nd      |   0.04|   1   |
|     nn      |   0.86|   1   |

> 0.06 = much higher default probability = junk asset

Asset I: dependence

|  Outcome    |   Prob|   J   |
| :---------: | :---: | :---: |
|     dd      |   0.06|   0   |
|     dn      |   0.04|   0   |
|     nd      |   0.04|   0   |
|     nn      |   0.86|   1   |

> default probability 0.14 = still junk

It's an impact of dependence, called positive correlation.
Asset I is much worse. J is a little less toxic, but it's still junk.

Default correlation? Companies in the same industry: industry suck = everyone suck; industry is doing very well = everyone is doing well.

Ex. The Swiss National Bank stopped the pack of the Swiss frank chose Europe. That was bad to all exporters, in particular to the tourism industry, for all of them = **exogenous negative shock**.

Ex. Crisis. As we had in the fin. crisis in 2007-2009. We had dependence. B/c junk + junk is still junk (the scheme for creating safe assets broke apart). Highly cited economics research paper: "The Economics of Structured Finance" ([link](https://www.hbs.edu/ris/Publication%20Files/The%20Economics%20of%20Structured%20Finance_3da44776-0220-4d94-b660-6da166c18b53.pdf)).

> Other issues in 2007-2009: cheating, misreporting. However, this p issue clearly contributed to the financial crisis.

**IS THE ASSUMPTION OF INDEPENDENCE JUSTIFIED, YES OR NO?**

No? You can't multiply = think about cond. prob.