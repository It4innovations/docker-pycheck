FROM ubuntu:latest

RUN apt-get clean && apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y python-pip libcurl4-openssl-dev gcc libssl-dev curl gunicorn git xserver-common cutycapt imagemagick

RUN pip install --upgrade pip setuptools
RUN pip install pylint autopep8 pyresttest flask flask-jsonpify flask-sqlalchemy flask-restful yattag
