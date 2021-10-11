#!/bin/bash
chown www-data:www-data -R /var/www;
find /var/www -type f -exec chmod 644 {} \; 
find /var/www -type d -exec chmod 755 {} \;

# for Laravel
#chgrp -R www-data storage /var/www/bootstrap/cache;
#chmod -R ug+rwx storage /var/www/bootstrap/cache;
#service supervisor start

php-fpm
