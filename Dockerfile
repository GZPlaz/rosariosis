FROM php:8.2-apache

# Install PHP dependencies and PostgreSQL driver
RUN apt-get update && apt-get install -y \
    libpq-dev \
    git \
    unzip \
    && docker-php-ext-install pgsql pdo pdo_pgsql

# Copy source code to the web root
COPY . /var/www/html/

# Set permissions
RUN chmod -R 755 /var/www/html && chown -R www-data:www-data /var/www/html

# Enable Apache rewrite module
RUN a2enmod rewrite
