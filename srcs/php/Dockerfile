FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget nginx supervisor openrc
RUN apk add php7 php7-fpm php7-ldap php7-iconv php7-mbstring php7-mysqli php7-curl php7-gd php7-json \
php7-soap php7-xml php7-xmlrpc php7-session php7-ctype php7-zlib php7-opcache libc6-compat

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mkdir -p var/www/dadvoy

RUN mkdir -p /run/nginx
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/dadvoy/phpMyAdmin

COPY ./src/config.inc.php ./var/www/dadvoy/phpMyAdmin
COPY ./src/supervisord.conf ./etc/supervisord.conf
COPY ./src/nginx_php.conf ./etc/nginx/conf.d/default.conf

COPY ./start.sh ./
RUN chmod +x ./start.sh

EXPOSE 5000

CMD sh start.sh