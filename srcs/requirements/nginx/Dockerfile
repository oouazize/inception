FROM alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache nginx && apk add openssl
WORKDIR /etc/nginx
# RUN mkdir ssl
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
# 	-out ssl/localhost.crt \
# 	-keyout ssl/localhost.key \
# 	-subj "/C=MA/ST=oouazize/L=oouazize/O=42 School/OU=localhost/CN=localhost/"
COPY ./conf/nginx.conf nginx.conf

CMD ["nginx", "-g", "daemon off;"]