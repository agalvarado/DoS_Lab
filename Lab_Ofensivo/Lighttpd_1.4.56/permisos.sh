#!/bin/bash

# Definir las rutas locales en lugar de /workspace
LIGHTTPD_ROOT="/var/www/html"
LIGHTTPD_LOG="/var/log/lighttpd/error.log"
LIGHTTPD_CONF="/etc/lighttpd"
LIGHTTPD_UPLOADS="/var/cache/lighttpd/uploads"
LIGHTTPD_RUN="/var/run"
LIGHTTPD_COMPRESS="/var/cache/lighttpd/compress"
LIGHTTPD_SHARE="/usr/share/lighttpd"
LIGHTTPD_CONF_ENABLED="/etc/lighttpd/conf-enabled"
LIGHTTPD_ACCESS="/var/log/lighttpd/access.log"
# Usuario y grupo de Lighttpd (por defecto, "www-data" en Ubuntu)
LIGHTTPD_USER="www-data"
LIGHTTPD_GROUP="www-data"

# Crear directorios

# Cambiar el propietario de los directorios
chown -R $LIGHTTPD_USER:$LIGHTTPD_GROUP $LIGHTTPD_ROOT
chown -R $LIGHTTPD_USER:$LIGHTTPD_GROUP $LIGHTTPD_LOG
chown -R $LIGHTTPD_USER:$LIGHTTPD_GROUP $LIGHTTPD_UPLOADS
chown -R $LIGHTTPD_USER:$LIGHTTPD_GROUP $LIGHTTPD_COMPRESS
chown -R $LIGHTTPD_USER:$LIGHTTPD_GROUP $LIGHTTPD_SHARE
chown -R $LIGHTTPD_USER:$LIGHTTPD_GROUP $LIGHTTPD_ACCESS

# Copiar archivos de configuración
cp -r $LIGHTTPD_CONF/* /etc/

# Vaciar el archivo de registro de errores
> $LIGHTTPD_LOG

echo "Directorios y permisos configurados para Lighttpd localmente."
