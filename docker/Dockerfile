FROM composer:latest as build
WORKDIR /work
COPY . /work

FROM php:8.0-apache
COPY php.ini /usr/local/etc/php/
RUN apt update
RUN apt install -y git
RUN apt install -y vim
RUN apt install -y zip unzip
RUN docker-php-ext-install bcmath pdo_mysql

# composer install
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
EXPOSE 8080
COPY --from=build /app /work
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN chmod 777 -R /work
RUN echo "Listen 8080" >> /etc/apache2/ports.conf
RUN chown -R www-data:www-data /work
RUN a2enmod rewrite