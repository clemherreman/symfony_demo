# Use official PHP container with webserver on board
FROM php:7.0-apache

RUN apt-get update && apt-get install -y git \
    && docker-php-ext-install mysqli pdo_mysql

# Copy required configuration files
COPY 000-default.conf /etc/apache2/sites-available
COPY php.ini /usr/local/etc/php

# Apache settings
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && a2enmod rewrite \
    && a2ensite 000-default.conf

# Get composer
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

ADD run.sh /opt/run
RUN chmod +x /opt/run

CMD ["/opt/run"]
