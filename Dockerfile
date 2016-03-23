FROM ubuntu:xenial

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN apt-get -y update && apt-get install -y python-pip

RUN pip install pip --upgrade
RUN pip install setuptools --upgrade
RUN pip install pylint
RUN pip install autopep8
