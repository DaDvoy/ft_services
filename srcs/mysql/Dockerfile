FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add libc6-compat openrc supervisor
RUN apk add mysql mysql-client


COPY ./src/start.sh ./start.sh
COPY ./src/my.cnf ./etc/my.cnf
COPY ./src/mybase ./mybase
COPY ./src/supervisord.conf ./etc/supervisord.conf
COPY ./src/wordpress.sql ./wordpress.sql

RUN chmod +x start.sh

EXPOSE 3306

#database storage
VOLUME ["/var/lib/mysql"]

CMD sh start.sh

