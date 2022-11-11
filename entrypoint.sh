#!/bin/bash
chown www-data:www-data -R /var/www/!(.git);
find /var/www ! -path '/var/www/.git/*' -type f -exec chmod 644 {} \; 
find /var/www ! -path '/var/www/.git/*' -type d -exec chmod 755 {} \;

# for Laravel
chgrp -R www-data storage /var/www/bootstrap/cache;
chmod -R ug+rwx storage /var/www/bootstrap/cache;
service supervisor start

php-fpm;
