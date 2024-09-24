docker run --name postgres-container -e POSTGRES_PASSWORD=pass123 -d -p 5432:5432 postgres

if exists{
    docker start postgres-container
}

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres-container


docker exec -it postgres-container /bin/sh