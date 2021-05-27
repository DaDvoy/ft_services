FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl supervisor libc6-compat

COPY    ./src/nginx.conf ./etc/nginx/conf.d/default.conf
RUN     mkdir -p /run/nginx
RUN     mkdir -p var/www/dadvoy
COPY ./src/supervisord.conf /etc/supervisord.conf

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=-/L=KAZAN/O=School21/OU=-/CN=ft_services.ru/emailAddress=admin@ft_services.com"

COPY    ./src/index.html /var/www/dadvoy

COPY ./src/start_server.sh ./

RUN chmod +x ./start_server.sh

EXPOSE  80 443
CMD     sh start_server.sh
