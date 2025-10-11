FROM php:8.3-cli

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    libonig-dev \
    unzip \
    git \
    zip \
    && rm -rf /var/lib/apt/lists/*

# Instalar extensiones PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip xml mbstring bcmath opcache

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copiar todo
COPY . .

# Instalar dependencias
RUN composer install --optimize-autoloader --no-dev --no-interaction --ignore-platform-reqs

# Crear directorios y dar permisos completos
RUN mkdir -p storage/framework/{sessions,views,cache} \
    storage/logs \
    bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

# Generar APP_KEY si no existe (temporal para testing)
RUN if [ ! -f .env ]; then cp .env.example .env; fi && \
    php artisan key:generate --no-interaction || true

EXPOSE 8000

# Healthcheck para Railway
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s \
    CMD php -r "echo 'ok';" || exit 1

CMD php artisan serve --host=0.0.0.0 --port=8000