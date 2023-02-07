FROM php:8.2.2
WORKDIR /app
RUN apt-get update && apt-get install -y git

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY composer.json composer.lock ./
RUN composer install --quiet --optimize-autoloader --no-dev
RUN composer require predis/predis
COPY . ./
CMD php artisan serve