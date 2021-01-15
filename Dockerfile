FROM debian:buster

LABEL maintainer="agiraude <agiraude@student.42.fr>"

RUN apt update && apt install -y \
mariadb-server \
php-fpm \
php-mysql \
nginx &&\
rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY srcs /root/

WORKDIR /root/

RUN bash database_setup.sh && \
mv nginx.conf /etc/nginx/sites-available/localhost && \
rm /etc/nginx/sites-enabled/default && \
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost && \
mv index.html /var/www/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
