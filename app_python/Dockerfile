FROM python:3.9 as depmanager
ARG POETRY_VERSION=1.1.8
RUN pip install poetry==$POETRY_VERSION
COPY pyproject.toml .
COPY poetry.lock .
RUN /bin/sh -c 'poetry export -f requirements.txt -o requirements.txt'


FROM python:3.9-alpine as build
ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1
WORKDIR /app
RUN apk add --no-cache gcc build-base linux-headers
COPY --from=depmanager requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD python main.py
