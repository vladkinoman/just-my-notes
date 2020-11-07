# Terms and phrases of Java that are fundamental and difficult to learn

> A lot was taken from Coursera Algorithms: Part 1 and Algorithms by Sedgwick and Wayne.

## Table of Contents

- [Structure of a Java program](#Structure-of-a-Java-program)
- [Data abstraction](#Data-abstraction)
- [Inheritance](#Inheritance)
- [References](#References)

## Structure of a Java program

- primitive data types  (integers, real numbers, booleans, characters) and expressions (a literal, a variable, or a sequence of operations on literals and/or variables that produces a value).
- statements (ru: операторы, инструкции) are declarations, assignments, initializing declarations, implicit assignments (e.g. i++), conditionals, loops, break and continue, for notation, single statement blocks.  
- arrays

  > **Is an array a primitive type or an object in Java?**
  >
  > An **[array in Java](https://www.geeksforgeeks.org/arrays-in-java/) is an object**.
  >
  > - In Java, there is a class for every array type, so there’s a class for int[] and similarly for float, double etc.
  >
  > - The direct superclass of an array type is **Object**. Every array type implements the interfaces Cloneable and java.io.Serializable.
  > - In the Java programming language, arrays are objects (§[4.3.1](http://docs.oracle.com/javase/specs/jls/se7/html/jls-4.html#jls-4.3.1)), are dynamically created, and may be assigned to variables of type Object (§4.3.2). All methods of class Object may be invoked on an array.
  >
  > For every array type corresponding classes are available and these classes are the part of java language and not available to the programmer level. To know the class of any array, we can go with the following approach:
  >
  > ```java
  >  int[] x = new int[3]; 
  >  System.out.println(x.getClass().getName());
  > ```
  >
  > What we got:
  >
  > ```bash
  > [I
  > ```
  >
  > **[I** this is the class for this array, one **[** (square bracket) because it is one dimensional and **I** for integer data type.
- static methods allow us to encapsulate and reuse code and develop programs as a set of independent modules. A *method* encapsulates a computation that is defined as a sequence of statements. 

  > A class with static methods cannot have instances. 
- strings
- input/output is the interaction between the programs and the outside world.
- abstract data types (ADTs). Data abstraction expands <u>encapsulation</u> and <u>code reuse</u>, which allows to define non-primitive types by supporting OOP.
- APIs. To specify the behavior of an abstract data type, we use an *application programming interface* (API), which is a list of *constructors* and *instance methods* (operations), with an informal description of the effect of each,

## Data abstraction

Abstract data type is the type of data whose representation is hidden from the client. Think of ADT as an abstract concept (do not confuse it with an abstract class in Java), which represents some data model, the structure of which defines only the basic characteristics of data and operations that can be performed on them. For example, Interfaces `List`, `Map`, etc. That is, for the client, good examples can literally be the interfaces, with what data they work and the operations available on these data.

ADT implementations can be data type definition or library of static methods (functions). Therefore it is worth to distinguish between an instance method and a static method. The method encapsulates a calculation which is defined as a sequence of operators.

Implementation of ADT in the form of a Java class (data type definition) is practically building a library of static methods, taking into account that we link data with the implementation of functions and hide the presentation of data from the client. Creating an ATD involves understanding and development of the API.

> From all the above it follows that the definition of a <u>data type is</u> an implementation in the form of <u>a class that can have objects</u>, and these <u>objects can contain values of this data type</u> :)

The API is a way to document or describe ADT behavior. The API separates the client from the implementation: the client knows nothing about the implementation and the implementation does not take into account the client's specifics.

## Encapsulation and module programming

Encapsulation is a way to place Data Types within their implementations in a programming language and separate implementations of clients and Data Types. Encapsulation isolates operations on DT.

Encapsulation makes modular programming possible:

- enables independent development of the client code and the implementation code.
- allows you to substitute improved implementations without affecting the client code.
- allows you to support programs that have not yet been written.

Modular programming is a method or way of thinking that applies to programs and is to break down large software into small and independent modules.

Static method libraries enable modular programming, where we create static method libraries (modules) and static method in one library can call static methods defined in other libraries. This allows us:

- Work with modules of reasonable size, even in a program involving a large amount of code
- Distribute and reuse the code without having to implement it again.
- Easily replace improved implementations.
- Develop suitable abstract models to solve programming problems.
- Localize debugging (unit testing)

## Inheritance

*Fragile base class problem* is the fundamental problem of OOP. It consists in the fact that derived classes are highly dependent on the base class, and when the latter's implementation changes, errors may occur in its inheritors.

## References

1. https://algs4.cs.princeton.edu/11model/
2. https://www.geeksforgeeks.org/array-primitive-type-object-java/?ref=lbp
3. http://docs.oracle.com/javase/specs/jls/se7/html/jls-4.html#jls-4.3.1
4. https://algs4.cs.princeton.edu/12oop/