# Useful concepts and tools in C++

## Table of Contents

1. [Collections](#collections)
   * [std:vector](#stdvector)
   * [std:list](#stdlist)
   * [std:map](#stdmap)
   * [std:unordered_map](#stdunordered_map)
   * [std:set](#stdset)
   * [std:unordered_set](#stdunordered_set)
2. [Algorithms](#algorithms).
   * [std::min](#stdmin)
3. [Iterating](#Iterating)
4. [Useful classes and modules](#useful-classes-and-modules)
   * [stdexcept](#stdexcept)
   * [numeric](#numeric)
   * [functional function objects and predicates](#functional-function-objects-and-predicates)
5. [Coping](#copying).
6. [Sorting](#sorting).
7. [Searching](#searching).
8. [References](#references).

## Collections

### std::vector

The declaration syntax of std::vector is the same as that of std::array, with the difference that we don't need to specify the array length along with the data type as shown below.

```c++
std::vector array_name;
```

The initialization of an std::vector is also the same as that of std::array. We initialize an std::vector by either of the following ways.

```c++
// this is how you initialize the vector in C++ 11...
std::vector<int> marks = {50, 45, 47, 65, 80};

std::vector<int> marks { {50, 45, 47, 65, 80} };
```

This is how we return a single-element vector and a pointer to the single-element vector:

```c++
return vector<int>() = {-1};
return new vector<int>(){-1};
```

A simple way to return a new vector of 2 (or more elements) is next:

```c++
return {1, 2}; // it's vector<int>
```

This is how you can assign elements in vector declared with new:

```c++
(*v)[5][5] = 777;
```

We can also make multidimensional std::vectors. This is similar to std::array. Let's look at the syntax to make a std::vector.

```c++
std::vector<std::vector<int>> v { {{1,2,3}, {4,5,6}} };
for(int i=0; i< v.size(); i++)
{
    for(int j=0; j< v[i].size(); j++)
    {
        cout << v[i][j] << "\t";
    }
    cout << endl;
}
```

A multidimensional std::vector is also passed to a function in a similar way a 1D vector is passed. Let's look at an example. 

```c++
void f(const std::vector<std::vector<int>> &v);
```

How to copy a vector?

- Calling the copy constructor directly: `vector<int> new_(original);`. This is even simpler than using `std::copy` to walk the entire vector from start to finish to `std::back_insert` them into the new vector.
- Using a `=` operator: `a = b;`. Where `a` and `b` are vectors. We can use the public member function `std::vector::operator=` of the container `std::vector` for assigning values from a vector to another. In fact the approach is passing by value, the compiler calls the copy constructor, and then swapping that newly created element. It is better to call the copy constructor directly to achieve the same effect[3].
- Using the assign operator: `new_vector.assign(old_vector.begin(),old_vector.end()); `. Don't know anything about it. This may be an unnecessary way to copy a vector.

Caution:

- You should not use `std::vector::swap` to copy vectors, it would change the "original" vector.

- Deep or shallow copy? If the elements in the source vector are pointers to other data, then a deep copy is wanted sometimes. A deep copy, meaning that fields are dereferenced: rather than references to objects being copied, new copy objects are created for any referenced objects, and references to these placed in B.


  Actually, there is no currently a built-in way in C++ to do a deep copy. All of the ways mentioned above are <u>shallow</u>. If a deep copy is necessary, you can traverse a vector and make copy of the references manually. Alternatively, an iterator can be considered for traversing.

The most useful methods:

- **size()** - it's an actual size, not a max size (**capacity**).

  >  Vector capacity is always greater than or equal to the vector size.

- **at()** function is used to access the element at specified position (index). Let's see an example.

  ```c++
  vector<int> marks = {50, 45, 47, 65, 80};
  marks.at(2) = 74;
  ```

- The **front()** function returns the first element of a vector.

- **back()** function returns the last element of a vector.

- **empty()** checks whether a vector contains any element or not. It returns **1** if the length of a vector is 0 and **0** if it contains some element. 

- The **push_back()** function adds a new element at the end of the vector (at the end of the last element of the vector), thus increasing the size of the vector by one.

- The **pop_back()** function removes the last element in the vector, thus reducing the size of the vector by one.

- The **reserve(value)** function increases the capacity of the vector if the desired number of elements is greater than the capacity of the vector.

- **insert** inserts a new element in a vector before the element at the specified position. Let's see an example to understand this. 

  ```c++
  vector<int> v = {111,222};
  auto it = v.begin();
  v.insert(it,000);
  // 0 111 222
  ```

- **erase** function removes either a single element or a range of elements from a vector. To remove a single element, we need to pass the iterator pointing to the element in the vector which is to be removed. To remove a range of elements, we need to pass iterators specifying the range which we want to delete. Let's see an example.

  ```c++
  vector<int> v1 = {4, 5, 6, 7, 8};
  vector<int> v2 = {1, 2, 3, 4, 5};
  
  v1.erase(v1.begin()+4);  // removing a single element at position 4
  v2.erase(v2.begin()+1, v2.begin()+3);   // removing range of elements from position 1 till 2
  ```

-  **clear** removes all elements of a vector.

- The **swap** function swaps the contents i.e. it exchanges the value of one vector with that of another. Example: ` v1.swap(v2)`.

### std::list

List don’t support [random-access iterators](https://www.geeksforgeeks.org/random-access-iterators-in-cpp/) (see below the diagram on iterators) including indexing.

### std::map

#### Sort map by value

Easiest answer:

If you want to present the values in a map in sorted order, then copy the values from the map to vector and sort the vector.

---

`std::map` will sort its elements by `keys`. It doesn't care about the `values` when sorting.

You could use *only* `std::sort` if you choose a comparer which compares `values` first, and IF they're equal, sort the `keys`.

```cpp
auto cmp = [](std::pair<K,V> const & a, std::pair<K,V> const & b) 
{ 
     return a.second != b.second ?  
         a.second < b.second : a.first < b.first;
};
std::sort(items.begin(), items.end(), cmp);
```

There is a better approach: store `std::pair<V,K>` instead of `std::pair<K,V>` and then you don't need any comparer at all — the standard comparer for `std::pair` would be enough, as it compares `first` (which is `V`) first then `second` which is `K`:

```cpp
std::vector<std::pair<V,K>> items;
//...
std::sort(items.begin(), items.end());
```

---

You can use `std::set` instead of `std::map`.

You can store both key and value in `std::pair` and the type of container will look like this:

```cpp
std::set< std::pair<V, K> > items;
```

`std::set` will sort it's values both by original keys and values that were stored in `std::map`.

---

You cannot sort a map by its values due to the implementation of the map.

If you want to emit the elements in the map in such a sorted order then you have to first dump the map contents into a vector (say) and sort that vector:

```cpp
template <typename T1, typename T2>
struct less_second {
    typedef pair<T1, T2> type;
    bool operator ()(type const& a, type const& b) const {
        return a.second < b.second;
    }
};

map<string, int> mymap;
// …

vector<pair<string, int> > mapcopy(mymap.begin(), mymap.end());
sort(mapcopy.begin(), mapcopy.end(), less_second<string, int>());
```

Or alternatively, just copy the values from the map, leaving the keys, and sort the resulting vector directly.

---

A demo of how you can do this cleanly:

```cpp
template<typename A, typename B>
std::pair<B,A> flip_pair(const std::pair<A,B> &p)
{
    return std::pair<B,A>(p.second, p.first);
}

template<typename A, typename B>
std::multimap<B,A> flip_map(const std::map<A,B> &src)
{
    std::multimap<B,A> dst;
    std::transform(src.begin(), src.end(), std::inserter(dst, dst.begin()), 
                   flip_pair<A,B>);
    return dst;
}

int main(void)
{
    std::map<int, double> src;

    ...    

    std::multimap<double, int> dst = flip_map(src);
    // dst is now sorted by what used to be the value in src!
}
```

**Generic Associative Source (requires C++11)**

If you're using an alternate to `std::map` for the source associative container (such as `std::unordered_map`), you could code a separate overload, but in the end the action is still the same, so a generalized associative container using variadic templates can be used for *either* mapping construct:

```cpp
// flips an associative container of A,B pairs to B,A pairs
template<typename A, typename B, template<class,class,class...> class M, class... Args>
std::multimap<B,A> flip_map(const M<A,B,Args...> &src)
{
    std::multimap<B,A> dst;
    std::transform(src.begin(), src.end(),
                   std::inserter(dst, dst.begin()),
                   flip_pair<A,B>);
    return dst;
}
```

This will work for both `std::map` and `std::unordered_map` as the source of the flip.

---

Copy out my map (freq below) into a vector of pairs, then sorted the pairs however I wanted.

```cpp
std::vector<std::pair<int, int>> pairs;
for (auto itr = freq.begin(); itr != freq.end(); ++itr)
    pairs.push_back(*itr);

sort(pairs.begin(), pairs.end(), [=](std::pair<int, int>& a, std::pair<int, int>& b)
{
    return a.second < b.second;
}
);
```

#### Swapping keys and values of a map

`std::map` doesn't allow this behavior. However, you might want to use a STL-like container [Boost.Bimap](http://www.boost.org/doc/libs/release/libs/bimap/doc/html/index.html) - bidirectorial map.

> A Bimap is a data structure that represents bidirectional relations between elements of two collections. The container is designed to work as two opposed STL maps. A bimap between a collection X and a collection Y can be viewed as a map from X to Y (this view will be called the left map view) or as a map from Y to X (known as the right map view).

### std::unordered_map

#### Output elements in unordered_map with keys in ascending order

You could copy your elements in a `std::vector` then use `std::sort` to sort this vector according to your preference ascending/descending and then output it:

```cpp
std::unordered_map<int, int> um {{2, 3}, {6, 7}, {0, 5}};
std::vector<std::pair<int, int>> sorted_elements(um.begin(), um.end());
std::sort(sorted_elements.begin(), sorted_elements.end());
```

As for why you can't sort unordered STL containter take a look [here](https://stackoverflow.com/questions/24212356/why-stl-unordered-map-and-unordered-set-cannot-be-sorted-by-stl-algorithms).

---

If you prefer to keep intermediate data in sorted order, use `std::map<key,value>` instead `std::unordered_map`. It will sort on key by default using `std::less<>` so you will get result in ascending order.

`std::unordered_map` is an implementation of hash table data structure, so it will arrange the elements internally according to the hash value using by `std::unordered_map`. But in case `std::map` it is usually a red black binary tree implementation.

### std::set



### std::unordered_set

#### Sort unordered_set

`unordered_set` doesn't have non-const iterators, because if you could mutate the item pointed to by an iterator you could violate the invariants of the set (uniqueness among others). Additionally if you sorted an unordered_set you would no longer be able to look up the item in the container anymore (assuming it works by hash).

If you *really* want to sort the set of items, you'll need to copy it into a `vector` first and then sort that. But in that case have you considered if `unordered_set` is the right container for you in the first place? What about using a normal `set` which *is* ordered at the expense of lookups being slower.

---

```cpp
boost::unordered_set<Foo> a;
a.insert(...);
...

std::set<Foo> b(a.begin(), a.end());

std::set<Foo> c;
std::copy(a.begin(), a.end(), std::inserter(c, c.end());
```

## Algorithms

> From the \<algorithm> module.

### std::min

std::min -  returns the smallest of a and b. If both are equivalent, a is returned.

<details><summary>For comparing elements using <.</summary>
<pre><code>template  constexpr const T& min (const T& a, const T& b);</code>
a and b are the numbers to be compared.
Returns: Smaller of the two values.
</pre></details>

<details><summary>For comparing elements using a pre-defined function.</summary>
<pre><code>template
constexpr const T& min (const T& a, const T& b, Compare comp);</code>
Here, a and b are the numbers to be compared.comp: Binary function that accepts two values of type T as arguments,
and returns a value convertible to bool. The value returned indicates whether the 
element passed as first argument is considered less than the second.
The function shall not modify any of its arguments.
This can either be a function pointer or a function object.
Returns: Smaller of the two values.
<code>
#include <iostream> 
#include <algorithm> 
using namespace std; 
bool comp(int a, int b) 
{ 
    return (a < b); 
} 
int main() 
{ 
    int a = 5; 
    int b = 7; 
    cout << std::min(a, b, comp) << "\n";
    return 0;
}</code></pre>
</details>

<details><summary>For finding the minimum element in a list.</summary> <pre><code>template 
constexpr T min (initializer_list il, Compare comp);</code>
comp is optional and can be skipped.
il: An initializer_list object.
Returns: Smallest of all the values.
<code>cout << std::min({ 1, 2, 3, 4, 5, 0, -1, 7 }, comp) << "\n"; </code></pre></details>
## Iterating

Depending upon the functionality of iterators they can be classified into five categories, as shown in the diagram below with the outer one being the most powerful one and consequently the inner one is the least powerful in terms of functionality.

![](https://media.geeksforgeeks.org/wp-content/uploads/C_Iterator.jpg)

Different containers support different iterators, like vectors support [Random-access iterators](https://www.geeksforgeeks.org/random-access-iterators-in-cpp/), while lists support [bidirectional iterators.](https://www.geeksforgeeks.org/bidirectional-iterators-in-cpp/) The whole list is as given below:

![](https://media.geeksforgeeks.org/wp-content/uploads/C_Iterator_Support.jpg)

**Types of iterators**: Based upon the functionality of the iterators, they can be classified into five major categories:

1. [**Input Iterators**](https://www.geeksforgeeks.org/input-iterators-in-cpp/): They are the weakest of all the iterators and have very limited functionality. They can only be used in a single-pass algorithms, i.e., those algorithms which process the container sequentially, such that no element is accessed more than once.
2. [**Output Iterators**](https://www.geeksforgeeks.org/output-iterators-cpp/): Just like [input iterators](https://www.geeksforgeeks.org/input-iterators-in-cpp/), they are also very limited in their functionality and can only be used in single-pass algorithm, but not for accessing elements, but for being assigned elements.
3. [**Forward Iterator**](https://www.geeksforgeeks.org/forward-iterators-in-cpp/): They are higher in the hierarachy than[ input](https://www.geeksforgeeks.org/input-iterators-in-cpp/) and [output iterators](https://www.geeksforgeeks.org/output-iterators-cpp/), and contain all the features present in these two iterators. But, as the name suggests, they also can only move in a forward direction and that too one step at a time.
4. [**Bidirectional Iterators**](https://www.geeksforgeeks.org/bidirectional-iterators-in-cpp/): They have all the features of[ forward iterators](https://www.geeksforgeeks.org/forward-iterators-in-cpp/) along with the fact that they overcome the drawback of [forward iterators](https://www.geeksforgeeks.org/forward-iterators-in-cpp/), as they can move in both the directions, that is why their name is bidirectional.
5. [**Random-Access Iterators**](https://www.geeksforgeeks.org/random-access-iterators-in-cpp/): They are the most powerful iterators. They are not limited to moving sequentially, as their name suggests, they can randomly access any element inside the container. They are the ones whose functionality are same as pointers.

The following diagram shows the difference in their functionality with respect to various operations that they can perform.

![](https://media.geeksforgeeks.org/wp-content/uploads/iteratorOperation.jpg)

## Useful classes and modules

### stdexcept

Unlike Java, C++ does not have a "standard framework" but only a small (and optional) standard library. Moreover, there are different opinions under C++ programmers whether to use exceptions *at all*.

Therefore you will find different recommendations by different people: Some like to use exception types from the standard library, some libraries (e.g. Poco) use a custom exception hierarchy (derived from std::exception), and others don't use exceptions at all (e.g. Qt).

If you want to stick to the standard library, there exists a specialized exception type: `invalid_argument` (extends `logic_error`).

```c++
#include <stdexcept>

// ...
throw std::invalid_argument("...");
```

For the reference: Here is an overview of standard exception types defined (and documented) in `stdexcept`:

```
exception
    logic_error
        domain_error
        invalid_argument
        length_error
        out_of_range
    runtime_error
        range_error
        overflow_error
        underflow_error
```

### numeric

There are two interesting functions from this module:

- `accumulate(first, last, sum)` returns the sum of all the values lying in a range between **[first, last)** with the variable `sum` (initial value of the sum). Use:

  ```c++
  int sum = accumulate(v.begin(), v.end(), 0);
  ```

- `partial_sum(first, last, b)` function assigns partial sum of the corresponding elements of an array to every position of the second array.It returns the partial sum of all the set of values lying between **[first, last)** and stores it in another array b. For example, if x represents an element in **[first, last)** and y represents an element in result, the ys can be calculated as:

  ```
  y0 = x0 
  y1 = x0 + x1 
  y2 = x0 + x1 + x2 
  y3 = x0 + x1 + x2 + x3 
  y4 = x0 + x1 + x2 + x3 + x4
  ...........................
  y_{n-1} = x0 + x1 + x2 + x3 + x4 + .... + x_{n-1}
  ```

  Use:

  ```c++
  partial_sum(v.begin(), v.begin()+n, partial_sums_arr.begin());
  ```

Plus, there are two variations of these functions with the fourth parameter where you can pass the function. This function can apply an additional operation on parameters.

### functional, function objects and predicates

#### Predicates and how to use them

Predicates in C++ are function objects (functors) which return boolean value.

We usually use them in algorithms to describe conditions they need to keep.

**Example "Migrating birds" (HackerRank)**

In this example I sort a vector collection which consists of pointers to `bird_type` struct:

```C++
template<class T> struct bird_type
{
	T type_number;
	T sights;
};
```

Sorting should depend upon `sights` field. So, we compare two of those properties each time. If they are equal then we should compare corresponding `type_number` fields and choose the smallest `type_number` value. We could achieve this goal via Predicates. To set up them we need to create a structure (or maybe class?) which will inherits `binary_function` class from `<functional>` module. And then we need to overload operator '()' with two formal parameters because we set up 'binary function'. We can do this in the following way:

```C++
template <class T> struct bird_type_less
	: public binary_function<T, T, bool>
{
	bool operator()(const T& x, const T& y) const
	{
		return x->sights < y->sights
			|| x->sights == y->sights && x->type_number > y->type_number;
	}
};
```

Then we can use Predicate (our structure with overloaded operator ()) in algorithms function. That's how we use our predicate in sort function to sort vector of `bird_type<int>*` elements:

```C++
// Complete the migratoryBirds function below.
int migratoryBirds(vector<int> arr) 
{	
	/* ... */

	vector<bird_type<int>*> v(number_of_types);
	for (int i = 0; i < number_of_types; i++)
		v[i] = new bird_type<int>{i + 1, 0};
	
	/* ... */
 	
 	sort(v.begin(), v.end(), bird_type_less<bird_type<int>*>());
	
```

Problems with solution:

1. Somehow I can't divide this program into modules. I have a Linkage error.

TODO: figure out how to solve problem.

## Copying



## Sorting

We can sort containers and arrays using `sort` function, which takes an iterators on the beginning and the end, and a comparator if we need it. I have already gave an example on how to use a comparator with sort function, but let's give another example.

**Example "Luck Balance" (HackerRank)**

We need to sort a two dimensional vector `vv` by the second parameter in ascending order and by the first parameter in decreasing order when the two second parameters are equal. 

This is a typical situation when predicates come in handy. We create a structure which inherits [binary_function](http://www.cplusplus.com/reference/functional/binary_function/) base class and has method which returns bool. 

```c++
template <class T> struct comp_luck_and_importance
    : public binary_function<T, T, bool> {
    bool operator()(const T& x, const T& y) const {
        return x[1] < y[1] || x[1] == y[1] && x[0] > y[0];
    }
};
```

After that, we need to pass the comparator as the third parameter to the sort function in the following way:

```c++
// Complete the luckBalance function below.
int luckBalance(int k, vector<vector<int>> contests) {
    vector<vector<int>> vv = contests;
    sort(vv.begin(), vv.end(), comp_luck_and_importance<vector<int>>());
 	// ... processing
}
```

## Searching

TODO: find(v.begin(), v.end(), key)

## References

1. https://www.codesdope.com/cpp-stdvector/
2. https://stackoverflow.com/questions/19842035/how-can-i-sort-a-stdmap-first-by-value-then-by-key
3. https://stackoverflow.com/questions/2453425/how-can-i-sort-a-map-by-its-second-parameter
4. https://stackoverflow.com/questions/5056645/sorting-stdmap-using-value
5. https://stackoverflow.com/questions/7868217/swapping-keys-and-values-of-a-map-in-c
6. https://stackoverflow.com/questions/30946544/how-to-output-elements-in-unordered-map-with-keys-in-ascending-order
7. https://stackoverflow.com/questions/5957421/cant-sort-unordered-set
8. https://www.geeksforgeeks.org/stdmin-in-cpp/ 
9. https://www.geeksforgeeks.org/introduction-iterators-c/
10. https://stackoverflow.com/questions/644673/is-it-more-efficient-to-copy-a-vector-by-reserving-and-copying-or-by-creating-a?answertab=votes#tab-top
11. https://stackoverflow.com/questions/681772/equivalent-of-illegalargumentexception-of-java-in-c#answer-681799 

