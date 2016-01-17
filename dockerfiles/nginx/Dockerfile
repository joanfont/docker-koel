FROM nginx:1.9

RUN rm -f /etc/nginx/sites-available/*
RUN rm -f /etc/nginx/sites-enabled/*
RUN rm -f /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/sites-enabled/

RUN apt-get update \
	&& apt-get -y -q install git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /app
RUN git clone https://github.com/phanan/koel 

EXPOSE 80