FROM nginx:1.9
MAINTAINER Joan Font joanfont@gmail.com

RUN rm -f /etc/nginx/sites-available/*
RUN rm -f /etc/nginx/sites-enabled/*
RUN rm -f /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/sites-enabled/

ADD entrypoint.sh /

EXPOSE 80

CMD ["/entrypoint.sh"]
