# Notes on GOAT

Methodology: TDD.

Tools: Django, Selenium, jQuery, and Mocks.

Parts:

- the basics: func. test with Selenium, the basic of Django (m, v, templates). The Testing Goat.
- web dev essentials: static files, deployment to prod, form data validation, database migrations, and JS.
- advanced topics: mocking, integr. a 3-p system, text fixtures, Outside-In TDD, and cont. integr. (CI.)

## The basics of TDD and Django

A Python virtualenv (short for virtual environment) is how you set up your environment for different Python projects.  It allows you to use different packages (e.g., different versions of Django, and even different versions of Python) in each project.  And because you’re not installing things system-wide, it means you don’t need root permissions.

Activating python virtual environment:

```bash
$ source virtualenv/bin/activate
(virtualenv)$
(virtualenv)$ which python
/home/myusername/python-tdd-book/virtualenv/bin/python
(virtualenv)$ deactivate
$
$ which python
/usr/bin/python
```

functional_tests.py:

```python
from selenium import webdriver

browser = webdriver.Firefox()
browser.get('http://localhost:8000')

assert 'Django' in browser.title
```

- Starting a Selenium "webdriver" to pop up a real Firefox browser window

  > geckodriver - proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers. This program provides the HTTP API described by the WebDriver protocol. to communicate with Gecko browsers, such as Firefox. It translates calls into the Firefox remote protocol by acting as a proxy between the local- and remote ends.

- Using it to open up a web page which we’re expecting to be served from the local PC

- Checking (making a test assertion) that the page has the word "Django" in its title

```bash
$ python functional_tests.py
```

Run server:

```bash
$ python manage.py runserver
```

Start new Django project:

```bash
$ django-admin startproject superlists .
```

The superlists folder is useful for the whole project.

├── functional_tests.py
├── geckodriver.log
├── goatenv
│   ├── bin
│   ├── include
│   ├── lib
│   ├── lib64 -> lib
│   └── pyvenv.cfg
├── **manage.py** - Django’s Swiss Army knife
├── requirements.txt

├── superlists
│   ├── asgi.py
│   ├── __init__.py
│   ├── settings.py - stores glob. conf. inf. for the site
│   ├── urls.py
│   └── wsgi.py

Functional tests:

- FT = specification for the app: tracks a User Story, tracks user's experience (using feature <-> app respond)
- FT = Acceptance Test = End-to-End test. Sometimes, **black box test**: test doesn't know an. about the internals of the system under test.
- comments first -> capture the key points of the User Story.

TDD & agile often go together: the **minimum viable app**; what is the simplest thing we can build that is still useful?

**The Python Standard Library’s unittest Module**

- Tests into classes which inherit from `unittest.TestCase`

- test method start with `test` -> will be run by test runner

- `setUp` before each test, `tearDown` after each test (run even if there's an error during the test).

- unittest methods:`self.assertIn`, `assertEqual`, `assertTrue`, `assertFalse`.

- `self.fail` -> produce the error message given, fails no matter what.

- `__name__ == __main__` - check whether it's been executed from CLI.

  `unittest.main()` -> `unittest` test runner, which auto. find test cases and methods & run them.

**First Django app, first unit test**

Django encourages you to structure code into apps. 1 project - many apps.

```bash
$ python manage.py startapp lists
```

-> create a folder called lists, and within it a # of files for models, views, and test.

```
├── superlists
│   ├── __init__.py
│   ├── __pycache__
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
```

unit test ≠ ftest:

- ft test the app from the outside, from the pov of the user.
- ut test the app from the inside, the pov of the programmer.

The TDD approach will cover both of them, our **workflow**:

1. start with ft, describing User's Story.

2. ft fails? -> think about passing: 

   - use 1 or more ut to define behavior of our code (how we see it) — each line of prod. code should be tested by (at least) 1 of our uts.

3. ut fails? -> write smallest amount of *app code* we can, enough to get the ut to pass.

   > We may iter. between 2 & 3 a few times, until the ft. get a little further.

4. Rerun our fts and see if they pass, or get a little further.

   > That may prompt us to write some new uts, and some new code...

**Unit testing in Django**

lists/tests.py contains an augmented version of the standard unittest.TestCase.

**Django’s MVC, URLs, and View Functions**

Django is structured along a classic MVC pattern, *broadly*:

- views are more like a controller
- templates are actually the view part

> [details](https://docs.djangoproject.com/en/1.11/faq/general/#django-appears-to-be-a-mvc-framework-but-you-call-the-controller-the-view-and-the-view-the-template-how-come-you-don-t-use-the-standard-names)

Django's main job = decide what to do when user ask for a partic. URL. Django's workflow:

1. An HTTP request from user
2. Django uses rules to decide which *view* func. should deal with the request (*resolving* the URL). 
3. The view func. process the request and an HTTP response.

We want to test two things:

- Can we resolve the URL for the root of the site ("/") to a particular view function we've made?
- Can we make this view func. return some HTML which will get the func. test to pass?

*lists/tests.py*

```python
from django.urls import resolve
from django.test import TestCase
from lists.views import home_page

class HomePageTest(TestCase):
    def test_root_url_resolves_to_home_page_view(self):
        found = resolve('/')
        self.assertEqual(found.func, home_page)
```

**At Last! We Actually Write Some Application Code!**

*list/views.py*

```python
from django.shortcuts import render

home_page = None
```

Reading tracebacks:

1. Error itself

   > below, exceptions, tried

2. Which test is failing?

   > at the beginning

3. Look for the place in our test code that kicked off the failure.

   > middle
   > Look for the filenames, check which test function, and what line of code.

**urls.py**

we need a url mapping = use urls.py to map URLs to view funct.
