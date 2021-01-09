FROM php:7.3-fpm
LABEL vendor=al3jandroCH
# Instalar dependencias
RUN apt-get update && apt-get install -y \
        build-essential \
        default-mysql-client \
        libpng-dev \
        libzip-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        locales \
        zip \
        jpegoptim optipng pngquant gifsicle \
        vim \
        unzip \
        git \
        curl \
        npm build-essential \
        nano
#instalando laravel
RUN cd /tmp
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer --version
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql
RUN docker-php-ext-install gd zip

RUN apt install nodejs
RUN npm install
RUN npm install -g typescript
RUN tsc --version
RUN npm install -g @angular/cli
RUN ng --version
RUN npm install -g ionic

# WORKDIR /var/www/html/spotiaapp
WORKDIR /var/www/html/angular

CMD ["php-fpm"]