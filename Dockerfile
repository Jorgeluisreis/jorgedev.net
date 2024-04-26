FROM nginx:latest

# Copia o arquivo index.html para /usr/share/nginx/html
COPY nginx/usr/share/nginx/html/index.html /usr/share/nginx/html/

# Copia o arquivo de configuração para sites-available
COPY nginx/etc/nginx/sites-available/jorgedev.net /etc/nginx/sites-available/

# Substitui o nginx.conf personalizado para o container
COPY nginx/etc/nginx/nginx.conf /etc/nginx/

# Porta
EXPOSE 80
EXPOSE 443