FROM php:5.6-apache
MAINTAINER Fabio Coelho <fvcoelho@gmail.com>

# Enable Apache Rewrite Module
RUN a2enmod rewrite

# Install PHP extensions
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev zip unzip && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd 
RUN docker-php-ext-install mysqli
RUN apt-get update && apt-get install -y cron

WORKDIR /var/www/html

EXPOSE 80
