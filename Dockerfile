FROM php:7.3-apache

RUN apt-get update && apt-get install -y imagemagick graphicsmagick msmtp dcraw

RUN a2enmod rewrite

RUN a2enmod expires

RUN docker-php-ext-install mysqli
