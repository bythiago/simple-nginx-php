FROM php:7.1-fpm

ARG USER=dev
ARG UID=1000

RUN apt-get update \
    && apt-get install -y zip unzip git sqlite3 libcap2-bin libpng-dev \
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && useradd -G www-data,root -u $UID -d /home/$USER $USER

USER $USER
