From python:3.4.3
MAINTAINER Davide Bove <me@davidebove.com>
ENV PYTHONUNBUFFERED 1

# TODO: phantomjs RUN apt-get install 

RUN pip install django && mkdir /static
COPY django_bash_completion /etc/bash_completion.d/django_bash_completion

WORKDIR /code
CMD ["/bin/bash", "--init-file", "/etc/bash_completion.d/django_bash_completion"]
