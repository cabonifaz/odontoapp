#!/usr/bin/env bash
# Arranque del contenedor en Railway:
#  1. Enlaza las carpetas donde la app escribe archivos a un volumen persistente.
#  2. Corrige Apache (un solo MPM) y lo pone a escuchar en $PORT.
set -euo pipefail

APP_DIR=/var/www/html
DATA_DIR="${PERSISTENT_DIR:-/data}"
PORT="${PORT:-8080}"

# Carpetas que la app genera en tiempo de ejecución (facturas, XML/CDR de SUNAT, certificados).
# Los .pfx y signature.php de public/sunat_files son código desplegado y se quedan en la imagen.
PERSISTENT_PATHS=(
    storage/app
    public/sunat_files/xml
    public/sunat_files/cdr
    public/sunat_files/firma
    public/certificados
    public/certificadosmentor
)

if [ -d "$DATA_DIR" ]; then
    for rel in "${PERSISTENT_PATHS[@]}"; do
        src="$APP_DIR/$rel"
        dst="$DATA_DIR/$rel"
        mkdir -p "$dst"
        # Primer arranque: siembra el volumen con lo que trae la imagen sin pisar lo existente.
        if [ -d "$src" ] && [ ! -L "$src" ]; then
            cp -an "$src/." "$dst/"
            rm -rf "$src"
        fi
        mkdir -p "$(dirname "$src")"
        ln -sfn "$dst" "$src"
    done
    mkdir -p "$DATA_DIR/storage/app/public"

    # Certificados SUNAT: si la imagen aún trae .pfx/.p12 en public/, se mueven a la carpeta
    # privada del volumen (sin pisar los existentes) y se eliminan de public/.
    CERT_DIR="$DATA_DIR/storage/app/sunat_certs"
    mkdir -p "$CERT_DIR"
    shopt -s nullglob nocaseglob
    for cert in "$APP_DIR"/public/sunat_files/*.pfx "$APP_DIR"/public/sunat_files/*.p12; do
        cp -n "$cert" "$CERT_DIR/"
        rm -f "$cert"
    done
    shopt -u nullglob nocaseglob
    chmod 700 "$CERT_DIR"

    chown -R www-data:www-data "$DATA_DIR"
    echo "[entrypoint] Almacenamiento persistente montado en $DATA_DIR"
else
    echo "[entrypoint] AVISO: $DATA_DIR no existe; los archivos generados se perderán en cada despliegue"
fi

# public/storage -> storage/app/public (las facturas se sirven como /storage/...)
ln -sfn "$APP_DIR/storage/app/public" "$APP_DIR/public/storage"

# En Railway reaparecen los mpm_* borrados en build: forzar solo prefork (requerido por mod_php).
rm -f /etc/apache2/mods-enabled/mpm_event.* /etc/apache2/mods-enabled/mpm_worker.*
a2enmod -q mpm_prefork

sed -i "s/Listen .*/Listen ${PORT}/" /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*:[0-9]*>/<VirtualHost *:${PORT}>/" /etc/apache2/sites-available/000-default.conf

exec apache2-foreground
