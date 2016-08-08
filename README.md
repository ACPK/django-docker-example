# django-docker-example
A project using Docker to create an environment for development with Python and Django.

To run the project, do the following steps:

# Docker
1. Install [Docker](https://docs.docker.com/engine/installation/)
2. Clone this repository using `git clone https://github.com/Dbof/django-docker-example.git django-docker`
3. Change into the cloned repository with `cd django-docker`
4. Build the django-docker container: `docker build -t django-docker .`
5. Run `sh run_docker.sh`
6. Done!

The code will be saved in the `src` folder of the repository.

After running the Docker container, you get an interactive shell where you can run typical Django commands:
1. `django-admin startproject`
2. `django-admin startapp`
3. `python manage.py runserver 0.0.0.0:8000` to start the built-in server. The web application will be available on http://localhost:8000/.
