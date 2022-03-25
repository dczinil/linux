# Dar permisos en este caso se usa de ejemplo el proceso de apache
:~$ /usr/sbin/semanage permissive -a httpd_t

# Negar accesos en este caso se usa como ejemplo el proceso de apache
:~$ /usr/sbin/semanage permissive -d httpd_t