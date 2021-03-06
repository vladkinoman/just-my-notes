# Резюме

Реализация MVVM и MVP-паттернов, на первый взгляд, выглядит достаточно схожей. Однако, для MVVM связывание представления с View-моделью осуществляется автоматически, а для MVP — необходимо программировать. MVC, по-видимому, имеет больше возможностей по управлению представлением.

# Общие правила выбора паттерна

## MVVM

Используется в ситуации, когда возможно связывание данных без необходимости ввода специальных интерфейсов представления (т.е. отсутствует необходимость реализовывать IView).

Частым примером является технология WPF.

## MVP

Используется в ситуации, когда невозможно связывание данных (нельзя использовать Binding).

Частым примером может быть использование Windows Forms.

## MVC

Используется в ситуации, когда связь между представление и другими частями приложения невозможна (и Вы не можете использовать MVVM или MVP).

Частым примером использования может служить ASP.NET MVC.