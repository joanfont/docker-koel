FROM library/php:7.0.2-fpm

RUN apt-get update \
    && apt-get -y -q install git curl zlib1g-dev build-essential\
    && docker-php-ext-install pdo_mysql mbstring zip\
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_4.x | bash - \
    && apt-get install -y -q nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /

COPY .env .env

RUN git clone https://github.com/phanan/koel \
    && cd koel \
	&& git fetch --all \
	&& git checkout v1.1.2

WORKDIR /koel
COPY .env .env

ENV NODE_ENV production
RUN npm install 
RUN composer install

VOLUME /koel
CMD ["php-fpm","-F"]