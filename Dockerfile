FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl

COPY    ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
RUN     mkdir -p /run/nginx

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=-/L=-/O=-/OU=-/CN=ft_services.ru/emailAdress=admin@ft_services.com"

COPY    ./srcs/start_server.sh /tmp/
RUN     chmod +x /tmp/start_server.sh
EXPOSE  80 443

# not daemon off
CMD     nginx -g 'daemon off;'