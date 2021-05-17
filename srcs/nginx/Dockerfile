FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor

COPY    ./src/nginx.conf /etc/nginx/conf.d/default.conf
COPY    ./src/configs/supervisor.conf /etc/supervisord.conf
RUN     mkdir -p /run/nginx

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=-/L=KAZAN/O=School21/OU=-/CN=ft_services.ru/emailAddress=admin@ft_services.com"

COPY    ./src/start_server.sh /tmp/
RUN     chmod +x /tmp/start_server.sh
EXPOSE  80 443 22

# not daemon off
CMD sh /tmp/start_server.sh