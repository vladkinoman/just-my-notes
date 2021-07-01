# Map in C

> [Source](https://stackoverflow.com/questions/21958247/map-like-structure-in-c-use-int-and-struct-to-determine-a-value).

You'll probably have to make your own structure. *The C Programming Language by Kernighan and Ritchie* has an example of making an associate map in c, and what I'll detail below is based on what I remember from that.

Basically you'll need a struct **Map** that contains struct **Key** and struct **Value**.

```c
struct Map {
    struct Key key;
    struct Value value;
};
```

struct **Key** contains elements that determine the value (in your case 2 points and 2 ints)

```c
struct Key {
    struct point p1;
    struct point p2;
    int i;
    int j;
};
```

struct **Value** is whatever you want your key to point to (you didn't say)

You now have a struct **Map** that associates your four inputs with a value, but a single map isn't that useful. You're going to want a whole array of them.

```c
struct Map map[SIZE_OF_MAP];
```

If you don't want to linearly search the array for the **Map** struct you're looking for, you can make a hashing function that will bring you directly to it. Just define a function that takes the key and uses its value to assign it an index in the array. Use the hash to place the **Map** in the array and retrieve it from the array. (Note: I'm unsure if this is a correct example of hashing, please correct if this is completely wrong)

```c
int get_hash(Key *key)
{
    int result;
    /* combine all inputs in some way */
    result = key->i * key->i + (key->p1.x * key->p1.x) - (key->p2.x * key->p2.x)
    /* make sure result isn't out of bounds of the array */
    return (result % SIZE_OF_MAP);
}
```

If you use the hashing function you'll have to consider collisions (what happens when two keys give the same result for **get_hash**). When you use your array of Maps you'll need some form of collision resolution.