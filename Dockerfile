FROM python:3.6-alpine

# init
RUN mkdir /www
WORKDIR /www
COPY requirements.txt /www/

# setup
RUN apk update
RUN apk upgrade
RUN apk --no-cache add \
    libffi-dev \
    jpeg-dev \
    zlib-dev \
    postgresql-client \
    postgresql-dev \
    build-base \
    gettext
RUN pip install -r requirements.txt
RUN pip install django-impersonate psycopg2 django-improved-user==1.0.0 dj-database-url
RUN django-admin check

# clean
# RUN apk del -r python3-dev postgresql

# prep
ENV PYTHONUNBUFFERED 1
COPY . /www/