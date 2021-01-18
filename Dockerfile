FROM debian:buster

LABEL maintainer="agiraude <agiraude@student.42.fr>"

RUN apt update && apt install -y \
mariadb-server \
php-fpm \
php-mysql \
wget \
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

RUN mkdir -p /run/php-fpm && \
mkdir -p /var/www/html/phpmyadmin && \
#wget https://www.phpmyadmin.net/downloads/phpMyAdmin-5.0.4-english.tar.gz && \
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
tar zxf phpMyAdmin-5.0.4-english.tar.gz && \
ls && \
rm phpMyAdmin-5.0.4-english.tar.gz && \
mv phpMyAdmin-5.0.4-english /var/www/html/phpmyadmin && \
chown -R www-data:www-data /var/www/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
