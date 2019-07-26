# How to become a good developer

> Information was gathered from different answers of Quora. See main Sources below.

## Develop main fundamental skills

  - [x] English.
  - [ ] Choose your field (controversial, TODO: narrow down the information and add all known fields):
  - ~~"near the metal", a.k.a. hardware programming.~~ <details><summary>Details:</summary>These are the people who program non-smart phones and device drivers.  They dovetail with mechanical and electrical/computer engineering.  They think in terms of voltages and 1's and 0's and clocks and caches and "fan out."  These types tend to code in C or assembly, languages which give you a huge amount of control over individual bits and operations, but require you to do everything yourself.</details>
  - "system programmers"- desktop software, operating systems.  I'll also include smart phone developers here. <details><summary>Details:</summary> You see people programming in C++ and C# (esp. Windows), Objective-C and Cocoa (almost exclusively Mac and IOS); and Java (Android).  Sometimes you're coding stuff people can see, like GUIs - buttons and forms, choose a file, Word Processors, etc.  Most of the time you're coding functional logic, the "engine" that nobody sees until something goes wrong and an opaque "Error 123302" pops up.  Sorting numbers, moving data in and out of various abstractions (trees, lists, objects, queues, "boxing and unboxing").  You can often think in terms of a single computer, though depending on need and interest you may also work on massively parallel server farms as well.</details>
  - "web programmers" - these guys tend to write the so called "frontends" and "backends" for websites. <details><summary>Details:</summary>These guys are very often on a Linux or Unix terminal, and code in languages like Perl, PHP, Python, Ruby, Asp, Cold Fusion: languages which make it very quick to write something that works, but without giving you a lot of control over specifics.  They spend a lot of time moving data between computers; user's computer to the front end server; front end server to the back end server; back end server to the database; reverse all that; call over to twitter or Facebook's servers to get a picture or log someone in/out; etc.  They should have at least some rudimentary control of SQL for talking to databases; and may be expected to be able to administrate their own servers (security, users/passwords, install new motherboards, etc.).  Web programmers will also be expected to be conversant in the web display methods and means: HTML, CSS, and JavaScript; flash (or these days WebGL); visual design.  They may be able to do one or more of these things competently; if not, they better know how to at least work with designers who are.</details>
- [x] Programming Language:
  - choose language, stick to it.
  - develop programs with your favorite PL using popular framework.
  - once you got into a comfort zone learn new programming languages. Why you need this:
    - Each programming language build different mental tools. So learning them would make learning abstractions easier. <details><summary>For example:</summary>
      - [x] C => structured programming
      - [x] C++ => generic programming & OO:  which is used for writing most packaged software.
      - [x] Java => object-oriented programming
      - [ ] C#  => delegates, LINQ objects
      - [ ] JavaScript => closure, callbacks,
      - [ ] Erlang => threading, fault tolerance.
      - [ ] Python => list comprehensions, generators (lazy)
      - [x] Matlab => numeric calculations
      - [ ] Haskell => functional programming, monads.
      - [x] OCaml => pattern matching
      - [ ] Common Lisp => lambdas, macros, reader macros,  building dsl etc.
      - [ ] Scheme => Continuations, CPS, etc..
      So learning those languages makes thinking in those concepts easy and possible.</details>
      - Also learning a second language will help you solve problems faster and more efficiently as you will have more choices.
      - It will also help you learn the ins and outs of programming as you see the similarities and differences between languages.
      - Learning new programming languages helps you read and understand documentation faster.
      - By learning other languages, you don’t just add more tools (could be abstraction tools) to your tool belt (or toolbox whatever), you also improve your ability to quickly add more tools in the future!
  - [ ] Debug skills ([wiki](https://en.wikipedia.org/wiki/Debugging)). Debugging will show how the user uses software, how the code is structured, and then where the problem is. Understanding how the software is built makes adding new features to the software a faster process. Debugging will show comparisons of bad code and good code since you will turn the former into the latter. Recognizing bad code that causes bugs will help you write software without bugs when you build new features and other software. Debugging is the best way to learn to write reliable software.
  - [ ] Test writing skills (test-driven development), write extensive unit tests. When you have guiding tests before you have code, you are no longer guessing solutions, you have a way to immediately verify them.
  - [ ] Pick an environment / platforms / frameworks
  - [ ] Master Algorithms and Data Structures
  - [ ] Learn Design Patterns. Put focus on reading and writing design documents.

## Practice logical thinking and analysis (develop problem solver skills)

- [ ] Solve programming challenges (TopCoder, ProjectEuler, UVA, LeetCode, HackerRank, Exercism.io)
  - [x] easy
  - [ ] medium
  - [ ] hard
- [ ] Regularly participate in programming competitions. Popular platforms include HackerRank and TopCoder. They would cement your algorithmic thinking.
- [x] Solve interesting puzzles
- [x] Play puzzle and strategy games

## Build Projects From Scratch

- [ ] Find an experience developer who will be your mentor.

- [ ] Build project based on the core functionality of known projects. <details><summary>For example:</summary>you can write down the essential functionality of Twitter: user login, passwords, posting messages, deleting messages, storing messages and users in a database. Also list out the none essential functionality that you might want to build for your own curiosity: profile pictures, comments, followers. Then go ahead and start coding. The goal with the first project is to learn to write software without guidance from senior developers or from a class homework assignment.</details>

- [ ] Show project to your mentor. He will give you a feedback on code style, code structure, and design. Take that feedback and implement it by rewriting your software. You will see how much you’ve improved during this process.

- [ ] Pick to build something less well defined. <details><summary>For example:</summary>you can build a task list application without basing it on any existing task list apps. The reason for not picking something that already exists is that it forces you to *make* the design decisions. In the Twitter example, all the needed features were easily understood, now it is up to you to *plan accordingly*: an important skill for a senior developer.

- [ ] Again, once you complete this project, get feedback from an experienced developer and implement that feedback.

## Software / tools you should learn

> Note: it is really cool when you don't touch mouse at all.

- [x] Task management software (Jira, Trello)
- [ ] Git
- [x] File Manager:
  - [x] Far - Windows
  - [ ] Ranger - Linux (Ubuntu 18.04)
- [x] Terminal Editor / Text Editor /
  - [x] Sublime Text
  - [ ] Visual Studio Code
  - [ ] Vim
- [ ] IDE, configure linters and plugins in your IDE
  - [ ] Visual Studio 2019
  - [ ] IntelliJ IDEA
  - [ ] Eclipse (in Android development)
- [ ] PlantUML
- [ ] A diff'ing tool to see changes in a large text base
- [ ] A profiler to find things you can speed up or slim down in your code
- [ ] A good hexeditor (?) at hand

## Develop communication skills

Good communication skills directly correlate with good development skills. The ability to communicate is crucial for understanding problems clearly, being able to break them down into hypotheses and propose solutions in a coherent manner. You should be able to learn concepts quickly. This is a skill that improves through practice but you can develop them partially in these ways:

- [ ] Attend meetings with senior developers
- [ ] Work on projects in the main revenue generating department of your company
- [ ] Try to teach a beginner how to code
- [ ] Visit Hackatons
- [ ] Contribute to open source projects on GitHub. You could start off by documenting code, writing tutorials and finding and resolving bugs. Reading a large codebase would give you some perspective on how things work in the real world.
- [ ] Offer teammates help
- [ ] Help others by contributing on platforms like StackOverflow, Reddit. You'll actually be helping yourself  by reading and debugging someone else's code  and learning a lot of subtle things in the process.

## Additional advice

- Drink Coffee. Coffee is your best friend on a long day :coffee:
- Buy good headphones so that no one will distract you :headphones:
- Have a positive attitude :) A good way to keep a positive attitude is to work on projects that are interesting to you. It sounds obvious, but many people will agree to roles they have no interest in. *Playing it safe won’t make you a great developer!*
- Foster deep knowledge: carefully select the technologies you want to work with. Aim to become an expert in a couple - but competent with many.
- Don’t hesitate to learn new technologies (keep up to date with new technologies). Get out of your comfort zone. There is no point in being an expert in dates tech. That’s how you survive in the software industry.
- Improve learning ability. Every programmer will experience a situation where they don't know an answer. The great programmers will work to find that answer. They will look at different resources, talk to the right people and find the solution no matter what. *Great developers have mastered the skill of self-learning.*
- Read code from best programmers:
  - Peter Norvig => python, common lisp
  - Edi Weitz , Robert Smith => common lisp.
  - Andrei Alexandrescu => C++
  - Linus Torvalds => C
- Keep on writing, try to optimize everything (your work, surfing, etc.) with your scripts
- Play with your code, push the limit by improving your code, optimize it, try to run program on big values. You will learn a lot.
- Be a Team Player. Great developers help other developers improve. They offer teammates help when they are stuck, teach new skills to others and write documentation that would help teammates not only in their organization but the developer community in general.
- Expertise is overrated: as much as specific skill expertise is important, it shouldn’t be the single factor you focus on. *A great (insert any skill here) developer is not necessarily a great developer.* It’s the addition of the soft skills above that make them great.

> ru: например, web developer (его hard skill - web) - это лишь добавление к мягким навыкам сверху, которое делает их (soft skills) отличными. Отсюда выходит мое предположение: soft skills - основы, на которых строятся hard skills.

> The ability to learn quickly and jump into a project seamlessly, to help others out, to always have a great attitude. These are the skills that make you invaluable to a business.

- Programming needs to be a habit in your life in order to get really good with it. Also it is very important to сode in a team. So, the best advice consists of two things:
  - Write Code Every Day
  - Hang out with other people who code :handshake:

## Sources

1. [Theoretical answer - best answer](https://www.quora.com/What-advice-can-you-give-to-new-programmers/answer/Christian-Jean-3/)
2. [Theoretical-Practical answer](https://www.quora.com/How-can-I-be-a-good-developer/answer/Gopi-Vajravelu)
3. [Simple practical answer](https://www.quora.com/How-do-I-become-a-computer-programmer/answer/Samer-Buna/)
4. [Many of the best programmers share similar characteristics (he doesn't write how to develop those characteristics)](https://www.quora.com/How-can-I-become-a-good-programmer-after-only-one-year/answer/Damien-Filiatrault/)
