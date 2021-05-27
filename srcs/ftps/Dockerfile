FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd openssl openrc libc6-compat supervisor

# установка OpenSSL - библиотека с расширением SSl(протокол безопасной связи)
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096\
	-keyout /etc/ssl/ftps_key.pem -out /etc/ssl/ftps_key.pem\
	-subj "/C=RU/ST=-/L=KAZAN/O=School21/OU=-/CN=ft_services.ru"
RUN printf "lmushroo\nlmushroo\n" | adduser lmushroo -s /bin/false -h /lmushroo
# Читает файл пар имени пользователя и пароля и обновляет пароли

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
COPY ./src/telegraf.conf /etc/telegraf/telegraf.conf

COPY ./src/supervisor.conf /etc/supervisord.conf

# Поменять имя владельца для /var/www на ‘user’
# + поменять группу для /var/www на ‘ftps’
RUN chown lmushroo:lmushroo /lmushroo

# COPY ./src/supervisord.conf ./etc/supervisord.conf

COPY ./src/vsftpd.conf ./etc/vsftpd/vsftpd.conf

COPY ./start.sh ./
RUN chmod +x ./start.sh

# клиент сообщает порту 21, какой верхний порт открыть: 21000
EXPOSE 20 21 21000

CMD sh start.sh