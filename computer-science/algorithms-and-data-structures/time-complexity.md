# Time complexity

## Notations

The notations actually have nothing to do with algorithms best/average/worst cases. They are ways to express the asymptotic behavior of functions, whatever they are.

- *o*(*n*) – faster   
- *O*(*n*) – faster or equal. f(n) = O(g(n)) means that f doesn't grow faster than g. g is an upper bound, tight or not.
- Θ(*n*) – equal to. f(n) = Θ(g(n)) means that f grows as fast as g. g is a tight bound, both upper and lower.
- Ω(*n*) – slower or equal to. f(n) = Ω(g(n)) means that f doesn't grow slower than g. g is a lower bound, tight or not.
- *ω*(*n*) – slower than

Then, the best/average/worst running times of an algorithm are functions of the number of elements, and usually have O, Ω, Θ representations.

### Big-O notation

We use big-O notation in the analysis of algorithms to describe an algorithm’s usage of computational resources, in a way that is independent of computer architecture or clock rate.

Big O notation is just a fancy way of comparing algorithms over **asymptotic** efficiency.

> The efficiency (running time, memory consumption, etc) of the algorithm as the input size (in the example, the amount of data) goes <u>arbitrarily</u> large.

Big O notation characterizes functions according to their growth rates: different functions with the same growth rate may be represented using the same O notation. The letter O is used because the growth rate of a function is also referred to as the <u>order of the function</u>.

#### Why is Big O notation useful?

Big O notation allows you to analyze algorithms in terms of overall efficiency and scalability. It abstracts away constant order differences in efficiency which can vary from platform, language, OS to focus on the inherent efficiency of the algorithm and how it varies according to the size of the input.

#### How do you explain Big O notation?

The Big O notation defines an upper bound of an algorithm, it bounds a function only from above. For example, consider the case of Insertion Sort. It takes linear time in best case and quadratic time in worst case. We can safely say that the time complexity of Insertion sort is O(n^2).

#### Is Big O notation the worst case?

Although big o notation has nothing to do with the worst case analysis, we usually represent the worst case by big o notation. So, In binary search, the best case is O(1), average and worst case is O(log n). In short, there is no kind of relationship of the type “big O is used for worst case, Theta for average case”.

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

#### Why Big-O?

Big-O notation is certainly the most common (usually Computer Science research such as Algorithms research is appealing to those outside of strictly Computer Science, using notation that is easy to understand for those outside of it is helpful), and probably the easiest to work with (+ upper bound is easy to get). And if all you need is the information conveyed by that, then it’s the best. But Big-O is based on “≤”, and hence a result stated in Big-O might actually be “much less than”, and hence could be too crude a notation for some particular needs. Thus *o*, Ω, ω, and Θ (especially Θ) can become the best notation to use in other situations, since they convey more information.

### Big Theta notation

Theta notation is used to describe the asymptotic behavior of a class of functions. It can be used for many things including time complexity and memory complexity. It can be used for average case complexity just like for worst case complexity[1].

### Big Omega notation

Sometimes, we want to say that an algorithm takes *at least* a certain amount of time, without providing an upper bound. We use big-Ω notation.

If a running time is Ω(*f*(*n*)), then for large enough *n*, the running time is at least *k*⋅*f*(*n*) for some constant *k*. Here's how to think of a running time that is Ω(*f*(*n*)):

![img](file:///D:/Books/0HTML%20articles/Programming/Algorithms/Big-%CE%A9%20(Big-Omega)%20notation%20(article)%20_%20Khan%20Academy_files/c02e6916d15bacae7a936381af8c6e5a0068f4fd.png)

We say that the running time is "big-Ω of *f*(*n*)". We use big-Ω notation for **asymptotic lower bounds**, since it bounds the growth of the running time from below for large enough input sizes.

Just as Θ(*f*(*n*)) automatically implies O(*f*(*n*)), it also automatically implies Ω(*f*(*n*)).  So we can say that the worst-case running time of binary search is Ω(log*n*).

> **Why it is correct?**
>
> When we use asymptotic notation, unless stated otherwise, we are talking about **worst-case running time**. The worst-case running time for binary search is log(n).
>
> Recall:
>
> - if f(n) is O(g(n)) this means that f(n) grows asymptotically no faster than g(n)
> - if f(n) is Ω(g(n)) this means that f(n) grows asymptotically no slower than g(n)
> - if f(n) is Θ(g(n)) this means that f(n) grows asymptotically at the same rate as g(n).
>
> As a result:
> if f(n) is Θ(g(n)) it is growing asymptotically at the same rate as g(n). So we can say that f(n) is not growing asymptotically slower or faster than g(n). But from the above, we can see this means that f(n) is Ω(g(n)) and f(n) is O(g(n)).
>
> Think of O as an upperbound, and Ω as a lower bound. These bounds can be tight or loose,but we prefer to make them tight as possible. If we have tight bounds where O and Ω have the same growth rate then we precisely know the growth rate. If we can precisely give the growth rate then we know Θ.
>
> An analogy is the height of a neighbour.
>
> - We can immediately say that the height of our neighbour is upper bounded by 1 million kilometers. 
> - We can also say that the height of our neighbour is lower bounded by 1 nanometer.
>
> These statements aren't very useful, because these bounds are so loose. However if we gave a lower bound for the height of our neighbour at 5' 5", and an upper bound of 5' 10" we would have a much better idea of how tall our neighbour was. If we had a lower bound of 5' 8" and an upper bound of 5' 8" we could then say that our neighbour is 5' 8".
>
> So for log(n) we could say:
>
> - log(n) is O(n^n) since log(n) grows asymptotically no faster than n^n
> - log(n) is O(n) since log(n) grows asymptotically no faster than n
> - log(n) is O(log(n)) since log(n) grows asymptotically no faster than log(n)
>
> We went from loose upper bounds to a tight upper bound.
>
> - log(n) is Ω(1) since log(n) grows asymptotically no slower than 1
> - log(n) is Ω(log(log(n))) since log(n) grows asymptotically no slower than log(log(n))
> - log(n) is Ω(log(n)) since log(n) grows asymptotically no slower than log(n)
>
> We went from loose lower bounds to a tight lower bound.
>
> Since we have log(n) is O(log(n)) and Ω(log(n)) we can say that log(n) is Θ(log(n)).

We can also make correct, but imprecise, statements using big-Ω notation. For example, if you really do have a million dollars in your pocket, you can truthfully say "I have an amount of money in my pocket, and it's **at least** 10 dollars." That is correct, but certainly not very precise. Similarly, we can correctly but imprecisely say that the worst-case running time of binary search is Ω(1), because we know that it takes **at least** constant time.

Of course, typically, when we are talking about algorithms, we try to describe their running time as precisely as possible.

## References

1. https://stackoverflow.com/questions/39138236/is-theta-notation-called-the-average-case
2. https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-00sc-introduction-to-computer-science-and-programming-spring-2011/unit-1/lecture-8-efficiency-and-order-of-growth/MIT6_00SCS11_rec04.pdf
3. https://everythingwhat.com/why-do-we-use-big-o-notation
4. https://www.khanacademy.org/computing/computer-science/algorithms/asymptotic-notation/a/big-big-omega-notation