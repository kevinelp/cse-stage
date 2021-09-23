FROM debian
RUN apt update && apt install -y \
    apache2 \
    php-cgi \
    vim
RUN mkdir -p /var/run/apache2

STOPSIGNAL SIGWINCH

COPY httpd-foreground /usr/local/bin/

EXPOSE 80
CMD ["httpd-foreground"]
