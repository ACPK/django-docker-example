id2=$(docker ps -q -f ancestor=django-docker)

if [ -z "$id2" ]
then
    clear
    docker run -v "$(pwd)"/src:/code -p 8000:8000 -it django-docker
else
    clear
    echo "[!] Warning: Docker instance already running! Connecting to existing one.."
    docker exec -it $id2 /bin/bash
fi
