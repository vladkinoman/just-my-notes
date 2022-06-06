# Shuffling in Java

## Implementing shuffling

This algorithm is the modern version of the Fisher–Yates shuffle, designed for computer use, was introduced by Richard Durstenfeld in 1964 and popularized by Donald E. Knuth in The Art of Computer Programming as "Algorithm P (Shuffling)" [[Fisher-Yates shuffle - wiki page]](https://www.wikiwand.com/en/Fisher%E2%80%93Yates_shuffle).

The algorithm's time complexity is `O(n)`, compared to `O(n²)` for the original implementation.

```java
// Java implementation
import java.util.Random;

// mix-up the array
public static void shuffle(Object[] a) {
    Random random = new Random();
    int N = a.length;
    for (int i = N - 1; i > 0; --i) {
        // pick integer between [0 and i] uniformly at random
        int rindex = random.nextInt(i + 1);
        // swap i with rindex
        Object swap = a[i];
        a[i] = a[rindex];
        a[rindex] = swap;
    }
}
```

In Java you should use [ThreadLocalRandom](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ThreadLocalRandom.html) instead of `Random`. When applicable, use of `ThreadLocalRandom` rather than shared `Random` objects in concurrent programs will typically encounter much less overhead and contention. Use of `ThreadLocalRandom` is particularly appropriate when multiple tasks (for example, each a [`ForkJoinTask`](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ForkJoinTask.html)) use random numbers in parallel in thread pools. [Random considered as old version by people on StackOverflow](https://stackoverflow.com/questions/1519736/random-shuffling-of-an-array).

```java
import java.util.concurrent.ThreadLocalRandom;
...
    Random rnd = ThreadLocalRandom.current();
	int index = rnd.nextInt(i + 1);
```

## References

1. https://stackoverflow.com/questions/1519736/random-shuffling-of-an-array?answertab=votes#tab-top