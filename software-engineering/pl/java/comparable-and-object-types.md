# Comparable and Object types in Java

## Problem

In my code I find out that I can do implicit cast `Comparable [] → Object []` , but I can't do implicit cast `Integer[] → Object [] → Comparable []`. Nonetheless, I can fix it by doing the explicit cast (downcast?) `(Comparable []) Object[]`.

In the code it looked like this:

```Java
private static void exch(Object[] a, int i, int j) {
    Object swap = a[i];
    a[i] = a[j];
    a[j] = swap;
}

private static void shuffle(Object[] a) {
    Random random = new Random();
    int N = a.length;
    for (int i = 0; i < N; i++) {
        int rindex = random.nextInt(i + 1);
        // if formal parameter is an array of Objects:
        exch(a, i, rindex);                
        // if formal parameter is an array of Comparables:
        // exch((Comparable []) a, i, rindex);
        // otherwise, we will get an error at the stage of compilation:
        // error: incompatible types: Object[] 
        //  cannot be converted to Comparable[]
    }
}

public static void main(String[] args) {
    Integer[] a = {-10, 5, -20, 0, 100, 40, 10, -5, -15};
    shuffle(a);
    for (int x: a) {
        System.out.print(x + " ");
    }
    System.out.println();
}
```

There are two questions:

- Why do we need to do this cast? Is it downcasting?

- If we consider API, what should we use in our algorithms, Object or Comparable?

  > Perhaps the answer to the last question is in the book "Algorithms".

## Comparisons and observations

The key point here is that Object is a class, but Comparable is an interface!

A comparable type is a reference type whose class `C` implements the `Comparable<C>` interface. The interface defines one method: `int compareTo(<T> other)`. Read the [javadoc](http://docs.oracle.com/javase/8/docs/api/java/lang/Comparable.html) for details.

- Primitive types (e.g. `int` and `double`) are not `Comparable`. 

- The type `Object` is a reference type, BUT it is not a comparable because it does not implement `Comparable<Object>`.

- The type `String` is a reference type, AND it implements `Comparable<String>`. Therefore it is a comparable type. And this is clear from the javadoc for String which says:

  ```java
  public final class String extends Object
      implements Serializable, Comparable<String>, CharSequence
  ```

The difference between [primitive types](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html) and reference types is fundamental in Java. Primitive types are `boolean`, `byte`, `char`, `short`, `int`, `long`, `float` and `double`. Reference types are Java classes and Java array types.

So, in my example we have `Integer[] → Object [] → Comparable []` and cast `Object[]` to `Comparable[]` type. The compiler can't do this casting implicitly. It doesn't know what `Object[]` is. By doing the explicit cast, we postpone this decision for the running time. JVM checks the type of the array `a[]` and casts it to `Comparable[]` if the original type is `Integer[]` (or other reference type which implements Comparable interface). It is important to know that there will be an exception if you build a simple sequence `(Comparable[]) Object [] → Comparable []`:

```bash
Exception in thread "main" java.lang.ClassCastException: [Ljava.lang.Object; cannot be cast to [Ljava.lang.Comparable;
	at TestRandom.shuffle(TestRandom.java:16)
	at TestRandom.main(TestRandom.java:22)
```

If you try to write `int[]` from the beginning, you won't even pass the array in the first function which accepts `Object[]` because you can't cast the primitive type to the reference one:

```bash
error: incompatible types: int[] cannot be converted to Object[]
```

## Conclusion

Comparable is an interface, and Object is a class which doesn't implement the Comparable interface. If we want to use the Comparable interface, then we have to use a reference type which implements it.

I haven't found the answer to the second question. Maybe I will get it in CHAPTER 5 of the "Algorithms" book. Also, there was a mention about Comparable interface in the question of the "2.4 Priority Queues" chapter.

```
Q. Why not use Comparable, as we do for sorts, instead of the generic Item in MaxPQ ?
A. Doing so would require the client to cast the return value of delMax() to an actual
type, such as String. Generally, casts in client code are to be avoided.
```

## References

- [Difference between Comparable and Object type](https://stackoverflow.com/questions/23024879/difference-between-comparable-and-object-type#answer-23024924)
- [Algorithms, 4th Edition - website](https://algs4.cs.princeton.edu/home/)