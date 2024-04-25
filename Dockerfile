FROM nginx:latest

# Copia o arquivo index.html para /usr/share/nginx/html
COPY html/index.html /usr/share/nginx/html/

# Remove o default virtual host
RUN rm /etc/nginx/sites-enabled/default

# Copia o arquivo de configuração para sites-available
COPY sites-available/jorgedev.net /etc/nginx/sites-available/

# Cria o link simbólico para habilitar o site
RUN ln -s /etc/nginx/sites-available/jorgedev.net /etc/nginx/sites-enabled/jorgedev.net

# Porta
EXPOSE 80