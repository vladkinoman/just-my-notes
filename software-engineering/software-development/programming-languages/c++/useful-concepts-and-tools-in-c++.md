# Useful concepts and tools in C++

## Table of Contents

1. [Collections](#collections)
   * [std:vector](#stdvector).
2. [Algorithms](#algorithms).
   * [std::min](#stdmin)
3. [Useful classes and modules](#useful-classes-and-modules).
   * [stdexcept](#stdexcept).
4. [Coping](#copying).
5. [Sorting](#sorting).
6. [Searching](#searching).
7. [References](#references).

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

## Copying



## Sorting

#### 

## Searching





## References

https://www.codesdope.com/cpp-stdvector/

https://www.geeksforgeeks.org/stdmin-in-cpp/ 

https://stackoverflow.com/questions/681772/equivalent-of-illegalargumentexception-of-java-in-c#answer-681799 
