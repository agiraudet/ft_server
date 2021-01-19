FROM debian:buster

LABEL maintainer="agiraude <agiraude@student.42.fr>"

COPY srcs /root/

WORKDIR /root/

RUN apt-get update && apt-get install -y \
nginx \
mariadb-server \
php-fpm \
php-mysql \
php-mbstring \
php-zip \
php-gd \
php-curl \
php-xml \
php-xmlrpc \
php-soap \
php-intl \
wget

#setup database (similar to mysql_secure_installation)
RUN service mysql start && \
mysql -sfu root < "db_install.sql"

#nginx setup
RUN mkdir -p /var/www/localhost && \
chown -R www-data:www-data /var/www/localhost && \
mv nginx.conf /etc/nginx/sites-available/localhost && \
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/ && \
rm -f /etc/nginx/sites-enabled/default

#phpmyadmin setup
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
tar zxf phpMyAdmin-5.0.4-english.tar.gz && \
rm phpMyAdmin-5.0.4-english.tar.gz && \
mv phpMyAdmin-5.0.4-english /usr/share/phpmyadmin && \
ln -s /usr/share/phpmyadmin /var/www/localhost/phpmyadmin && \
chmod 755 -R /usr/share/phpmyadmin && \
chown www-data:www-data -R /usr/share/phpmyadmin

#wordpress setup
RUN wget https://wordpress.org/latest.tar.gz && \
tar zxf latest.tar.gz && \
rm latest.tar.gz && \
mv wordpress /var/www/localhost/wordpress && \
mv wp-config.php /var/www/localhost/wordpress && \
find /var/www/localhost/wordpress/ -type d -exec chmod 755 {} \; && \
find /var/www/localhost/wordpress/ -type f -exec chmod 644 {} \;

#generate ssl
RUN openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
-keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt \
-subj "/C=FR/ST=IdF/L=PARIS/O=42/OU=STUDENT/CN=localhost"

RUN chmod +x start.sh && \
chmod +x autoindexation.sh

EXPOSE 80 443

CMD ["./start.sh"]
