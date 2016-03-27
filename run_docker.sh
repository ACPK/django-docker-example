# --add-host=db:172.17.0.2 
#get postgres ip
id=$(docker ps -q -f image=postgres)
if [ -z "$id" ] 
then
        echo "[!] Error: Start the postgres image before running django! Try: docker run -d postgres"
        exit 1
fi

docker run --link $id:db -v $(pwd)/src:/code -p 8000:8000 -t -i django_web python /code/manage.py runserver 0.0.0.0:8000
