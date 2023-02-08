FROM php:8.2.2
WORKDIR /app
RUN apt-get update && apt-get install -y git libzip-dev zip unzip && docker-php-ext-install zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY . ./
RUN composer install
RUN composer require predis/predis
CMD php artisan serve