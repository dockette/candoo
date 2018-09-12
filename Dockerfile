FROM php:7.4-fpm-alpine

ENV LD_PRELOAD="/usr/lib/preloadable_libiconv.so php"

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache curl bash git gnu-libiconv@testing

RUN curl https://getcaddy.com | bash -s personal http.expires,http.realip

RUN docker-php-ext-install \
    mbstring \
    mysqli \
    pdo \
    pdo_mysql

RUN apk add --no-cache postgresql-dev && \
    docker-php-ext-install pgsql pdo_pgsql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN echo "memory_limit = 512M" >> /usr/local/etc/php/php.ini && \
    echo "max_execution_time = 300" >> /usr/local/etc/php/php.ini

ADD Caddyfile /etc/Caddyfile

WORKDIR /srv

CMD ["/usr/local/bin/caddy", "--conf", "/etc/Caddyfile", "--log", "stdout"]
