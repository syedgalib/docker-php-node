FROM php:7.4.33-fpm

# Set Node.js version
ENV NODE_VERSION=22.19.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    unzip \
    libicu-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libsqlite3-dev \
    zlib1g-dev \
    msmtp \
    xz-utils \ 
    default-mysql-client

# Install PHP extensions needed for WordPress
RUN docker-php-ext-install mysqli pdo pdo_mysql intl mbstring zip

# Remove apt lists
RUN rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

# Configure msmtp
RUN echo "defaults" > /etc/msmtprc \
 && echo "auth           off" >> /etc/msmtprc \
 && echo "tls            off" >> /etc/msmtprc \
 && echo "logfile        /var/log/msmtp.log" >> /etc/msmtprc \
 && echo "account mailpit" >> /etc/msmtprc \
 && echo "host mailpit" >> /etc/msmtprc \
 && echo "port 1025" >> /etc/msmtprc \
 && echo "from no-reply@wp-admin.com" >> /etc/msmtprc \
 && echo "account default : mailpit" >> /etc/msmtprc \
 && chown www-data:www-data /etc/msmtprc \
 && chmod 600 /etc/msmtprc

# Prepare log file
RUN mkdir -p /var/log \
 && touch /var/log/msmtp.log \
 && chown www-data:www-data /var/log/msmtp.log \
 && chmod 644 /var/log/msmtp.log

# Ensure PHP-FPM uses msmtp for mail()
RUN echo "sendmail_path = /usr/bin/msmtp -t -f no-reply@wp-admin.com" > /usr/local/etc/php/conf.d/sendmail.ini

# Detect arch and install matching Node.js binary
RUN ARCH="$(dpkg --print-architecture)" \
 && if [ "$ARCH" = "amd64" ]; then ARCH_ALIAS="x64"; \
    elif [ "$ARCH" = "arm64" ]; then ARCH_ALIAS="arm64"; \
    else echo "Unsupported arch: $ARCH" && exit 1; fi \
 && curl -fsSL https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH_ALIAS.tar.xz \
    | tar -xJ -C /usr/local --strip-components=1 \
 && ln -s /usr/local/bin/node /usr/local/bin/nodejs

# Install Yarn & pnpm globally
RUN npm install -g yarn pnpm

# Workdir
WORKDIR /var/www/html/wp-content
