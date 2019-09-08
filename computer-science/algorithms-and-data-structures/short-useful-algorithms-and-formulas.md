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
