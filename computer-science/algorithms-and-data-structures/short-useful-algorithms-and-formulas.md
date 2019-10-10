# Useful algorithms and formulas

## Leap year identification

```C
leap = year % 4 == 0  &&  year % 100 != 0   ||   year % 400 == 0; 
```

## Euclid's algorithm

```Java
public static ing gcd(int p, int q) {
	if (q == 0) return p; // base case
	int r = p % q;
	return gcd(q, r);
}
```

## Shuffling

This algorithm is the modern version of the Fisher–Yates shuffle, designed for computer use, was introduced by Richard Durstenfeld in 1964 and popularized by Donald E. Knuth in The Art of Computer Programming as "Algorithm P (Shuffling)" [[Fisher-Yates shuffle - wiki page]](https://www.wikiwand.com/en/Fisher%E2%80%93Yates_shuffle).

```javascript
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

Second version:

```Java
import java.util.Random;

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

Third version:

```Java
import java.util.Random;

// mix-up the array
public static void shuffle(Object[] a) {
    Random random = new Random();
    int N = a.length;
    for (int i = 0; i < N; i++) {
        // pick integer between [i and N-1] uniformly at random
        int rindex = random.nextInt(N - i + 1) + i;
        Object swap = a[i];
		a[i] = a[rindex];
		a[rindex] = swap;
    }
}
```

