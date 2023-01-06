#!bin/sh

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
cat << EOF > command.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpass';
CREATE DATABASE wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'oouazize'@'%' IDENTIFIED by 'wppass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'oouazize'@'%';
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld --user=mysql --bootstrap < command.sql && rm -f command.sql


/usr/bin/mysqld --skip-log-error