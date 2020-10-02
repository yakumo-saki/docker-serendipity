FROM php:7.4-fpm

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libonig-dev \
        libpq-dev \
        default-libmysqlclient-dev \
        imagemagick \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mbstring pdo pdo_pgsql pgsql pdo_mysql \
    && apt-get install --no-install-recommends -y ca-certificates git \
    && apt-get clean \
    && echo "install pre-requirements done"

# 
ENV S9Y_VER=2.3
RUN git clone https://github.com/s9y/Serendipity.git /base/ \ 
    && cd /base/ \
    && git checkout $S9Y_VER \
    && cd /base && git rev-parse HEAD > VERSION \
    && rm -rf /base/.git \
    && echo "git checkout done"

RUN echo "file_uploads = On\n" \
         "memory_limit = 128M\n" \
         "upload_max_filesize = 15M\n" \
         "post_max_size = 15M\n" \
         "max_execution_time = 600\n" \
         > /usr/local/etc/php/conf.d/s9y.ini

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/tini", "--", "/entrypoint.sh"]  
