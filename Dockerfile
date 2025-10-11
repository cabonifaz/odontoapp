# === Imagen base con PHP 8.3 + Apache ===
FROM php:8.3-apache

# === Instalar dependencias del sistema ===
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

# === Instalar extensiones de PHP necesarias para Laravel ===
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip xml mbstring bcmath opcache

# === Instalar Composer desde la imagen oficial ===
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# === Habilitar mod_rewrite de Apache ===
RUN a2enmod rewrite

# === Configurar Apache para Laravel ===
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Cambiar DocumentRoot a la carpeta /public de Laravel
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Permitir .htaccess overrides para Laravel
RUN echo '<Directory /var/www/html/public>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/conf-available/laravel.conf \
    && a2enconf laravel

# === Establecer el directorio de trabajo ===
WORKDIR /var/www/html

# === Copiar los archivos del proyecto al contenedor ===
COPY . .

# === Instalar dependencias de Laravel ===
RUN composer install --optimize-autoloader --no-dev --no-interaction --ignore-platform-reqs

# === Permisos correctos para Laravel ===
RUN mkdir -p storage/framework/{sessions,views,cache} storage/logs bootstrap/cache \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 storage bootstrap/cache

# === Configurar puerto dinámico para Railway ===
ENV PORT=8080
RUN sed -i "s/80/${PORT}/g" /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# === Exponer el puerto asignado por Railway ===
EXPOSE ${PORT}

# === Comando principal: iniciar Apache ===
CMD ["apache2-foreground"]
