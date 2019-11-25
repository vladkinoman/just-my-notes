# Useful algorithms and formulas

## Table of Contents

1. [Leap year identification](#Leap-year-identification)
2. [Euclid's algorithm](#Euclids-algorithm)
   - [Recursive version](#Recursive-version)
3. [Shuffling](#Shuffling)
   - [Q/A](#QA)
4. [Get fractional and whole part out from double](#Get-fractional-and-whole-part-out-from-double)
5. [Bit manipulation](#Bit-manipulation)
   - [(x - 1) trick](#(x---1)-trick)
   - [x & (x - 1) trick and numbers which are powers of 2](#x-&-(x---1)-trick-and-numbers-which-are-powers-of-2)

## Leap year identification

```C
leap = year % 4 == 0  &&  year % 100 != 0   ||   year % 400 == 0; 
```

## Euclid's algorithm

### Recursive version

```Java
public static ing gcd(int p, int q) {
	if (q == 0) return p; // base case
	int r = p % q;
	return gcd(q, r);
}
```

## Shuffling

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

An equivalent version which shuffles the array in the opposite direction (from lowest index to highest).

```Java
public static void shuffle(Object[] a) {
    Random random = new Random();
    int N = a.length;
    for (int i = 0; i < N; i++) {
        // pick integer between [0 and i] uniformly at random
        int rindex = random.nextInt(i + 1);
        Object swap = a[i];
        a[i] = a[rindex];
        a[rindex] = swap;
    }
}
```

The third version is similar to the first one, but uses a different range from `i` to `N-1`.

```Java
public static void shuffle(Object[] a) {
    Random random = new Random();
    int N = a.length;
    for (int i = N-1; i >= 0; --i) {
        // pick integer between [i and N-1] uniformly at random
        int rindex = i + random.nextInt(N - i);
        Object swap = a[i];
        a[i] = a[rindex];
        a[rindex] = swap;
    }
}
```

The fourth version is similar to the second one, but as well as the third one, it uses the range from `i` to `N-1`.

```java
public static void shuffle(Object[] a) {
    Random random = new Random();
    int N = a.length;
    for (int i = 0; i < N; i++) {
        // pick integer between [i and N-1] uniformly at random
        int rindex = i + random.nextInt(N - i);
        Object swap = a[i];
        a[i] = a[rindex];
        a[rindex] = swap;
    }
}
```

### Q/A

**How to distinguish the versions?** The only distinguishing feature here is the range which is either `[i; N-1]` or `[0; i]`. You can see that the `N-1` in the first range is immutable as well as the `0` in the second one. It doesn't matter how you iterate them.

**Why can't we use the range** `[0; N-1]`**?** In this case, shuffle won't be uniform.

**Java has a method called** `Collections.shuffle(Arrays.asList(array))`, **can we use it to sort an array of integers?** If you want to shuffle the array of type `int`, then `Collections.shuffle(Arrays.asList(array))` doesn't work, because `Arrays.asList(array)` returns `Collection<int[]>` not `Collection<Integer>`. You see, `aslist()` method works with generic parameter `T`, so we should use reference types. More detail explanation you can get [here](https://stackoverflow.com/questions/3981420/why-does-collections-shuffle-fail-for-my-array#answer-3981494). Also, you should know that `Collections.shuffle` is a bit of an overkill because if you have an array of thousands or millions of primitive values to sort, wrapping each one in an object just to do a sort is a bit costly, both in memory and in CPU.

## Get fractional and whole part out from double

In Java-like programming languages it can be done in this way:

```Java
double value = 3.25;
double fractionalPart = value % 1;
double integralPart = value - fractionalPart;
```

> `%` here means *remainder*. Meanwhile, in Python `%` means *modulo*. ToDo: check later the interpretations of this sign in various programming languages.

More info [here](https://stackoverflow.com/questions/343584/how-do-i-get-whole-and-fractional-parts-from-double-in-jsp-java).

## Bit manipulation

### (x - 1) trick

Binary representation of (x-1) can be obtained by simply flipping all the bits to the right of rightmost 1 in x and also including the rightmost 1.

> Let, x = 4 = (100)₂
> x - 1 = 3 = (011)₂
> Let, x = 6 = (110)₂
> x - 1 = 5 = (101)₂

###  x & (x - 1) trick and numbers which are powers of 2

Now think about x & (x-1). x & (x-1) will have all the bits equal to the x except for the rightmost 1 in x.

> Let, x = 4 = (100)₂
> x - 1 = 3 = (011)₂
> x & (x-1) = 4 & 3 = (100)₂ & (011)₂= (000)₂
> Let, x = 6 = (110)₂
> x - 1 = 5 = (101)₂
> x & (x-1) = 6 & 5 = (110)₂ & (101)₂ = (100)₂ 

Properties for numbers which are powers of 2, is that they have one and only one bit set in their binary representation. If the number is neither zero nor a power of two, it will have 1 in more than one place. So if x is a power of 2 then x & (x-1) will be 0.

**Implementation:**

```c++
bool isPowerOfTwo(int x)
{
    // x will check if x == 0 and !(x & (x - 1)) will check if x is a power of 2 or not
    return (x && !(x & (x - 1)));
}
```