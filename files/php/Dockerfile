FROM php:7.4-fpm
LABEL maintainer="wjim"


# set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Set default apt-get source
COPY ./scripts/ /data/scripts/
RUN  /data/scripts/source.sh
# RUN service cron start
# Install package and PHP Core extensions
RUN apt-get update && apt-get install -y \ 
        vim \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install zip \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install opcache \
        && docker-php-ext-install mysqli \
        && rm -r /var/lib/apt/lists/*
# Copy extensions had downloaded
COPY ./pkg/redis.tgz /home/redis.tgz
COPY ./pkg/cphalcon.tar.gz /home/cphalcon.tar.gz

# Install Composer
ENV COMPOSER_HOME /root/composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

WORKDIR /data

# Write Permission
RUN usermod -u 1000 www-data
