# --add-host=db:172.17.0.2 
#get postgres ip
id=$(docker ps -q -f ancestor=postgres)
id2=$(docker ps -q -f ancestor=django_web)
if [ -z "$id" ] 
then
        echo "[!] Error: Start the postgres image before running django! Try: docker run -d postgres"
        exit 1
fi

if [ -z "$id2" ]
then
    clear
    docker run --link $id:db -v "$(pwd)"/src:/code -p 8000:8000 -t -i django_web python /code/manage.py runserver 0.0.0.0:8000
else
    clear
    echo "[!] Warning: Docker instance already running! Connecting to existing one.."
    docker exec -it $id2 /bin/bash
fi
