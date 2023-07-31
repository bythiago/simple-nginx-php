FROM php:8.2-fpm as build


RUN apt update \
    && apt install unzip \ 
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /apps

COPY apps .

RUN composer update \ 
    && cp .env.example .env
