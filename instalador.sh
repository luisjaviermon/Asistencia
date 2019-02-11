#!/bin/bash
unzip aistencia.zip
#verifica que existan los servicios
yum update
yum install vsftpd
systemctl start vsftpd.service
systemctl enable vsftpd.service
yum install httpd
service httpd restart
chkconfig httpd on
yum install php
service httpd restart
yum install php-mysql
service httpd restart
yum install mysql-server mysql
service mysqld restart
chkconfig mysqld on
#crea la base de datos
nano /etc/mysql
perl -pi -e "s[bind-address][#bind-address]g" my.cnf
/etc/init.d/mysql restart
mysql -u root -p
GRANT ALL PRIVILEGES ON *.* TO vromero@"192.168.1.%"
IDENTIFIED BY "nomad123"
CREATE DATABASE asistencia
mysql -u root -p asistencia < asistencia.sql
#crea los directorios de apache
cd /var/www/html/
mkdir asistencia
#mover archivos en servidor apache
cd
cd Descargas
cd asistencia
mv src /var/www/html/asistencia
systemctl restart httpd
#crear usuario de administrador en webservice

#registrar en crontab los scripts .sh


#################importante########################
##uso de apache primer link
#https://luigiasir.wordpress.com/2017/11/19/servidor-web-apache-en-centos-7/
###comprobar lo ya creado en una maquina virtual###
#####Crear script para eliminar lo ya creado#######
