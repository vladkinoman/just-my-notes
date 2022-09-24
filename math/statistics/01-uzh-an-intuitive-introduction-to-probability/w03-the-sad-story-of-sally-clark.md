# The sad story of Sally Clark

> Keywords: Sudden Infant Death Syndrome, SIDS, independence, prosecutor's fallacy, conditional probability, flipping formula, statistical bias.

- 1 baby - SIDS (Sudden Infant Death Syndrome).
- 2 baby died too, but this time everyone suspected a murder in both cases.
- 3 baby on the way

**Trial & verdict**

Key argument of the prosecution's expert witness:

- two SIDS cases in the Clark family has p of 1 in 73 million, so it must be _two murders instead_.

Jury votes 10 to 2 of guilt => Sally receives mandatory sentence of life imprisonment.

**Statements of expert witness**

1. P of SIDS, 1/8573

> dubious estimate, lots of controversy. For the sake of this disc., keep the number as is (number should be low).

2. Let's assume independence, he said. P of 2 SIDS in a row, 1/8573 * 1/8573 ≈ 1/73 million
3. Let me illustrate what this p is. About 700'000 births in England per year, so two SIDS in a row should happen once per 100 years.

**Terrible mistake #1**

Independence

P(SIDS-1 ∩ SIDS-2) = P(SIDS-1) * P(SIDS-2)

and moreover

P(SIDS-2|SIDS-1) = P(SIDS-2) = P(SIDS-1)

Do we really believe this assumption? When it's a condition about which we don't know much. Genetic factors?

**Dependence of SIDS**

Later estimates

P(SIDS-2|SIDS-1) >> P(SIDS-1)

Estimates vary, as large as

P(SIDS-2|SIDS-1) = 1/200

It means that if a family has a SIDS case, and this couple has a second baby for whatever reason, the prob. is drastically increased. There is something like a genetic predisposition.

**Terrible mistake #2**

**Prosecutor's Fallacy**: confusing P(DE|I) & P(I|

Expert witness:

P(DE|I) = 1/73 million

Prosecutor's Fallacy:

P(I|DE) = P(DE|I) = 1/73 million

"Flipping" formula

P(I|DE) = P(DE|I) * P(I)/P(DE)

Double SIDS vs Double Murder: 4/9 times more likely than double murder.

As early as October of 2001, the Royal Statistical Society of the UK made the statement that the 1 in 173 million figure has no statistical bias. They clearly pointed to the mistakes of the expert witness: you cannot assume independence & clearly, the jury had a case of the prosecutor's fallacy.

Sally goes free in 2003. She became dependent on alcohol and died of alc. intox. in 2007 at the age of 42. 3rd son lived happily ever after, no SIDS, no murder, nothing.

John Batt (2004) "Stolen Innocence: The Sally Clark Story - A Mother's Fight for Justice".

Leila Schneps, Coralie Colmez (2013) "Math on Trial".