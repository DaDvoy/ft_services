FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vim curl wget tar unzip nginx supervisor
RUN apk add php7 php7-fpm php7-opcache php7-iconv php7-mbstring php7-mysqli php7-curl php7-gd php7-json  \
php7-soap php7-xml php7-xmlrpc php7-session php7-ctype

RUN wget https://ru.wordpress.org/wordpress-5.6.1-ru_RU.tar.gz
RUN tar -xf wordpress-5.6.1-ru_RU.tar.gz && rm  wordpress-5.6.1-ru_RU.tar.gz
RUN mkdir -p var/www/dadvoy
RUN mv wordpress /var/www/dadvoy/wordpress

COPY wp-config.php ./var/www/dadvoy/wordpress
COPY /src/supervisord.conf ./etc/supervisord.conf
COPY /src/nginx_wp.conf ./etc/nginx/conf.d/default.conf

EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]