FROM debian
ARG TARGET_USER
ARG TARGET_GROUP
ARG HOST_UID
ARG HOST_GID
RUN apt update && apt install -y \
    apache2 \
    php-cgi \
    apache2-suexec-pristine \
    vim
RUN mkdir -p /var/run/apache2
RUN addgroup --gid=${HOST_GID} ${TARGET_GROUP}
RUN adduser --uid=${HOST_UID} --gid=${HOST_GID} --disabled-password --gecos="gecos" ${TARGET_USER}
STOPSIGNAL SIGWINCH

COPY httpd-foreground /usr/local/bin/

EXPOSE 80
CMD ["httpd-foreground"]
