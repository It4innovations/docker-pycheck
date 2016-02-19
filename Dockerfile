FROM ubuntu:xenial

RUN apt-get -y update && apt-get install -y python-pip

RUN pip install pylint\
                autopip8
