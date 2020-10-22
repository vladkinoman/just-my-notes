# Time complexity

Big O notation is just a fancy way of comparing algorithms over **asymptotic** efficiency.

> The efficiency (running time, memory consumption, etc) of the algorithm as the input size (in the example, the amount of data) goes <u>arbitrarily</u> large.

**Big O notation** characterizes functions according to their growth rates: different functions with the same growth rate may be represented **using** the same **O notation**. The letter **O is used** because the growth rate of a function **is** also referred to as the <u>order of the function</u>.

**Why is Big O notation useful?**

**Big O notation** allows you to analyze algorithms in terms of overall efficiency and scalability. It abstracts away constant order differences in efficiency which can vary from platform, language, OS to focus on the inherent efficiency of the algorithm and how it varies according to the size of the input.

**How do you explain Big O notation?**

The **Big O notation** defines an upper bound of an algorithm, it bounds a function only from above. For example, consider the case of Insertion Sort. It takes linear time in best case and quadratic time in worst case. We can safely say that the time complexity of Insertion sort is **O**(n^2).

**Is Big O notation the worst case?**

Although **big o notation** has nothing to do with the **worst case** analysis, we usually represent the **worst case** by **big o notation**. So, In binary search, the best **case** is **O**(1), average and **worst case** is **O**(logn). In short, there is no kind of relationship of the type “**big O** is used for **worst case**, Theta for average **case**”.

> When we say that an algorithm has a running time of O(n) we say that the running time as a function of input size *approaches* the input size (approaches like a curve approaches to asymptote (a line) when it heads towards infinity).

According to [wiki](https://en.wikipedia.org/wiki/Big_O_notation):

> In [computer science](https://en.wikipedia.org/wiki/Computer_science), big O notation is used to [classify algorithms](https://en.wikipedia.org/wiki/Computational_complexity_theory) according to how their run time or space requirements grow as the input size grows.

However, Robert Sedgewick in his lecture writes this:

> Big Theta notation is used to <u>classify algorithms</u>.
>
> Big Oh notation is used to develop upper bounds.

So, it's not used to classify algorithms, according to Sedgewick. TODO: find out what is a correct notation to classify algorithms. Probably, you can use both Big Oh and Big Theta. You just must not use Big Oh as an approximate model (i.e. Tilde-notation ~).

According to [wiki](https://en.wikipedia.org/wiki/Analysis_of_algorithms#Orders_of_growth):

> Big O notation is a convenient way to express the [worst-case scenario](https://en.wikipedia.org/wiki/Best,_worst_and_average_case) for a given algorithm, although it can also be used to express the average-case — for example, the worst-case scenario for [quicksort](https://en.wikipedia.org/wiki/Quicksort) is *O*(*n*^2), but the average-case run-time is *O*(*n* log *n*).

As stated above, although big o notation has nothing to do with the worst case analysis, we usually represent the worst case by big o notation. According to Sedgewick:

> Overly pessimistic to focus on worst case?

**Why Big-O?**

Big-O notation is certainly the most common (usually Computer Science research such as Algorithms research is appealing to those outside of strictly Computer Science, using notation that is easy to understand for those outside of it is helpful), and probably the easiest to work with. And if all you need is the information conveyed by that, then it’s the best. But Big-O is based on “≤”, and hence a result stated in Big-O might actually be “much less than”, and hence could be too crude a notation for some particular needs. Thus *o*, Ω, ω, and Θ (especially Θ) can become the best notation to use in other situations, since they convey more information.

## References

1. https://everythingwhat.com/why-do-we-use-big-o-notation