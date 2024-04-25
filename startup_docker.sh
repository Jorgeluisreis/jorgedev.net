#!/bin/bash

# Nome do contêiner
CONTAINER_NAME="jorgedev_net"

# Inicia o contêiner
docker run -d -p 2405:80 --name "$CONTAINER_NAME" ghcr.io/jorgeluisreis/jorgedev.net:main

# Verifica se o contêiner está em execução
while ! docker container inspect "$CONTAINER_NAME" >/dev/null 2>&1; do
    echo "Aguardando o contêiner $CONTAINER_NAME iniciar..."
    sleep 1
done

# Executa os comandos dentro do contêiner
docker exec "$CONTAINER_NAME" bash -c '
    if [ -f "/etc/nginx/sites-enabled/default" ]; then
        unlink "/etc/nginx/sites-enabled/default"
    fi
    ln -s /etc/nginx/sites-available/jorgedev.net /etc/nginx/sites-enabled/jorgedev.net
    nginx -g "daemon off;"
'