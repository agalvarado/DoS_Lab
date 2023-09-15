# Usamos una imagen base de Ubuntu
FROM ubuntu:20.04

# Actualizar e instalar Nginx, Fail2Ban y apache2-utils
RUN apt-get update && \
    apt-get install -y nginx fail2ban apache2-utils ufw && \
    htpasswd -cb /etc/nginx/.htpasswd Admin Admin

# Copiamos las configuraciones de Nginx y Fail2Ban
COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-enabled/default
COPY jail.local /etc/fail2ban/jail.local

# Copiar el script de entrada al contenedor y darle permisos de ejecución
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exponemos el puerto 80 para Nginx
EXPOSE 80

# Usar el script de entrada
ENTRYPOINT ["/entrypoint.sh"]
