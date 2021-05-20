FROM alpine:3.12

RUN apk update && apk update
RUN apk add wget nginx supervisor openssl
RUN apk add --no-cache php7 php7-fpm php7-ldap php7-iconv php7-mbstring php7-mysqli php7-curl php7-gd php7-json \
php7-soap php7-xml php7-xmlrpc php7-session php7-ctype

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mkdir -p var/www/dadvoy

RUN mkdir -p /run/nginx
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/dadvoy/phpMyAdmin

COPY /src/config.inc.php ./var/www/dadvoy/phpMyAdmin
COPY /src/supervisord.conf ./etc/supervisord.conf
COPY /src/nginx_php.conf ./etc/nginx/conf.d/default.conf

EXPOSE 5000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]