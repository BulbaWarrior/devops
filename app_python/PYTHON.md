# Python best prctices

## Framework
The framework used for the project is [falcon](https://falcon.readthedocs.io/). It is a fast and minimalist WSGI library without a lot of dependencies and it suits well for small projects

## Dependency manager
[Poetry](https://python-poetry.org/) is used to manage dependencies for the project 

## Linter
[flake8](https://flake8.pycqa.org/en/latest/) is used for linting

## Unit tests
I used [pytest](https://docs.pytest.org/) as the framework for testing
The tests are:
1. 200 OK is returned on the main endpoint("/")
2. 404 is returned on a non existing endpoint
3. Test if the application returns the correct time by checking that the current munite and second are the same (the hours may differ because of different timezones
