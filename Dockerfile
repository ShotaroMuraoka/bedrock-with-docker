FROM php:7.4-fpm AS bedrockapp_php

RUN docker-php-ext-install mysqli pdo_mysql
RUN apt-get update
RUN apt-get install -y unzip
RUN apt-get install -y git

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY bedrock/ /var/www/html

WORKDIR /var/www/html
RUN composer install

FROM nginx:latest AS bedrockapp_nginx

COPY --from=bedrockapp_php /var/www /var/www
COPY nginx/host.conf /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf