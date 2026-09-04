FROM php:8.2-Apache
RUN docker-php-ext-install pdo pdo_mysql
COPY ./var/html/www
EXPOSE 80