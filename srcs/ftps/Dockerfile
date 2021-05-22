FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd openssl openrc supervisor

# установка OpenSSL - библиотека с расширением SSl(протокол безопасной связи)
RUN openssl req -newkey rsa:4096 -days 1000 -nodes -x509 -subj \
	"/C=RU/ST=-/L=KAZAN/O=School21/OU=-/CN=ft_services.ru" \
	-keyout /etc/ssl/vsftpd.key -out /etc/ssl/vsftpd.crt
RUN addgroup -S ftps && adduser -S user -G ftps -h /var/www

# Читает файл пар имени пользователя и пароля и обновляет пароли
RUN	echo "user:user" | chpasswd

# Поменять имя владельца для /var/www на ‘user’
# + поменять группу для /var/www на ‘ftps’
RUN	chown user:ftps /var/www

COPY ./src/vsftpd.conf ./etc/vsftpd/vsftpd.conf
COPY ./src/supervisord.conf ./etc/supervisord.conf

# RUN chmod +x ./etc/vsftpd/vsftpd.conf

# клиент сообщает порту 21, какой верхний порт открыть: 21000
EXPOSE 21 21000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]