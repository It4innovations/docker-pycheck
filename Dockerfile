FROM debian:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y git pandoc python-pip virtualenv python-pylibacl

RUN pip install --upgrade pip setuptools
RUN pip install ansible-lint autopep8 pycodestyle pylint yamllint \
                safety setuptools-git-version setuptools-markdown
RUN virtualenv /opt/.venv
RUN virtualenv -p python3 /opt/.venv3

RUN . /opt/.venv3/bin/activate && pip install --upgrade pip setuptools
RUN . /opt/.venv3/bin/activate && pip install ansible-lint autopep8 pycodestyle pylint yamllint \
                                              safety setuptools-git-version setuptools-markdown
