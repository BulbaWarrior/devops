# Falcon time
This is as small web app that displays current moscow time

## Development
1. Install poetry, follow the instructions on their [website](https://python-poetry.org/docs/)
2. Start virtual environment:
cd into the 'app_python directory and run
'''sh
poetry shell
'''
3. Install dependencies
'''sh
poetry install
'''
4. Run the application
'''sh
poetry run python main.py
'''
the server will start listening on port 8000

To add a new dependency run '''poetry add <dependency>'''
To add a development dependency '''poetry add --dev <dev_dependency>'''

## Docker
If you just want to run the application there is a Dockerfile:
cd 'into app_python'
'''sh
docker build . -t falcon
docker run -p 8000:8000 falcon
'''
or just run '''docker run -p 8000:8000 bulbawarrior/falcon''' to pull the image from dockerhub
