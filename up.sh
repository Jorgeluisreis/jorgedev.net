#!/bin/bash

docker-compose -f docker-swarm.yml build &&
echo "imagem buildada para execução" &&
docker service rm nginx_nginx &&
echo "removendo nginx do ambiente" &&
docker stack deploy --compose-file=docker-swarm.yml nginx &&
echo "deploy docker swarm no sistema"
