# QA from Coursera Algorithms

## What is constant factors and low-order term in algorithms?

Q: In the following video is described some asymptotic analyzes issues: https://class.coursera.org/algo-004/lecture/169
But I can't understand what is "low-order term" and "constant factor" itself?

A: Lower-order term:
"Order" here refers to the order of magnitude.
The concept is easy to understand and explain when dealing with very simple terms such as x or x2. x has order of magnitude 1, since it can be written as x1, and x2 has order 2 - the order of magnitude is equal to the power of the variable in the term. But things get a little more hazy (at least for me) when you complicate things by, for example, adding log.
In somewhat informal terms, f(x) is a lower order than g(x) if f(x) < g(x) as x tends to infinity.
Ex. It's easy to see that f(n) = 6n is a lower order than g(n) = 6n*log2(n) by just substituting some really large value for n (the correct approach is to mathematically prove it, but substituting a large value tends to work for simple terms).
The terms are essentially the things separated by plus / minus symbols.
So a lower-order term is just any term which is of a lower order than some other term.
Presumably this is the opposite of the leading-order term, which is the term with the largest order of magnitude.

Constant factor:
"Factor" is a term in multiplication. For 6n, 6 and n are factors.
A constant factor is simply anything that doesn't depend on the input parameter(s) (which is n in this case).
Here, regardless of what we make n, 6 will always stay 6, so it's constant factor.
 

## Meaning of “constant factor of N”?

Q: In a text I am reading (Algorithms 4th Edition by Robert Sedgewick and Kevin Wayne) there is the following passage:

> Increment sequences have been devised [for shellsort] that drive the asymptotic growth of the worst-case number of compares down to N^4/3, N^5/4, N^6/5, ... , but many of these results are primarily of academic interest because these functions are hard to distinguish from one another (and from a constant factor of N ) for practical values of N.

In this context what is the meaning of "constant factor of N"?


A: The sequence N^4/3, N^5/4, N^6/5, ... approaches N because the exponent gets closer and closer to 1.
This means that the terms in "the asymptotic growth of the worst-case number of compares" get closer and closer to each other as N is approached. In practice, N can be treated as the constant factor (???).
(The author adds the caveat "for practical values of N" as, for huge values, the terms in the sequence will be distinguishable for longer.)


## How does one know which notation of time complexity analysis to use?

https://cs.stackexchange.com/questions/57/how-does-one-know-which-notation-of-time-complexity-analysis-to-use?noredirect=1&lq=1
