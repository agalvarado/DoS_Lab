# Usamos una imagen base de Ubuntu
FROM ubuntu:20.04

# Actualizar e instalar Nginx, Fail2Ban y apache2-utils
RUN ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime && \
        apt-get update && \
		apt-get -y -q install git curl nano build-essential wget autoconf automake libtool m4 pkg-config libpcre2-dev libpcre++-dev zlib1g-dev bzip2 libbz2-dev fail2ban ufw
    
#Descargar Lighttpd 1.4.56
RUN wget https://github.com/lighttpd/lighttpd1.4/archive/refs/tags/lighttpd-1.4.56.tar.gz ;\
        tar xvzf lighttpd-1.4.56.tar.gz

#Instalar Lighttpd 
RUN cd /lighttpd1.4-lighttpd-1.4.56/ ;\
    ./autogen.sh ;\
    ./configure ;\
    make && make install


# Copiamos las configuraciones de Lighttpd
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY lighttpd.service /etc/systemd/system/lighttpd.service
COPY lighttpd.pid /var/run/lighttpd.pid
COPY index.html /var/www/html/index.html

# Copiamos las configuraciones de Fail2Ban
COPY jail.local /etc/fail2ban/jail.local
COPY lighttpd.fail2ban /etc/fail2ban/filter.d/lighttpd.conf

# Copiar el script de entrada al contenedor y darle permisos de ejecución
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exponemos el puerto 80 para Lighttpd
EXPOSE 80

# Usar el script de entrada
ENTRYPOINT ["/entrypoint.sh"]
