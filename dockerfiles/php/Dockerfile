FROM library/php:7.0.2-fpm

RUN apt-get update \
    && apt-get -y -q install git curl zlib1g-dev build-essential\
    && docker-php-ext-install pdo_mysql mbstring zip\
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
    && apt-get install -y -q nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd -r koel -g 1000 \
    && useradd -u 1000 -r -g koel -d /app -s /sbin/nologin -c "Docker image user" koel\ 
    && mkdir -p /app \
    && chown -R koel:koel /app

USER koel
WORKDIR /app
RUN git clone https://github.com/phanan/koel \
    && cd koel \
    && composer install

WORKDIR /app/koel
RUN npm install

COPY .env .env

VOLUME /app/koel

USER root
CMD ["php-fpm","-F"]