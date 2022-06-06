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

