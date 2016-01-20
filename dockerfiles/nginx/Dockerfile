FROM nginx:1.9

RUN rm -f /etc/nginx/sites-available/*
RUN rm -f /etc/nginx/sites-enabled/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/sites-enabled/

ADD entrypoint.sh /

EXPOSE 80

CMD ["/entrypoint.sh"]
