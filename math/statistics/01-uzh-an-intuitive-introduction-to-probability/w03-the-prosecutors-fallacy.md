# The prosecutor's fallacy

> Keywords: conditional probability, defendant, damning evidence, independence, prosecutor's fallacy, flipping formula.

A famous problem in legal issues is the so-called prosecutor's fallacies:

- confusing cond. prob. P(A|B) and P(B|A)
- what has happened already and what's still uncertain?

We have a defendant (підсудний in court, is he or she innocent?

- event I says = defendant is innocent
- ~I = defendant is guilty
- DE = damning evidence (руйнівні докази), e.g., DNA match with crime scene.

P(DE|I)= p that an innoc. person matches the damning evidence.

P(I|DE)= p that a person with the DE is innoc.

**Statements**

Prosecution's expert witness:

- an innocent person has 1 in 100'000 chance of matching the DE.

Prosecutor:

- the defendant has the DE.
- therefore, there is a 1 in 100'000 chance that the def. is innoc. Obviously, (s)he is guilty.

**WRONG!**

Expert witness:

P(DE|I) = 1/100'000 = 0.00001 = 0.0001%

Prosecutors's fallacy:

P(I|DE) = P(DE|I) = 0.00001

But most likely,  P(DE|I) ≠ P(I|DE). We have Bayes Rule.

"Flipping formula":

P(I|DE) = P(DE|I) * P(I)/P(DE)

**Illustration**

Assumption:

- guilty is among the 500'000 adults living in the area
- guilty also matches the DE

P(I) = 499'999/500'000 = 0.999998

P(I^c) = 1/500'000 = 0.000002

P(DE|I^c) = 1

**Flipping formula in action**

P(DE) = P(DE|I) * P(I) + P(DE|I^c) * P(I^c) = 0.000012

P(I|DE) = 0.83333

P(I^c|DE) = 1 - P(I|DE) = 0.16667

> In that city you have five innocent people who match that stuff + 1 guilty = 6. b/c the chance that an innoc. pers. has this daming evidence, even if it's small, if the number is large enough of potential criminals and therefore also potential innoc. people, that's how we get in the end, quite a large group. In this case, six potential criminals, but only one did it. EVEN IF YOU HAVE A WRONG DNA, THERE'S STILL A GOOD CHANCE YOU ARE INNOCENT.

Probability table:

|              |     DE       |     DE^c       |        |
| :----------: | :----------: | :------------: | :---:  |
|     I        |  0.000010    |  0.999988      |0.999998|
|     I^c      |  0.000002    |      0         |0.000002|
|              |  0.000012    |  0.999988      |  1.000 |

Ex. It's Birmingham Six. IRA case in 1974. August of 1975 - each defendant received 21 life sentences.

Key statement in trial

Expert witness:

- forensic scientist stated that, based on his tests, he was 99% sure two of the six defendants had handled explosives.
- _claim_: 

P(handling explosives | test is positive) = 0.99

- what may be true in reality: 

P(test is positive | handling explosives) = 0.99

- but _claim_ appears to be false: 

P(handling explosives | test is positive) < 0.99

> So, if you touched gasoline (gas station, smokers, soap, cards) = you're guilty according to the claim.

So, people confuse what's given, what have we found, and what still out there.

Whenever we have a prosecutor's fallacy, that's a neglected application of base rule.