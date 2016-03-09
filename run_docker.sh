# docker run --add-host=db:172.17.0.2 -p 8000:8000 -v /code:./src -t -i django_all /bin/bash
docker run --add-host=db:172.17.0.2 -v $(pwd)/src:/code -p 8000:8000 -t -i django_web python /code/manage.py runserver 0.0.0.0:8000
