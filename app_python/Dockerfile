FROM python:3.9 as depmanager
ARG POETRY_VERSION=1.1.8
RUN pip install --no-cache-dir poetry==$POETRY_VERSION
WORKDIR /dependencies
COPY pyproject.toml .
COPY poetry.lock .
RUN poetry export -f requirements.txt -o requirements.txt


FROM python:3.9-alpine as build
ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

WORKDIR /app
RUN adduser -D falcon

COPY --from=depmanager /dependencies/requirements.txt .
# installing uWSGI as binary saves about 120MB
RUN apk add --no-cache uwsgi=2.0.19.1-r2 && \
    pip install --no-cache-dir -r requirements.txt --prefer-binary --compile

USER falcon
COPY . .
EXPOSE 8000
CMD ["python", "main.py"]
