FROM php:8.1-apache

USER root
WORKDIR /var/www/html

# 1. Install development packages and clean up apt cache.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        nodejs \
        npm \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        zip \
        curl \
        unzip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-ext-install exif \
    && docker-php-source delete \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

# 2. Apache configs + document root.
COPY docker/vhost.conf /etc/apache2/sites-available/000-default.conf

# 3. mod_rewrite for URL rewrite and mod_headers for .htaccess extra headers like Access-Control-Allow-Origin-
RUN a2enmod rewrite headers

# 4. Start with base PHP config, then add extensions.
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# 5. Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer



# use your users $UID and $GID below
RUN useradd -G www-data,root -u 1000 -d /home/developer developer
RUN mkdir -p /home/developer/.composer
RUN chown -R developer:developer /home/developer

USER developer

CMD ["apache2-foreground"]

#COPY docker/scripts/init_laravel.sh /tmp
#RUN ["chmod", "+x", "/tmp/init_laravel.sh"]
#CMD ["/tmp/init_laravel.sh"]

# COPY entrypoint.sh /usr/bin
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT [ "entrypoint.sh" ]
# EXPOSE 3000
