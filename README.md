# jorgedev.net
Repositório do meu portifólio

Iniciar o container com o código abaixo:

docker run -d -p 2405:80 --name jorgedev_net \
  jorgeluisreis/jorgedev.net:main \
  bash -c "sudo unlink /etc/nginx/sites-enabled/default && sudo ln -s /etc/nginx/sites-available/jorgedev.net /etc/nginx/sites-enabled/jorgedev.net && nginx -g 'daemon off;'"
