FROM php:7.4-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    # telnet \
    # screen \
    #apt-transport-https \
    #ca-certificates \
    #build-essential \
    python \
    supervisor \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    wget

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Npm
# ENV NVM_DIR /usr/local/nvm
# ENV NODE_VERSION 12.22.1

# Install nvm with node and npm
# SHELL ["/bin/bash", "--login", "-c"]

# RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
#     && source $NVM_DIR/nvm.sh \
#     && nvm install $NODE_VERSION \
#     && nvm alias default $NODE_VERSION \
#     && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install extensions
RUN docker-php-ext-install pdo_mysql zip exif pcntl opcache
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# Install Redis
# RUN pecl install -o -f redis \
# &&  rm -rf /tmp/pear \
# &&  docker-php-ext-enable redis

# For Wordpress
# RUN docker-php-ext-install mysqli
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

#For Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Expose port 9000 and start php-fpm server
EXPOSE 9000

USER root
COPY entrypoint.sh /entrypoint.sh
CMD ["/bin/sh", "/entrypoint.sh"]
