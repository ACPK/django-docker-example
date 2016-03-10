From python:3.4.3
MAINTAINER Davide Bove <me@davidebove.com>
ENV PYTHONUNBUFFERED 1

# TODO: phantomjs RUN apt-get install 

ADD ./src /code/
WORKDIR /code
RUN pip install -r requirements.txt && mkdir /static
ENTRYPOINT ["./docker-entrypoint.sh"]
