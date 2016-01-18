FROM nginx:1.9

RUN rm -f /etc/nginx/sites-available/*
RUN rm -f /etc/nginx/sites-enabled/*
RUN rm -f /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/sites-enabled/

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80