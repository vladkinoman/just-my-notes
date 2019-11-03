# Useful concepts and tools in Java

## Table of Contents

1. [Collections](#collections)
   - [List Interface](#list-interface).
   - [ArrayList](#arraylist).
2. [Coping](#copying).
   - [Make a copy of an array](#Make-a-copy-of-an-array).
3. [Sorting](#sorting).
   - [Sort 2D array](#sort-2D-array).
     - [Sort 2D array only by the first element](#Sort-2D-array-only-by-the-first-element).
     - [Sort 2D array by the first and the second elements](#Sort-2D-array-by-the-first-and-the-second-elements).
4. [Searching](#searching).
   - [Binary search in Java](#Binary-search-in-Java).
   - [Search element in a sorted 2D array](#search-element-in-a-sorted-2D-array).
     - [A simple solution](#a-simple-solution).
     - [Binary search in 2D array](#binary-search-in-2D-array).
     - [Linear search in 2D array](#Linear-search-in-2D-array).
     - [Another efficient approach](#another-efficient-approach).
5. [References](#references).

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

## Copying

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

https://www.geeksforgeeks.org/list-interface-java-examples/

https://www.baeldung.com/java-arraylist 

https://stackoverflow.com/questions/5785745/make-copy-of-an-array

https://stackoverflow.com/questions/15452429/java-arrays-sort-2d-array

https://www.geeksforgeeks.org/arrays-binarysearch-java-examples-set-1/

https://www.geeksforgeeks.org/arrays-binarysearch-in-java-with-examples-set-2-search-in-subarray/ 

https://www.geeksforgeeks.org/collections-binarysearch-java-examples/ 

https://www.geeksforgeeks.org/search-element-sorted-matrix/

https://www.geeksforgeeks.org/search-in-a-row-wise-and-column-wise-sorted-2d-array-using-divide-and-conquer-algorithm/ 

https://stackoverflow.com/questions/4421479/binary-search-in-2d-array 

https://stackoverflow.com/questions/8234915/binary-search-in-2-dimensional-array-with-duplicates-java

https://stackoverflow.com/q/2457792/9842375#answer-2458113 

 

