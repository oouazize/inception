FROM alpine:3.16
ARG DB_NAME DB_USER DB_PASS DB_ROOTPASS

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY tools/create-DB.sh /tmp/create-DB.sh

RUN mkdir /var/run/mysqld && chmod 777 /var/run/mysqld && \
    sed -i "s/skip-networking/skip-networking=0/g" /etc/my.cnf.d/mariadb-server.cnf && \
    chmod +rwx /tmp/create-DB.sh

USER mysql
ENTRYPOINT [ "sh", "/tmp/create-DB.sh" ]