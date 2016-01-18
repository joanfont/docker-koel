FROM library/php:7.0.2-fpm

RUN apt-get update \
    && apt-get -y -q install git curl zlib1g-dev build-essential\
    && docker-php-ext-install pdo_mysql mbstring zip\
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_4.x | bash - \
    && apt-get install -y -q nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN groupadd -r koel -g 1000 \
#    && useradd -u 1000 -r -g koel -d /app -s /sbin/nologin -c "Docker image user" koel\ 
#    && mkdir -p /app \
#    && chown -R koel:koel /app


WORKDIR /app

RUN npm install -g npm@latest
RUN npm install -g npm-install-missing gulp bower

#USER koel

RUN git clone https://github.com/phanan/koel 

WORKDIR /app/koel

RUN git fetch --all \
    && git checkout v1.1.2 

RUN composer install
COPY .env .env
#USER root
VOLUME /app/koel
CMD ["php-fpm","-F"]
