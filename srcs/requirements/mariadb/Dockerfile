FROM alpine:3.16
ARG DB_NAME DB_USER DB_PASS DB_ROOTPASS

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

RUN mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
COPY conf/command.sql .
RUN /usr/bin/mysqld --user=mysql --bootstrap < command.sql && rm -f command.sql

EXPOSE 3306

# COPY conf/creat-DB.sh /tmp/creat-DB.sh
# RUN touch command.sql
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]
# USER mysql
# ENTRYPOINT [ "sh", "/tmp/creat-DB.sh" ]