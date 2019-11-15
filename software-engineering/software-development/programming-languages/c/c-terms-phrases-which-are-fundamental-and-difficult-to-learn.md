# Термины и фразы языка C, которые являются фундаментальными и сложными в изучении

## Лексемы

Лексема (token) - символ или последовательность символов. Это всё то, из чего состоит программа.

> По завершении работы препроцессора программа разбивается на лексемы: идентификаторы, ключевые слова, константы, строковые литералы, знаки операций и прочие разделители.

> Прочие разделители - разделители лексем: горизонтальные таб, вертик. таб, символ заверш. строки, комментарии, пробелы и т.д. Они отбрасываются (cast aside) компилятором.

> Расширенные наборы символов для азиатских стран: строковая константа - L'...', строковый литерал L "...".

Литерал (literal) - фиксированное значение, которое не может быть изменено программой. 
Пример: `ch = 'r'`.

## Объекты и типы

Переменная (объект) - именованный участок в памяти. 

> Интерпретировать её в программе можно в зависимости от:
> 1. Класса памяти - определяет время жизни и контекст объекта.
> 2. Типа данных - смысл вкладываемый в данные объекта.

Классы памяти в C по K&R: автоматический (auto & register) и статический (static & extern) + Khizha: динамический класс памяти.

Расширение целочисленного типа (integer promotion) - итерация приведения операнда к int (или unsigned int) если тип int (unsigned int) позволяет представить все значения исходного типа операнда . char, short, int, integer bit field, все либо signed либо нет, а также объект enum типа - все могут применяться в выражениях, где разрешены int. Это возможно из-за IP. По сути, после компиляции IP и происходит для всех вышеперечисленных типов.

Конгруэнтный тип - имеющий тоже двоичное представление.

> Объекты типа char имеют наименее строгие требования к выравниванию. Выравнивание используется когда нужно поместить в адреса очень требовательный тип! Выравнивание регулируется с помощью typedef и union.

> Приведение типов применяется к указателям явным образом и даже приспособлено к неудачному системному интерфейсу.

> Преобразования указатель в указатель требуют явного приведения типов!.

> Значение объекта типа void нельзя использовать (x = void f), явно или неявно привести к другому типу. Однако, можно приводить указатели на объекты к void * без потери информации. void * можно также употреблять совместно с указателями любого типа в = и <= как угодно.

TODO: Неполный тип - 

## Выражения

Выражение - композиция операторов (символов типа "+, -"), переменных и литералов. 

> Выражение может иметь значение (например, выражение присваивания). Такие выражения могут участвовать в других выражениях, так как их значения будут использоваться.

Выражения в C/С++ могут быть двух типов: lvalue и rvalue.

lvalue (в Си устаревшее: left-side value (именующее выражение), в C++: locator value) - объект (переменная), который занимает идентифицированное место в памяти или это выражение, обозначающее объект или ссылающееся на него. 
Пример: `int a; // a - lvalue, у а есть адресс`.

> Идентификатор - lvalue если он ссылается на объект и если его тип арифметический, struct, union или указатель.

rvalue - всё, что не является lvalue. rvalue - это временное значение, которое не сохранится за пределами выражения, которое его использует. 
Пример: `3 // это просто значение`.

modifiable lvalue - модифицированное lvalue: не массив, не неполный тип, не имеет спецификатора const, не является struct или union с полями const.

## Runtime Errors
While solving the problems on an online Judge, many runtime errors can be faced, which are not clear by the message which comes with them. Lets try to understand these errors.

To get clear about the definition of run time error:
A runtime error means that the program was compiled successfully, but it exited with a runtime error or crashed. You will receive an additional error message, which is most commonly one of the following:

1. **SIGSEGV**
   This is the most common error, i.e., a "segmentation fault". This may be caused e.g. by an out-of-scope array index causing a buffer overflow, an incorrectly initialized pointer, etc. This signal is generated when a program tries to read or write outside the memory that is allocated for it, or to write memory that can only be read. For example, you’re accessing a[-1] in a language which does not support negative indices for an array.
2. **SIGXFSZ**
   "output limit exceeded". Your program has printed too much data to output.
3. **SIGFPE**
   "floating point error". This usually occurs when you’re trying to divide a number by 0, or trying to take the square root of a negative number.
4. **SIGABRT**
   These are raised by the program itself. This happens when the judge aborts your program in the middle of execution. Due to insufficient memory, this can be raised.
5. **NZEC**
   (non-zero exit code) - this message means that the program exited returning a value different from 0 to the shell. For languages such as C/C++, this probably means you forgot to add "return 0" at the end of the program. It could happen if your program threw an exception which was not caught. Trying to allocate too much memory during code execution may also be one of the reasons.
   For interpreted languages like Python, **NZEC** will usually mean that your program either crashed or raised an uncaught exception. Some of the reasons being in such cases would be: the above mentioned runtime errors. Or, for instance usage of an external library which is causing some error, or not being used by the judge.
6. **MLE (Memory Limit Exceeded)**
   This error means that your program tried to allocate memory beyond the memory limit indicated. This can occur if you declare a very large array, or if a data structure in your program becomes too large.
7. **OTHER**
   This type of error is sometimes generated if you use too much memory. Check for arrays that are too large, or other elements that could grow to a size too large to fit in memory. It can also be sometimes be generated for similar reasons to the **SIGSEGV** error.

### Some ways to avoid runtime errors

1. Make sure you aren't using variables that haven't been initialized. These may be set to 0 on your computer, but aren't guaranteed to be on the judge.
2. Check every single occurrence of accessing an array element and see if it could possibly be out of bounds.
3. Make sure you aren't declaring too much memory. 64 MB is guaranteed, but having an array of size [100000] * [100000] will never work.
4. Make sure you aren't declaring too much stack memory. Any large arrays should be declared globally, outside of any functions, as putting an array of 100000 ints inside a function probably won't work.