# django-docker-example
A project using Docker to create an environment for development with Python and Django.

To run the project, there are two methods. There is the Docker-only solution, and there is Docker Compose.

# Docker
1. Install docker
2. Run the postgres image: `docker run -d postgres` (This will download the image if necessary)
3. Build the django_web container: `docker build -t django_web .`
4. Run `sh run_docker.sh`
5. Done!

# Docker Compose
1. Simply run `docker-compose up -d`
2. Run `docker-compose down` to stop the images
