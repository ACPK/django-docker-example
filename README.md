# django-docker-example
A project using Docker to create an environment for development with Python and Django.

To run the project, do the following steps:

# Docker
1. Install [Docker](https://docs.docker.com/engine/installation/)
2. Run the postgres image: `docker run -d postgres` (This will download the image if necessary)
3. Build the django_web container: `docker build -t django-docker .`
4. Run `sh run_docker.sh`
5. Done!
