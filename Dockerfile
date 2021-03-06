FROM php:7.2-fpm-alpine
WORKDIR /var/www/html
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN apk update \
&& apk add --no-cache postgresql-dev libpng-dev libjpeg-turbo-dev icu-dev \
&& docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
&& docker-php-ext-configure intl --enable-intl \
&& docker-php-ext-install exif pdo_pgsql gd intl opcache
