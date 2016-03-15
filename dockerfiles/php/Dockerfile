FROM library/php:7.0.2-fpm
MAINTAINER Joan Font joanfont@gmail.com

ENV KOEL_VERSION v2.2.0

RUN apt-get update \
    && apt-get -y -q install git curl zlib1g-dev build-essential\
    && docker-php-ext-install pdo_mysql mbstring zip\
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_4.x | bash - \
    && apt-get install -y -q nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

RUN npm install -g npm@latest
RUN npm install -g npm-install-missing gulp bower

RUN git clone https://github.com/phanan/koel

WORKDIR /app/koel

RUN git fetch --all \
    && git checkout $KOEL_VERSION

RUN composer install
COPY .env .env

RUN rm -fr /app/koel/.npm
RUN npm cache clear
RUN rm -fr node_modules
RUN npm install
RUN bower install --allow-root
RUN gulp --production

VOLUME ["/app/koel"]

CMD ["php-fpm","-F"]
