FROM alpine:3.16
RUN apk update && apk upgrade && apk add --no-cache \
    php8 php8-fpm php8-mysqli php8-json php8-curl \
    php8-dom php8-exif php8-fileinfo php8-mbstring php8-openssl \
    php8-xml php8-zip php8-redis wget unzip && \
    sed -i 's/127.0.0.1:9000/9000/g' /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip && cp wp-config-sample.php wp-config.php

RUN sed -it 's/database_name_here/wordpress/g' wp-config.php && \
    sed -it 's/username_here/oouazize/g' wp-config.php && \
    sed -it 's/password_here/wppass/g' wp-config.php && \
    sed -it 's/localhost/mariadb/g' wp-config.php
CMD ["/usr/sbin/php-fpm8", "-F"]