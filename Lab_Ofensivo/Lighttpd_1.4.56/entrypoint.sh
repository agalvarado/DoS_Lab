#!/bin/bash
# Crear Directorios
mkdir -p /var/www/html
mkdir -p /var/cache/lighttpd/uploads
mkdir -p /var/log/lighttpd/
mkdir -p /var/run/
mkdir -p /var/cache/lighttpd/compress/
mkdir -p /usr/share/lighttpd/
mkdir -p /etc/lighttpd/conf-enabled/

chmod 755 /var/www/html
chmod 755 /var/cache/lighttpd/uploads
chmod 755 /var/log/lighttpd/
chmod 755 /var/run/
chmod 755 /var/cache/lighttpd/compress/
chmod 755 /usr/share/lighttpd/
chmod 755 /etc/lighttpd/
chmod 755 /etc/lighttpd/conf-enabled/

touch /var/log/lighttpd/error.log /var/log/lighttpd/access.log
chmod 755 /var/log/lighttpd/error.log /var/log/lighttpd/access.log

touch /var/log/auth.log
chmod 644 /var/log/auth.log

# ASIGNAR A WWW-DATA COMO PROPIETARIO DE LAS CARPETAS
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


# Iniciar lighttpd en segundo plano

service lighttpd start

# Mantener el contenedor en ejecución
tail -f /dev/null
