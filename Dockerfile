FROM composer:1.9.1 as build
WORKDIR /app
COPY ./src /app
RUN composer --quiet install

FROM php:7.2.24-apache-stretch
ENV DEBIAN_FRONTEND=nointeractive
COPY --from=build /app /var/www/html
COPY ./virtualhost.conf /etc/apache2/sites-available/000-default.conf
WORKDIR /var/www/html
RUN docker-php-ext-install pdo_mysql \
    && a2enmod rewrite
EXPOSE 80