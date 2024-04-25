FROM nginx:latest

# Copia o arquivo index.html para /usr/share/nginx/html
COPY html/index.html /usr/share/nginx/html/

# Copia o arquivo de configuração para sites-available
COPY sites-available/jorgedev.net /etc/nginx/sites-available/

# Porta
EXPOSE 80