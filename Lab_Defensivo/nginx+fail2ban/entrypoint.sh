#!/bin/bash
echo 'set editing-mode vi' >> /etc/inputrc
# Iniciar Nginx en segundo plano
touch /var/log/auth.log
chmod 644 /var/log/auth.log
logpath=/var/log/auth.log
nginx
# Iniciar Fail2Ban en segundo plano
fail2ban-server -b
service fail2ban enable
service fail2ban start
# Mantener el contenedor en ejecución
tail -f /dev/null
