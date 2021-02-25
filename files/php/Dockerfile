FROM php:7.4-fpm
LABEL maintainer="wjim"


# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 设置阿里云镜像
#RUN echo 'deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib \n\
#           deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib \n\
#           deb http://mirrors.aliyun.com/debian-security stretch/updates main \n\
#           deb-src http://mirrors.aliyun.com/debian-security stretch/updates main \n\
#           deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib \n\
#           deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib \n\
#           deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib \n\
#           deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib \n'\
#           > /etc/apt/sources.list

# 设置中科大镜像源
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# 安装PHP核心扩展-单独写方便定位错误
RUN apt-get update
RUN apt install -y libtinfo5 --allow-remove-essential

RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y libzip-dev
RUN apt-get install -y libz-dev
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libwebp-dev
RUN apt-get install -y libmagickwand-dev imagemagick
RUN pecl install imagick
RUN docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2/
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install zip
RUN docker-php-ext-enable imagick
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install opcache
RUN docker-php-ext-install mysqli
RUN rm -r /var/lib/apt/lists/*

# 下载Composer
ENV COMPOSER_HOME /root/composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

# 设置composer镜像
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 设置工作目录
WORKDIR /data

# 权限设置
RUN usermod -u 1000 www-data
