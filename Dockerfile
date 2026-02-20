FROM php:8.2-apache

# Installer extensions PHP
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Activer mod_rewrite
RUN a2enmod rewrite

# Copier le vhost Apache
COPY docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf

# Copier le code source
COPY src/ /var/www/html/

# Donner les permissions
RUN chown -R www-data:www-data /var/www/html