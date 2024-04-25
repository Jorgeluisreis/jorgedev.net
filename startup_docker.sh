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
    nginx_dir="/etc/nginx"
    sites_enabled_dir="$nginx_dir/sites-enabled"
    
    if [ ! -d "$sites_enabled_dir" ]; then
        mkdir -p "$sites_enabled_dir"
    fi
    
    if [ -f "$sites_enabled_dir/default" ]; then
        unlink "$sites_enabled_dir/default"
    fi
    
    ln -s "$nginx_dir/sites-available/jorgedev.net" "$sites_enabled_dir/jorgedev.net"
    nginx -g "daemon off;"
'
