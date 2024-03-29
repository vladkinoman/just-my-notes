# Useful concepts and tools in Java

## Table of Contents

1. [Collections](#collections)
   - [List Interface](#list-interface)
   - [ArrayList](#arraylist)
2. [Useful classes](#useful-classes)
   - [BigInteger](#BigInteger)
3. [Coping](#copying)
   - [Make a copy of an array](#Make-a-copy-of-an-array)
4. [Sorting](#sorting)
   - [Sorting with Comparable and Comparator](#Sorting-with-Comparable-and-Comparator)
   - [Sort int array in reverse order](#Sort-int-array-in-reverse-order)
   - [Sort 2D array](#sort-2D-array)
     - [Sort 2D array only by the first element](#Sort-2D-array-only-by-the-first-element)
     - [Sort 2D array by the first and the second elements](#Sort-2D-array-by-the-first-and-the-second-elements)
5. [Searching](#searching)
   - [Binary search in Java](#Binary-search-in-Java)
   - [Search element in a sorted 2D array](#search-element-in-a-sorted-2D-array)
     - [A simple solution](#a-simple-solution)
     - [Binary search in 2D array](#binary-search-in-2D-array)
     - [Linear search in 2D array](#Linear-search-in-2D-array)
     - [Another efficient approach](#another-efficient-approach)
6. [References](#references)

## Collections

![Core Interfaces in Collections](https://media.geeksforgeeks.org/wp-content/cdn-uploads/ListInterfaceJava.png)

### List Interface

The Java.util.List is a child interface of [Collection](https://www.geeksforgeeks.org/collections-in-java-2/). It is an ordered collection of objects in which duplicate values can be stored. Since List preserves the insertion order, it allows positional access and insertion of elements. List Interface is implemented by [ArrayList](https://www.geeksforgeeks.org/arraylist-in-java/), [LinkedList](https://www.geeksforgeeks.org/linked-list-in-java/), [Vector](https://www.geeksforgeeks.org/java-util-vector-class-java/) and [Stack](https://www.geeksforgeeks.org/stack-class-in-java/) classes.

```java
List a = new ArrayList();
List b = new LinkedList();
List c = new Vector(); 
List d = new Stack();
// Generic List Object:
// Obj is the type of object to be stored in List.
List<Obj> list = new ArrayList<Obj> ();   
```

The most useful methods:

- **void add(int index,Object O):** This method adds (appends) given element at specified index.
- **Object remove(int index):** This method removes an element from the specified index. It shifts subsequent elements(if any) to left and decreases their indexes by 1.
- **Object get(int index):** This method returns element at the specified index.
- **Object set(int index, Object new):** This method replaces element at given index with new element. This function returns the element which was just replaced by new element.
- **int indexOf(Object o):** This method returns first occurrence of given element or -1 if element is not present in list. 

#### ArrayList

*ArrayList* is one of the *List* implementations built atop an array, which is able to dynamically grow and shrink as you add/remove elements. Elements could be easily accessed by their indexes starting from zero. This implementation has the following properties:

- Random access takes *O(1)* time.

  ```java
  List<Integer> list = new ArrayList<>();
  //... adding
  Integer var = list.get(5);
  ```

- Adding element takes amortized constant time *O(1)*.

  ```java
  List<Long> list = new ArrayList<>();
  list.add(1L);
  list.add(2L);
  ```

- Inserting/Deleting takes *O(n)* time.

  ```java
  List<Long> list = new ArrayList<>();
  //...
  list.add(1, 3L);
  list.remove(1);
  ```

- Searching takes *O(n)* time for unsorted array and *O(log n)* for a sorted one.

  ```java
  List<String> list = LongStream.range(0, 16)
    .boxed()
    .map(Long::toHexString)
    .collect(toCollection(ArrayList::new));
  List<String> stringsToSearch = new ArrayList<>(list);
  stringsToSearch.addAll(list);
  ```

## Useful classes

### BigInteger

BigInteger class is used for mathematical operation which involves very big integer calculations that are outside the limit of all available primitive data types.

For example factorial of 100 contains 158 digits in it so we can’t store it in any primitive data type available. We can store as large Integer as we want in it. There is no theoretical limit on the upper bound of the range because memory is allocated dynamically but practically as memory is limited you can store a number which has Integer.MAX_VALUE number of bits in it which should be sufficient to store mostly all large values.

```java
// Initialize result 
BigInteger f = new BigInteger("1"); // Or BigInteger.ONE 
  
// Multiply f with 2, 3, ...N 
for (int i = 2; i <= N; i++) 
    f = f.multiply(BigInteger.valueOf(i)); 
```

If we have to write above program in C++, that would be too large and complex, we can look at [Factorial of Large Number](https://www.geeksforgeeks.org/factorial-large-number/).
In this way BigInteger class is very handy to use because of its large method library and it is also used a lot in competitive programming.

And for Integers available as string you can initialize them as:

```java
A  = new BigInteger(“54”);
B  = new BigInteger(“123456789123456789”); 
```

Some constant are also defined in BigInteger class for ease of initialization :

```java
A = BigInteger.ONE;
// Other than this, available constant are BigInteger.ZERO 
// and BigInteger.TEN
```

Mathematical operations:

```java
int c = a + b;
BigInteger C = A.add(B); 
```

Other similar function are `subtract()`, `multiply()`, `divide()`, `remainder()`.
But all these function take BigInteger as their argument so if we want these operation with integers or string convert them to BigInteger before passing them to functions as shown below:

```java
String str = “123456789”;
BigInteger C = A.add(new BigInteger(str));
int val  = 123456789;
BigInteger C = A.add(BigInteger.valueOf(val)); 
```

Extraction of value from BigInteger:

```java
int x   =  A.intValue();   // value should be in limit of int x
long y   = A.longValue();  // value should be in limit of long y
String z = A.toString();  
```

Comparison:

```java
if (a < b) {}         // For primitive int
if (A.compareTo(B) < 0)  {} // For BigInteger 
```


Actually compareTo returns -1(less than), 0(Equal), 1(greater than) according to values.

For equality we can also use:

```java
if (A.equals(B)) {}  // A is equal to B 
```

The most useful methods:

- **[BigInteger abs()](https://www.geeksforgeeks.org/biginteger-abs-method-in-java/)**: This method returns a BigInteger whose value is the absolute value of this BigInteger.
- **[int bitCount()](https://www.geeksforgeeks.org/biginteger-bitcount-method-in-java/)**: This method returns the number of bits in the two’s complement representation of this BigInteger that differ from its sign bit.
- **[int bitLength()](https://www.geeksforgeeks.org/biginteger-bitlength-method-in-java/)**: This method returns the number of bits in the minimal two’s-complement representation of this BigInteger, excluding a sign bit.
- **[byte byteValueExact()](https://www.geeksforgeeks.org/java-8-biginteger-bytevalueexact-method-with-examples/)**: This method converts this BigInteger to a byte, checking for lost information.
- **[BigInteger clearBit(int n)](https://www.geeksforgeeks.org/biginteger-clearbit-method-in-java/)**: This method returns a BigInteger whose value is equivalent to this BigInteger with the designated bit cleared.
- **[BigInteger[] divideAndRemainder(BigInteger val)](https://www.geeksforgeeks.org/java-8-biginteger-divideandremainder-method-with-examples/)**: This method returns an array of two BigIntegers containing (this / val) followed by (this % val).
- **BigInteger gcd(BigInteger val)**: This method returns a BigInteger whose value is the greatest common divisor of abs(this) and abs(val).
- **[int getLowestSetBit()](https://www.geeksforgeeks.org/biginteger-getlowestsetbit-method-in-java/)**: This method returns the index of the rightmost (lowest-order) one bit in this BigInteger (the number of zero bits to the right of the rightmost one bit).
- **[int signum()](https://www.geeksforgeeks.org/biginteger-signum-method-in-java/)**: This method returns the signum function of this BigInteger.
- **[BigInteger sqrt()](https://www.geeksforgeeks.org/biginteger-sqrt-method-in-java/)**: This method returns the integer square root of this BigInteger.
- **BigInteger[] sqrtAndRemainder()**: This method returns an array of two BigIntegers containing the integer square root s of this and its remainder this – s*s, respectively.
- **[byte[\] toByteArray()](https://www.geeksforgeeks.org/biginteger-tobytearray-method-in-java/)**: This method returns a byte array containing the two’s-complement representation of this BigInteger.
- **[String toString()](https://www.geeksforgeeks.org/biginteger-tostring-method-in-java/)**: This method returns the decimal String representation of this BigInteger.
- **[String toString(int radix)](https://www.geeksforgeeks.org/biginteger-tostring-method-in-java/)**: This method returns the String representation of this BigInteger in the given radix.
- **[static BigInteger valueOf(long val)](https://www.geeksforgeeks.org/biginteger-valueof-method-in-java/)**: This method returns a BigInteger whose value is equal to that of the specified long.
- **[BigInteger xor(BigInteger val)](https://www.geeksforgeeks.org/biginteger-xor-method-in-java/)**: This method returns a BigInteger whose value is (this ^ val).

## Copying

You can't use variable assignment like you did in C++. This method has side effects as changes to the element of an array reflects on both the places. To prevent this side effect following are the better ways to copy the array elements.

You can create a new array of the same length and copy each element, but this is a boring way to make a copy. There are nice instruments below.

### Make a copy of an array

> Nice explanation from [this website]( https://www.journaldev.com/753/java-copy-array-array-copy-java ).

**Object.clone()**: Object class provides clone() method and since array in java is also an Object, you can use this method to achieve full array copy. This method will not suit you if you want partial copy of the array.

```java
int[] b = a.clone();
```

**Arrays.copyOf()**: If you want to copy first few elements of an array or full copy of array, you can use this method. Obviously it’s not versatile like System.arraycopy() but it’s also not confusing and easy to use. 

```java
int[] c = Arrays.copyOf(a, a.length);
```

> **Arrays.copyOf may be faster than a.clone() on small arrays.** Both copy elements equally fast but clone() returns Object so the compiler has to insert an implicit cast to int[]. You can see it in the bytecode, something like this:
>
> ```java
> ALOAD 1
> INVOKEVIRTUAL [I.clone ()Ljava/lang/Object;
> CHECKCAST [I
> ASTORE 2
> ```

> Both copyOf() and copyOfRange() methods use System.arraycopy under the hood.

#### Other methods

**Arrays.copyOfRange()**: If you want few elements of an array to be copied, where starting index is not 0, you can use this method to copy partial array.

**System.arraycopy()**: System class arraycopy() is the best way to do partial copy of an array. It provides you an easy way to specify the total number of elements to copy and the source and destination array index positions. 

**System.arraycopy(source, 3, destination, 2, 5)** will copy 5 elements from source to destination, beginning from 3rd index of source to 2nd index of destination.

## Sorting

### Sorting with Comparable and Comparator

If we sort a Java List with a custom object, then we should implement Comparable interface :

```java
class Simpson implements Comparable<Simpson> {
    String name;

    Simpson(String name) {
        this.name = name;
    }

    @Override
    public int compareTo(Simpson simpson) {
        return this.name.compareTo(simpson.name);
    }
}
...
    List<SimpsonCharacter> simpsons = new ArrayList<>();
    simpsons.add(new SimpsonCharacter("Homer "));
    simpsons.add(new SimpsonCharacter("Marge "));
    simpsons.add(new SimpsonCharacter("Bart "));
    simpsons.add(new SimpsonCharacter("Lisa "));

    Collections.sort(simpsons);
    simpsons.stream().map(s -> s.name).forEach(System.out::print);
```

In Java, we can sort an array with any type we want as long as it implements the `Comparable` interface. Keep in mind that custom objects must implement `Comparable` in order to be sorted, even as an array.

If the Simpson object wasn’t implementing `Comparable`, a [ClassCastException](https://doc.bccnsoft.com/docs/jdk8u12-docs/api/java/lang/ClassCastException.html) would be thrown.

`TreeMap` uses the `compareTo()` method implemented by the `Comparable` interface. Each element in the resulting `Map` is sorted by its key.

The `Set` interface is responsible for storing unique values, but when we use the [TreeSet](https://docs.oracle.com/javase/7/docs/api/java/util/TreeSet.html) implementation, inserted elements will be automatically sorted as we add them.

---

What if we didn’t want to use the same `compareTo()` method from the class? Could we override the `Comparable` method to use a different logic?

```java
public class BadExampleOfComparable {

    public static void main(String... args) {
        List<SimpsonCharacter> characters = new ArrayList<>();

        SimpsonCharacter homer = new SimpsonCharacter("Homer") {
            @Override
            public int compareTo(SimpsonCharacter simpson) {
                return this.name.length() - (simpson.name.length());
            }
        };

        SimpsonCharacter moe = new SimpsonCharacter("Moe") {
            @Override
            public int compareTo(SimpsonCharacter simpson) {
                return this.name.length() - (simpson.name.length());
            }
        };

        characters.add(homer);
        characters.add(moe);

        Collections.sort(characters);

        System.out.println(characters);
    }

}
```

As you can see, this code is complicated and includes a lot of repetition. We had to override the `compareTo()` method twice for the same logic. If there were more elements we would have to replicate the logic for each object.

Fortunately, we have the [Comparator](https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html) interface, which lets us detach the `compareTo()` logic from Java classes. Consider the same example above rewritten using `Comparator`:

```java
public class GoodExampleOfComparator {

    public static void main(String... args) {
        List<SimpsonCharacter> characters = new ArrayList<>();

        SimpsonCharacter homer = new SimpsonCharacter("Homer");
        SimpsonCharacter moe = new SimpsonCharacter("Moe");

        characters.add(homer);
        characters.add(moe);

        Collections.sort(characters, (Comparator.<SimpsonCharacter>
                        comparingInt(character1 -> character1.name.length())
                        .thenComparingInt(character2 -> character2.name.length())));

        System.out.println(characters);
    }
}
```

Use `Comparable` when there is a single, default comparison for your object. Use `Comparator`when you need to work around an existing `compareTo()`, or when you need to use specific logic in a more flexible way. `Comparator` detaches the sorting logic from your object and contains the `compareTo()` logic within your `sort()` method.

In this next example, we use an anonymous inner class to compare the value of objects. An *anonymous inner class*, in this case, is any class that implements `Comparator`. Using it means we are not bound to instantiating a named class implementing an interface; instead, we implement the `compareTo()` method inside the anonymous inner class.

```java
public class MarvelComparator {

    public static void main(String... comparator) {
        List<String> marvelHeroes = new ArrayList<>();

        marvelHeroes.add("SpiderMan ");
        marvelHeroes.add("Wolverine ");
        marvelHeroes.add("Xavier ");
        marvelHeroes.add("Cyclops ");


        Collections.sort(marvelHeroes, new Comparator<String>() {
            @Override
            public int compare(String hero1, String hero2) {
                return hero1.compareTo(hero2);
            }
        });

        Collections.sort(marvelHeroes, (m1, m2) -> m1.compareTo(m2));

        Collections.sort(marvelHeroes, Comparator.naturalOrder());

        marvelHeroes.forEach(System.out::print);
    }
}
```

### Using Comparator with lambda expressions

Anonymous inner classes are verbose, which can cause problems in our code. In the `Comparator` interface, we can use lambda expressions to simplify and make the code easier to read. For example, we could change this:

```java
Collections.sort(marvel, new Comparator<String>() {
            @Override
            public int compare(String hero1, String hero2) {
                return hero1.compareTo(hero2);
            }
        });
```

to this:

```java
Collections.sort(marvel, (m1, m2) -> m1.compareTo(m2));
```

Less code and the same result!

The output of this code would be:

```java
Cyclops SpiderMan Wolverine Xavier 
```

We could make the code even simpler by changing this:

```java
Collections.sort(marvel, (m1, m2) -> m1.compareTo(m2));
```

to this:

```java
Collections.sort(marvel, Comparator.naturalOrder());
```

---

Many core Java classes and objects implement the `Comparable` interface, which means we don’t have to implement the `compareTo()` logic for those classes. Here are a few familiar examples:

### Sort int array in reverse order

In Java, it's easy to sort an array, you just need to call the Arrays.sort() method with a Comparator which can sort the array in the order you want but it highly depends upon which type of object is stored in the array.

For example, you can sort an object array in decreasing or reverse order, just provide a Comparator with the opposite order. You can even use Collections.reverseOrder() if you want to sort an array in the decreasing order, which returns a reverse Comparator to sort objects in the order opposite of their natural ordering defined by the compareTo() method.

Unfortunately, **for a primitive array, there is no direct way to sort in descending order**. The Arrays.sort() method which is used to sort a primitive array in Java doesn't accept a boolean to sort the primitive array in reverse order.

That will work fine with Integer array (Objects and other wrapper types) but will not work with an int array. The only way to sort a primitive array in descending order is first sorted the array in ascending order and then reverse the array in place. This is also true for two-dimensional primitive arrays.

```java
Arrays.sort(arr);
reverse(arr);
```

Where `reverse` has the following implementation:

```java
private static void reverseArray(int[] arr) {
        for(int i = 0; i < arr.length / 2; i++) {
            int temp = arr[i];
            arr[i] = arr[arr.length - i - 1];
            arr[arr.length - i - 1] = temp;
        }
    }
```

To reverse an int array, you swap items up until you reach the midpoint (`arr.length/2`).

> **Application** 
>
> I used this approach in [this](https://github.com/vladkinoman/coding-challenges/blob/master/HackerRank/076-largest-permutation/java/Solution.java) coding challenge.

---

With [Commons.Lang](http://commons.apache.org/lang/), you could simply use

```java
 ArrayUtils.reverse(int[] array)
```

Most of the time, it's quicker and more bug-safe to stick with easily available libraries already unit-tested and user-tested when they take care of your problem.

With Guava:

```java
Collections.reverse(Ints.asList(array));
```

---

In case of **Java 8** we can also use `IntStream` to reverse the array of integers as:

```java
int[] sample = new int[]{1,2,3,4,5};
int size = sample.length;
int[] reverseSample = IntStream.range(0,size).map(i -> sample[size-i-1]).toArray(); //Output: [5, 4, 3, 2, 1]
```

This approach is even more concise:

```java
int[] a = {8, 6, 7, 5, 3, 0, 9};
int[] b = IntStream.rangeClosed(1, a.length).map(i -> a[a.length-i]).toArray();
```

---

Also, there is an interesting approach for numbers!

1. multiply the Array by -1 (for each element)
2. sort
3. multiply once again with -1 (for each element)

Literally spoken:

```java
array = -Arrays.sort(-array) 
```

> This method is actually creative if we are sorting numbers, even though it is not generic and could cause problems for overflow. So, it'll **fail** for `Integer.MIN_VALUE` (or whichever primitive is used). Would be better to `sort()`, then `reverse()`, but you'll have to do the reversing yourself, since they didn't add `Arrays.reverse()`

### Sort 2D array

#### Sort 2D array only by the first element

Use Overloaded [Arrays.sort(T[] a, Comparator c)](https://docs.oracle.com/javase/6/docs/api/java/util/Arrays.html#sort%28T%5B%5D,%20java.util.Comparator%29) which takes Comparator as the second argument.

```java
double[][] array= {
{1, 5},
{13, 1.55},
{12, 100.6},
{12.1, .85} };

java.util.Arrays.sort(array, new java.util.Comparator<double[]>() {
    public int compare(double[] a, double[] b) {
        return Double.compare(a[0], b[0]);
    }
});
```

That's how it's done in Java 8 with lambda:

```java
Arrays.sort(myArr, (a, b) -> Double.compare(a[0], b[0]));
```

#### Sort 2D array by the first and the second elements


```java
Arrays.sort(obstacles, new java.util.Comparator<int[]>() {
	public int compare(int[] a, int[] b) {
        int cmp = Integer.compare(a[0], b[0]);
        if (cmp < 0 || cmp > 0) return cmp;
        else return Integer.compare(a[1], b[1]);
    }
});
```

#### Sort 2D array by the second parameter in ascending order and by the first parameter in decreasing order when the two second parameters are equal

> Done this in the coding challenge Luck Balance (HackerRank).

```javascript
java.util.Arrays.sort(aa, new java.util.Comparator<int[]>() {
    public int compare(int[] a, int[] b) {
        int cmp_importance = Integer.compare(a[1], b[1]);
        if (cmp_importance < 0 || cmp_importance > 0) {
            return cmp_importance;
        } else return -Integer.compare(a[0], b[0]);
    }
});
```

Let's look at the line `-Integer.compare(a[0], b[0]);`. In order to get descending order, I think you can do comparison in any manner. You can swap the elements in the following way: `Integer.compare(b[0], a[0])`. Or you can apply [subtraction](https://stackoverflow.com/questions/61088123/how-to-sort-two-dimensional-array-using-comparator-in-java) instead of `compare`.

#### Using streams for sorting

Suppose an ArrayList given and we want to sort it in descending order. We can use for it `java.util.stream.Stream.sorted(Comparator)` method. What to do with the comparator in Java 8?

You can use [`Comparator.reverseOrder()`](https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html#reverseOrder--) to have a comparator giving the reverse of the natural ordering.

If you want to reverse the ordering of an existing comparator, you can use [`Comparator.reversed()`](https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html#reversed--).

Sample code:

```java
Stream.of(1, 4, 2, 5)
    .sorted(Comparator.reverseOrder()); 
    // stream is now [5, 4, 2, 1]

Stream.of("foo", "test", "a")
    .sorted(Comparator.comparingInt(String::length).reversed()); 
    // stream is now [test, foo, a], sorted by descending length
```

---

You can also use [Comparator.comparing(Function, Comparator)](https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html#comparing-java.util.function.Function-java.util.Comparator-)
It is convenient to chain comparators when necessary, e.g.:

```java
Comparator<SomeEntity> ENTITY_COMPARATOR = comparing(SomeEntity::getProperty1, reverseOrder())
        .thenComparingInt(SomeEntity::getProperty2)
        .thenComparing(SomeEntity::getProperty3, reverseOrder());
```

## Searching

### Binary search in Java

**[Arrays](https://www.geeksforgeeks.org/array-class-in-java/).binarySearch()** is the simplest and most efficient method to find an element in a sorted array in Java:

```java
public static int binarySearch(data_type arr, data_type key )
public static int binarySearch(data_type[] arr, int fromIndex, int toIndex, data_type key)

Parameters :
 arr – the array to be searched
 fromIndex – the index of the first element (inclusive) to be searched
 toIndex - the index of the last element (exclusive) to be searched
 key  – the value to be searched for
```

where `data_type` can be any of the primitive data types: byte, char, double, int, float, short, long and Object as well. The array must be sorted (as by the Arrays.sort() method) prior to making this call.

**Important Points:**

- If input list is not sorted, the results are undefined.
- If there are duplicates, there is no guarantee which one will be found.

**java.util.[Collections.binarysearch()](https://www.geeksforgeeks.org/collections-binarysearch-java-examples/)** method is a java.util.Collections class method works for objects [Collections](https://www.geeksforgeeks.org/collections-in-java-2/) like [ArrayList](https://www.geeksforgeeks.org/arraylist-in-java/) and [LinkedList](http://geeksquiz.com/linked-list-in-java/).

```java
// Returns index of key in sorted list sorted in
// ascending order
public static int binarySearch(List slist, T key)

// Returns index of key in sorted list sorted in
// order defined by Comparator c.
public static int binarySearch(List slist, T key, Comparator c)

If key is not present, the it returns "(-(insertion point) - 1)". 
The insertion point is defined as the point at which the key 
would be inserted into the list.
```

Here is an example:

```java
List al = new ArrayList(); 
al.add(100); 
al.add(50); 
al.add(30); 
al.add(10); 
al.add(2); 

// The last parameter specifies the comparator method 
// used for sorting. 
int index = Collections.binarySearch(al, 50,  
                          Collections.reverseOrder());
```

The method throws **ClassCastException** if elements of list are not comparable using the specified comparator, or the search key is not comparable with the elements.

**Important Points:**

- If input list is not sorted, the results are undefined.
- If there are duplicates, there is no guarantee which one will be found.
- This method runs in log(n) time for a “random access” list like ArrayList. If the specified list does not implement the RandomAccess interface and is large, this method will do an iterator-based binary search that performs O(n) link traversals and O(log n) element comparisons.

### Search element in a sorted 2D array

Given a sorted matrix mat\[n][m] and an element ‘x’. Find position of x in the matrix if it is present, else print -1. Matrix is sorted in a way such that all elements in a row are sorted in increasing order and for row ‘i’, where `1 <= i <= n-1`, first element of row 'i' is greater than or equal to the last element of row 'i-1'. The approach should have `O(log n + log m)` (or at least `O(n + m)`) time complexity. Examples:

```java
Input : mat[][] = { {1, 5, 9},
                    {14, 20, 21},
                    {30, 34, 43} }
        x = 14
Output : Found at (1, 0)

Input : mat[][] = { {1, 5, 9, 11},
                    {14, 20, 21, 26},
                    {30, 34, 43, 50} }
        x = 42
Output : -1
```

Please note that this problem is different from [Search in a row wise and column wise sorted matrix](https://www.geeksforgeeks.org/search-in-row-wise-and-column-wise-sorted-matrix/). Here matrix is more strictly sorted as first element of a row is greater than last element of previous row. 

#### A simple solution

A **Simple Solution** is to one by one compare x with every element of matrix. If matches, then return position. If we reach end, return -1. Time complexity of this solution is `O(n x m)`. 

#### Binary search in 2D array

An **efficient solution** is to typecast given 2D array to 1D array, then apply [binary search](https://www.geeksforgeeks.org/binary-search/) on the typecasted array.

2D array should be sorted before next:

```java
int index = -1;
for (int i : a.length){
  for (int j = 0; j < a[0].length; j++)
      putIn1Darray[j] = a[i][j];
  index = Arrays.binarySearch(putIn1Darray, key); 
  if (index == -1)
      //Element not found yet
      continue;
  else
      //Element found
      break;   
} 
return index;
```

The running time of this algorithm will be `O(m * (n + log n)).`

A more **efficient solution** is to typecast given 2D array to 1D array, then apply [binary search](https://www.geeksforgeeks.org/binary-search/) on the typecasted array. This will give us `O(m * n + log n)`.

#### Linear search in 2D array

> I think it is the best way to find the element.

It can be solved in a simple way in `O(m + n)` time complexity, *where m = no. of rows and n = no. of columns*. Of course, the 2D array should be sorted.

> **The algorithm is simple:** I started from top right corner (we can also start from bottom left corner) and move left if current element is greater than the value to be searched and bottom if current element is smaller than the value to be searched.

The java code is like:

```java
public static int[] linearSearch(int[][] a, int value) {
    int i = 0, j = a[0].length - 1; // start from top right corner

    while (i < a.length && j >= 0) {
        if (a[i][j] == value) {
            return new int[]{i, j};
        } else if (a[i][j] > value) {
            j--; // move left
        } else {
            i++; // move down
        }
    }
    // element not found
    return new int[]{-1, -1};

}
```

[**Gist**](https://github.com/rampatra/Algorithms-and-Data-Structures-in-Java/blob/master/src/main/java/com/rampatra/arrays/SearchInSorted2DArray.java#L63)

You can further reduce the time complexity by using a method called Improved Binary Partition.

Additional information about this approach can be found [here](https://stackoverflow.com/q/2457792/9842375#answer-2458113).

#### Another efficient approach

**Another efficient approach** that doesn’t require typecasting is explained below:

1. Perform binary search on the middle column till only two elements are left or till the middle element of some row in the search is the required element 'x'. This search is done to skip the rows that are not required
2. The two left elements must be adjacent. Consider the rows of two elements and do following
   - check whether the element 'x' equals to the middle element of any one of the 2 rows
   - otherwise according to the value of the element 'x' check whether it is present in the 1st half of 1st row, 2nd half of 1st row, 1st half of 2nd row or 2nd half of 2nd row. 

Note: This approach works for the matrix n x m where 2 <= n. The algorithm can be modified for matrix 1 x m, we just need to check whether 2nd row exists or not

## References

1. https://www.geeksforgeeks.org/list-interface-java-examples/
2. https://www.baeldung.com/java-arraylist 
3. https://www.geeksforgeeks.org/biginteger-class-in-java/ 
4. https://stackoverflow.com/questions/5785745/make-copy-of-an-array
5. https://www.infoworld.com/article/3323403/java-challengers-5-sorting-with-comparable-and-comparator-in-java.html
6. https://www.java67.com/2016/07/how-to-sort-array-in-descending-order-in-java.html
7. https://stackoverflow.com/questions/2137755/how-do-i-reverse-an-int-array-in-java
8. https://stackoverflow.com/questions/1694751/java-array-sort-descending
9. https://stackoverflow.com/questions/15452429/java-arrays-sort-2d-array
10. https://stackoverflow.com/questions/32995559/reverse-a-comparator-in-java-8
11. https://www.geeksforgeeks.org/arrays-binarysearch-java-examples-set-1/
12. https://www.geeksforgeeks.org/arrays-binarysearch-in-java-with-examples-set-2-search-in-subarray/ 
13. https://www.geeksforgeeks.org/collections-binarysearch-java-examples/ 
14. https://www.geeksforgeeks.org/search-element-sorted-matrix/
15. https://www.geeksforgeeks.org/search-in-a-row-wise-and-column-wise-sorted-2d-array-using-divide-and-conquer-algorithm/ 
16. https://stackoverflow.com/questions/4421479/binary-search-in-2d-array 
17. https://stackoverflow.com/questions/8234915/binary-search-in-2-dimensional-array-with-duplicates-java
18. https://stackoverflow.com/q/2457792/9842375#answer-2458113 

 

