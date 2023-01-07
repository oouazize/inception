FROM alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache nginx

COPY ./conf/nginx.conf /etc/nginxnginx.conf

COPY ./tools/* /var/www

CMD ["nginx", "-g", "daemon off;"]