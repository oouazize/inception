FROM alpine:3.16
ARG DB_NAME DB_USER DB_PASS DB_HOST
RUN apk update && apk upgrade && apk add --no-cache \
    php8 php8-fpm php8-mysqli php8-json php8-curl \
    php8-dom php8-exif php8-fileinfo php8-mbstring php8-openssl \
    php8-xml php8-zip php8-phar wget curl unzip && \
    sed -i 's/127.0.0.1:9000/9000/g' /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

WORKDIR /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# download Wordpress files
# RUN wp core download
# RUN cp wp-config-sample.php wp-config.php

# RUN sed -it "s/database_name_here/$DB_NAME/g" wp-config.php && \
#     sed -it "s/username_here/$DB_USER/g" wp-config.php && \
#     sed -it "s/password_here/$DB_PASS/g" wp-config.php && \
#     sed -it "s/localhost/$DB_HOST/g" wp-config.php

# Setup administration
# RUN wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci"
# RUN wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
# RUN wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD
# CMD ["/usr/sbin/php-fpm8", "-F"]
COPY tools/create.sh /tmp/create.sh
ENTRYPOINT [ "sh", "/tmp/create.sh" ]