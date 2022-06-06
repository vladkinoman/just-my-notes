# Smart pointers

> [Source](https://stackoverflow.com/questions/106508/what-is-a-smart-pointer-and-when-should-i-use-one?rq=1).
>
> Two excellent articles on the subject: - [Smart Pointers - What, Why, Which?](http://ootips.org/yonat/4dev/smart-pointers.html) - [Guru of the Week #25](http://www.gotw.ca/gotw/025.htm) 

Since C++11, the standard library has provided sufficient smart pointers types, and so you should favour the use of [`std::unique_ptr`](http://en.cppreference.com/w/cpp/memory/unique_ptr), [`std::shared_ptr`](http://en.cppreference.com/w/cpp/memory/shared_ptr) and [`std::weak_ptr`](http://en.cppreference.com/w/cpp/memory/weak_ptr).

There was also [`std::auto_ptr`](http://en.cppreference.com/w/cpp/memory/auto_ptr). It was very much like a scoped pointer, except that it also had the "special" dangerous ability to be copied — which also unexpectedly transfers ownership.
**It was deprecated in C++11 and removed in C++17**, so you shouldn't use it.

```cpp
std::auto_ptr<MyObject> p1 (new MyObject());
std::auto_ptr<MyObject> p2 = p1; // Copy and transfer ownership. 
                                 // p1 gets set to empty!
p2->DoSomething(); // Works.
p1->DoSomething(); // Oh oh. Hopefully raises some NULL pointer exception.
```

---

Here's a simple answer for these days of modern C++ (C++11 and later):

- **"What is a smart pointer?"**
  It's a type whose values can be used like pointers, but which provides the additional feature of automatic memory management: When a smart pointer is no longer in use, the memory it points to is deallocated (see also [the more detailed definition on Wikipedia](http://en.wikipedia.org/wiki/Smart_pointer)).
- **"When should I use one?"**
  In code which involves tracking the ownership of a piece of memory, allocating or de-allocating; the smart pointer often saves you the need to do these things explicitly.
- "But which smart pointer should I use in which of those cases?"
  - Use [`std::unique_ptr`](http://en.cppreference.com/w/cpp/memory/unique_ptr) when you want your object to live just as long as a single owning reference to it lives. For example, use it for a pointer to memory which gets allocated on entering some scope and de-allocated on exiting the scope.
  - Use [`std::shared_ptr`](http://en.cppreference.com/w/cpp/memory/shared_ptr) when you do want to refer to your object from multiple places - and do not want your object to be de-allocated until all these references are themselves gone.
  - Use [`std::weak_ptr`](http://en.cppreference.com/w/cpp/memory/weak_ptr) when you do want to refer to your object from multiple places - for those references for which it's ok to ignore and deallocate (so they'll just note the object is gone when you try to dereference).
  - Don't use the `boost::` smart pointers or `std::auto_ptr` except in special cases which you can read up on if you must.
- **"Hey, I didn't ask which one to use!"**
  Ah, but you really wanted to, admit it.
- **"So when should I use regular pointers then?"**
  Mostly in code that is oblivious to memory ownership. This would typically be in functions which get a pointer from someplace else and do not allocate nor de-allocate, and do not store a copy of the pointer which outlasts their execution.

> It is worth noting that while smart (owning) pointers help with proper memory management, raw (non-owning) pointers are still useful for other organizational purposes in data structures. Herb Sutter gave a great presentation upon this matter at CppCon 2016, that you can see on YouTube: [Leak-Freedom in C++... By Default.](https://youtu.be/JfmTagWcqoE)

---

A [smart pointer](http://en.wikipedia.org/wiki/Smart_pointer) is a pointer-like type with some additional functionality, e.g. automatic memory deallocation, reference counting etc.

A small intro is available on the page [Smart Pointers - What, Why, Which?](http://ootips.org/yonat/4dev/smart-pointers.html).

One of the simple smart-pointer types is [`std::auto_ptr`](http://en.cppreference.com/w/cpp/memory/auto_ptr) (chapter 20.4.5 of C++ standard), which allows one to deallocate memory automatically when it out of scope and which is more robust than simple pointer usage when exceptions are thrown, although less flexible.

Another convenient type is [`boost::shared_ptr`](http://www.boost.org/doc/libs/1_36_0/libs/smart_ptr/shared_ptr.htm) which implements reference counting and automatically deallocates memory when no references to the object remains. This helps avoiding memory leaks and is easy to use to implement [RAII](http://en.wikipedia.org/wiki/Resource_Acquisition_Is_Initialization).

The subject is covered in depth in book ["C++ Templates: The Complete Guide" by David Vandevoorde, Nicolai M. Josuttis](https://rads.stackoverflow.com/amzn/click/com/0201734842), chapter Chapter 20. Smart Pointers. Some topics covered:

- Protecting Against Exceptions
- Holders, (note, [std::auto_ptr](http://en.cppreference.com/w/cpp/memory/auto_ptr) is implementation of such type of smart pointer)
- [Resource Acquisition Is Initialization](http://en.wikipedia.org/wiki/Resource_acquisition_is_initialization) (This is frequently used for exception-safe resource management in C++)
- Holder Limitations
- [Reference Counting](http://en.wikipedia.org/wiki/Reference_counting)
- Concurrent Counter Access
- Destruction and Deallocation

> Warning `std::auto_ptr` is deprecated and highly discourage as you can accidentally transfer ownership. -- C++11 removes the need of Boost, use: `std::unique_ptr`, `std::shared_ptr` and `std::weak_ptr`

---

I prefer a simpler definition though, just to keep my life simple: A smart pointer is simply a class that overloads the `->` and `*` operators. Which means that your object semantically looks like a pointer but you can make it do way cooler things, including reference counting, automatic destruction etc. `shared_ptr` and `auto_ptr` are sufficient in most cases, but come along with their own set of small idiosyncrasies.