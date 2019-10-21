FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y git pandoc python-pip virtualenv && \
    apt-get install -y libcairo2-dev pkg-config python3-dev

RUN pip install --upgrade pip setuptools
RUN pip install ansible-lint autopep8 pycodestyle pylint yamllint
RUN pip install setuptools-git-version setuptools-markdown
