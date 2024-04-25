FROM nginx:latest

# Copia o arquivo index.html para /usr/share/nginx/html
COPY html/index.html /usr/share/nginx/html/

# Copia o arquivo de configuração para sites-available
COPY sites-available/jorgedev.net /etc/nginx/sites-available/

# Substitui o nginx.conf
COPY nginx.conf /etc/nginx/

# Cria o link simbólico para habilitar o site
RUN ln -s /etc/nginx/sites-available/jorgedev.net /etc/nginx/sites-enabled/jorgedev.net

# Porta
EXPOSE 80