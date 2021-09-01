pipeline {
    agent { docker { image 'python:3.9-slim-buster' } }
    stages {
        stage('deps') {
            steps {
                sh '''
                    apt-get update && apt-get install -y --no-install-recommends curl=7.64.0-4+deb10u2
                    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python
                    ln -s /opt/poetry/bin /usr/local/bin
                    cd app_python
                    poetry install
                '''
            }
        }
        stage('main') {
            steps {
                parallel (
                    'test': {
                        sh '''
                        cd app_python
                        poetry run pytest
                        '''
                    },
                    'lint': {
                        sh '''
                        cd app_python
                        poutry run flake8
                        '''
                    }
                )
            }
        }
    }
}
