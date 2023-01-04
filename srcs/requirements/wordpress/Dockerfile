FROM alpine:3.16
RUN apk update && apk upgrade && apk add --no-cache \
    php8 php8-fpm php8-mysqli php8-json php8-curl \
    php8-dom php8-exif php8-fileinfo php8-mbstring php8-openssl \
    php8-xml php8-zip php8-phar wget curl unzip && \
    sed -i 's/127.0.0.1:9000/9000/g' /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

WORKDIR /var/www/html
# RUN wget https://wordpress.org/latest.zip && \
#     unzip latest.zip && \
#     cp -rf wordpress/* . && \
#     rm -rf wordpress latest.zip && cp wp-config-sample.php wp-config.php
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# download Wordpress files
RUN wp core download
RUN cp wp-config-sample.php wp-config.php

RUN sed -it 's/database_name_here/wordpress/g' wp-config.php && \
    sed -it 's/username_here/oouazize/g' wp-config.php && \
    sed -it 's/password_here/wppass/g' wp-config.php && \
    sed -it 's/localhost/mariadb/g' wp-config.php

# Setup administration
# RUN wp core install --url=localhost --title="My Blog" --admin_user=oouazize --admin_password=wppass --admin_email=oz@example.com
# RUN wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci"
# RUN wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
# RUN wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD
# RUN wp theme install inspiro --activate
CMD ["/usr/sbin/php-fpm8", "-F"]