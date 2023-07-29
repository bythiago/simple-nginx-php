FROM php:8.2-fpm

ARG USER=dev
ARG UID=1000

RUN apt-get update \
    && apt-get install -y zip unzip git sqlite3 \
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd -G www-data,root -u $UID -d /home/$USER $USER

USER $USER
