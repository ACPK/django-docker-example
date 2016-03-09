From python:3.4.3
MAINTAINER Davide Bove <me@davidebove.com>
ENV PYTHONUNBUFFERED 1

# TODO: phantomjs RUN apt-get install 

ADD ./requirements /requirements
ADD ./src /code/
RUN pip install -r requirements/development.txt
# WORKDIR /code
