# Predicates and how to use them

Predicates in C++ are function objects (functors) which return boolean value.

We usually use them in algorithms to describe conditions they need to keep.

## Example "Migrating birds" (HackerRank)

### Problem Description

You have been asked to help study the population of birds migrating across the continent. Each type of bird you are interested in will be identified by an integer value. Each time a particular kind of bird is spotted, its id number will be added to your array of sightings. You would like to be able to find out which type of bird is most common given a list of sightings. Your task is to print the type number of that bird and if two or more types of birds are equally common, choose the type with the smallest ID number.

### Solution

In this example I sort a vector collection which consists of pointers to `bird_type` struct:

```
template<class T> struct bird_type
{
	T type_number;
	T sights;
};
```

Sorting should depend upon `sights` field. So, we compare two of those properties each time. If they are equal then we should compare corresponding `type_number` fields and choose the smallest `type_number` value. We could achieve this goal via Predicates. To set up them we need to create a structure (or maybe class?) which will inherits `binary_function` class from `<functional>` module. And then we need to overload operator '()' with two formal parameters because we set up 'binary function'. We can do this in the following way:

```
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

```
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

#### Problems with solution

Problems:

1. Somehow I can't divide this program into modules. I have a Linkage error.
2. I have signed/unsigned warnings about `i` counter and `number_of_types` variable. 

TODO: figure out how to solve problems.