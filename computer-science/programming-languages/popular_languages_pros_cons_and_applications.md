# Популярные языки программирования. Их особенности, плюсы и минусы, а так же применение 

## Java

<details>
<summary><b>Особенности</b></summary>

Разработка на Java очень долгая и дорогая. Его используют в основном для больших проектов со специфическими требованиями.

C# — аналог Java, также используют для больших проектов, часть в сфере FinTech.

Язык имеет очень хорошую и завидную экосистему, что все языки хотят её эксплуатировать: Armed Bear Common Lisp, Bigloo, Clojure, Gosu, Groovy, JRuby, Jython, Kawa, Kotlin, NetLogo, Rakudo Perl 6, Renjin, Rhino, Scala. Примечательно, что на Python языки не хотят основывать свои системы.

Он статически типизирован, что делает его более мощным для обслуживания и масштабируемости.

JVM медленный, но исполняется всё равно гораздо быстрее того же Python. 

Java не покалечена GIL-ом для параллелизма в отличии от Python.

</details>

<details>
<summary><b>Плюсы</b></summary>

TODO:

</details>

<details>
<summary><b>Минусы</b></summary>

TODO:

</details>

<details>
<summary><b>Причины выбрать</b></summary>

Причины:
1. Java остается самым популярным языком
2. Java - отличный язык для разработки enterprise applications. Java предоставляет стиль ООП разработки (+ поддержка паттернов) и позволяет настраивать приложение многими разработчиками и поддерживать его много лет.
3. Хорошая экосистема библиотек. Имеет массив опен соусных и коммерческих библиотек и фреймворков. Java поддерживает Spring и Hibernate. Имея опыт работы с этими фреймворками, можно будет без труда переключиться на Scala на бэк-енде. 
4. Производительность - JIT компилируемый код на современных JVM работает близко к оптимизированному нативному коду
5. Крупная корпоративная поддержка - Java - это стратегическая платформа, поддерживаемая многими мировыми огромными и многими важными технологическими компаниями и организация - Гугл, АйБиЭм, Оракл и тд. Ни у одного языка/платформы, нету такой богатой поддержки.
6. Android
7. Портабилити - компилируется в платформенно-независимый байт-код (похоже на genuine cross-platform programming environment)
8. Отличные инструменты - очень много бесплатных хороших IDE: Netbeans, Eclipse, IntelliJ Idea.
9. Java это Open Source – OpenJDK
10. Java это не только язык, но еще и платформа. Есть много перспективных языков на JVM - Clojure и Scala. Прогноз: Java будет получать небольшие усовершенствования в виде функций (JDK 7, 8..), пока эти языки виртуальной машины будут развиваться. Но они всё-таки часть платформы Java.

</details>

<details>
<summary><b>Известные применения</b></summary>

TODO:

</details>


## Python

<details>
<summary><b>Особенности</b></summary>

Python — многоцелевой многофункциональный мультипарадигменный язык программирования, разработка на нем быстрая и качественная. Используют его для средних и больших проектов. Программистов найти проблематично, и стоят они не дешево (уже не так?). По этой причине Python используется в основном как "клеевой" язык для интеграции C/Fortran компонентов.

</details>

<details>
<summary><b>Плюсы</b></summary>

1. Качество ПО - удобочитаемость, ясность (Python обладает своей философией (import this). Обладает парадигмами модульности, ООП)
2. Высокая скорость разработки -простой синтаксис, динамическая типизация, отсутствие компиляции, встроенные инструментальные средства (ускоряют процесс разработки), маленький объем кода.
3. Кроссплатформенный код -program portability
4. Библиотеки поддержки - стандартная библиотека (например, NumPy может заменять в некоторых аспектах MatLab)
5. Интеграция компонентов - сценарии могут легко взаимодействовать с другими частями приложения благодаря различным механизмам интеграции. 
Пример: 
   - Python может вызывать функции из библиотек C/C++ 
   - интегрироваться с компонентами Java
   - может выполнять обмен данными через последовательный порт или по сети с помощью протоколов (SOAP, XML-RPC, CORBA)
6.	Удовольствие :)

</details>

<details>
<summary><b>Минусы</b></summary>

Скорость выполнения программ не такая высокая как у С/С++. Python транслирует инструкции кода в байт-код, а затем интерпретирует. Так как пайтон не создает бинарный код некоторые программы могут работать медленнее аналогов на С.

</details>

<details>
<summary><b>Причины выбрать</b></summary>

Поверхностные причины:
1. ООПешный и функциональный (есть генераторы, замыкания, включения - comprehensions, мапы, декораторы, анонимные лямбда функции и функции-объекты первого класса) 
2. Он свободный
3. Переносимый
4. Он мощный
5. Смешивающийся
6. Относительно прост в использовании (rapid turnaround - быстрый, питон - выполняемый псевдокод)
7. Относительно прост в изучении
8. it’s Named After Monty Python :)

Мощные детальные причины:
- dynamic typing: код на питоне не ограничивает типы данных
- automatic memory management: питон автоматически выделяет объекты и реклеймит их (reclaim - собирает мусор)
- programming-in-the-large support: питон включает модули, классы и экспепшены. Эта возможность позволяет организовать системы в компоненты.
- built-in object types: списки, словари, строки
- built-in tools: операции для работы с object types - конкатенация (коллеций), slicing (извлечение секций- части колеций), сортировка, мапинг и другое.
- library utilities: большая часть действий приложений происходит именно с библиотекой (в ней есть всё от матчинга регулярных выражений до инструментов работы по сети)
- third-party utilities: разрабы могут добавлять еще свои инструменты кроме тех, что уже модульные (built-ins)

The result is a powerful programming tool with all the usability of a scripting language.

</details>

<details>
<summary><b>Известные применения</b></summary>

1. Вообще может использоваться или как инструмент управления другими программными компонентами (управляющий язык), или как для реализации самостоятельных программ.
2. Системное программирование - сценарии могут отыскивать файлы, запускать другие программы, производить парал. вычисления. Стандартная библиотека обладает стандартом POSIX и имеет инструменты (переменные окружения, файлы, сокеты, каналы, процессы).
3. GUI - отличное средство разработки граф. интерфейса(tkinter - стандартный)
4. Internet Scripting - Django для создания веб-сайтов, Python был расширен в rich Internet apps (RIAs) с помощью Silvelight в IronPython, Python также перебрался в cloud computing (с App engine и другими инструментами описанными в пункте 6).
5. Интеграция компонентов - возможность расширения или встраивания Python в системы на языке С/С++. Питон может быть встроен в программные продукты чтобы автоматически настраивать их без необходимости их пересобирать.
6. Приложения баз данных - Python имеет много интерфейсов для работы с БД, имеет переносимый прикладной прог. интерфейс баз данных (portable API) для доступа к SQL бд из скриптов Питона. переносимость означает, что написанный скрипт для одной бд работает и для другой. Всё, что нужно сделать - это заменить низкоуровневый интерфейс (the underlying vendor interface)
7. Быстрое создание прототипов
8. Программирование математических и научных вычислений (NumPy, SciPy и ScientificPython для научного программирования, PyPy для ускоренного численного программирования)

<details>
<summary>А так же Python может применяться для разработки игр, изображений, систем с искусственным интеллектом, XML роботы и тд.</summary>

- Game programming and multimedia with pygame, cgkit, pyglet, PySoy, Panda3D, and others
- Serial port communication on Windows, Linux, and more with the PySerial extension
- Image processing with PIL and its newer Pillow fork, PyOpenGL, Blender, Maya, and more
- Robot control programming with the PyRo toolkit
- Natural language analysis with the NLTK package
- Instrumentation on the Raspberry Pi and Arduino boards
- Mobile computing with ports of Python to the Google Android and Apple iOS platforms
- Excel spreadsheet function and macro programming with the PyXLL or DataNitro add-ins
- Media file content and metadata tag processing with PyMedia, ID3, PIL/Pillow, and more
- Artificial intelligence with the PyBrain neural net library and the Milk machine learning toolkit
- Expert system programming with PyCLIPS, Pyke, Pyrolog, and pyDatalog
- Network monitoring with zenoss, written in and customized with Python
- Python-scripted design and modeling with PythonCAD, PythonOCC, FreeCAD, and others
- Document processing and generation with ReportLab, Sphinx, Cheetah, PyPDF, and so on
- Data visualization with Mayavi, matplotlib, VTK, VPython, and more
- XML parsing with the xml library package, the xmlrpclib module, and third-party extensions
- JSON and CSV file processing with the json and csv modules
- Data mining with the Orange framework, the Pattern bundle, Scrapy, and custom code

</details>
</details>


## C#

<details>
<summary><b>Особенности</b></summary>

TODO:

</details>

<details>
<summary><b>Плюсы</b></summary>

TODO:

</details>

<details>
<summary><b>Минусы</b></summary>

TODO:

</details>

<details>
<summary><b>Причины выбрать</b></summary>

TODO:

</details>

<details>
<summary><b>Известные применения</b></summary>

TODO:

</details>


## JavaScript

<details>
<summary><b>Особенности</b></summary>

JS — очень быстро развивается, тренд последних лет. Огромное количество наработок, и можно писать все, что угодно, даже игры. Его используют для средних и больших проектов, но действительно мощные возможности этот язык получил недавно, потому примеров больших проектов пока мало, специалисты самые дорогие, и найти их сложнее всего. JS быстрый, но не быстрее С++.

</details>

<details>
<summary><b>Плюсы</b></summary>

TODO:

</details>

<details>
<summary><b>Минусы</b></summary>

TODO:

</details>

<details>
<summary><b>Причины выбрать</b></summary>

TODO:

</details>

<details>
<summary><b>Известные применения</b></summary>

TODO:

</details>

## PHP

<details>
<summary><b>Особенности</b></summary>

PHP — его используют в основном для простых и средних проектов. Очень много коробочных решений. Относительно дешевые программисты. Антитренд последних лет, хотя с выходом последней версии языка под номером 7, он получил действительно мощные возможности.

</details>

<details>
<summary><b>Плюсы</b></summary>

TODO:

</details>

<details>
<summary><b>Минусы</b></summary>

TODO:

</details>

<details>
<summary><b>Причины выбрать</b></summary>

TODO:

</details>

<details>
<summary><b>Известные применения</b></summary>

TODO:

</details>

## Ruby

<details>
<summary><b>Особенности</b></summary>

Ruby — современный язык, разработка на нем также быстрая. Его используют в основном для разработки простых и средних проектов, часто разрабатывают стартапы. Программистов также мало, и они дорогие.

</details>

<details>
<summary><b>Плюсы</b></summary>

TODO:

</details>

<details>
<summary><b>Минусы</b></summary>

TODO:

</details>

<details>
<summary><b>Причины выбрать</b></summary>

TODO:

</details>

<details>
<summary><b>Известные применения</b></summary>

TODO:

</details>