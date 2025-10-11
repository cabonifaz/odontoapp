FROM ubuntu:22.04

LABEL maintainer="Taylor Otwell"

WORKDIR /var/www/html

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Instalar dependencias y PHP 8.3 con todas las extensiones
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php -y \
    && apt-get update \
    && apt-get install -y \
        php8.3-cli \
        php8.3-fpm \
        php8.3-gd \
        php8.3-mysql \
        php8.3-pgsql \
        php8.3-sqlite3 \
        php8.3-curl \
        php8.3-mbstring \
        php8.3-xml \
        php8.3-zip \
        php8.3-bcmath \
        php8.3-intl \
        php8.3-soap \
        php8.3-redis \
        curl \
        git \
        unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Verificar que PHP y GD estén disponibles
RUN php -v && php -m | grep gd

# Copiar toda la aplicación
COPY . /var/www/html

# Instalar dependencias de Composer con el flag ignore
RUN composer install --optimize-autoloader --no-dev --no-interaction --ignore-platform-req=ext-gd

# Crear directorios y permisos
RUN mkdir -p storage/framework/{sessions,views,cache} storage/logs bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000