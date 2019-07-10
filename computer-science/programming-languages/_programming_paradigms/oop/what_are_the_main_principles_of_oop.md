# What are the main principles of OOP?

#### 4 principles: Abstraction, Encapsulation, Inheritance, Polymorphism

Abstraction is a process where you show only “relevant” data and “hide” unnecessary details of an object from the user.

Encapsulation is the process of combining data and functions into a single unit called class

Inheritance enables you to create new classes that re-use, extend and modify the behaviour that is defined in other classes

Polymorphism is the ability to present the same interface for differing underlying forms (data types).

> Polymorphism describes a pattern in object oriented programming in which classes have different functionality while sharing a common interface.

> Both *overriding* and *overloading* are used to achieve polymorphism (some people say that they are not a polymorphism, others say that they are cases of poly, others say that overloading is a case of poly).

#### 3 principles: encapsulation, inheritance, polymorphism

There are 3 requirements for a language to be object-oriented:
- a language that supports only encapsulation (objects) is not object-oriented, but it is modular
- a language that supports just encapsulation (objects) and message-passing (polymorphism) is not object-oriented, but it is object-based
- a language that supports encapsulation (objects), message-passing (polymorphism), and inheritance (abstraction), is object-oriented

> NOTE: message-passing enables polymorphism.

> NOTE: Abstraction is a much more general concept; encapsulation et al are kinds of abstraction, just as a subroutine is a kind of abstraction. See [Abstraction](https://en.wikipedia.org/wiki/Abstraction_%28computer_science%29)


 
# Best way to explain OOP Principles during an interview? 

via [StackOverflow](https://stackoverflow.com/questions/23130282/best-way-to-explain-oop-principles)

##### Abstraction

Show only necessary thing to user that he required, not extra information (use public, private, protected - can't agree with this). Abstraction is done when we need to inherit from certain class but do not instantiate the objects of that class.

##### Encapsulation

Group all relevant things together. I.e. encapsulation is wrapping/binding up of data and member functions in single unit. In simple, abstraction is hiding the implementation and encapsulation is to hide data.

> NOTE: actually public, private and protected modifiers relate more to encapsulation than abstraction

##### Inheritance

If something already exist, why should I recreate it (same as re-inventing a wheel). Use inheritance to inherit all things of that class into your class. Inheritance enables you to create new classes that re-use, extend and modify the behaviour that is defined in other classes.

##### Polymorphism

When an object exhibits different behavior in different situation. In simple way, when a message can be processed in different ways/forms.

# Other answers
here at [LeetCode](https://leetcode.com/discuss/interview-question/object-oriented-design/125189/What-are-the-main-features-of-OOP/277913)