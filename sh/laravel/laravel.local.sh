#!/bin/bash

# initialize laravel
cd /var/www/src
composer install --optimize-autoloader
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Run Laravel migration (by force, since it would be a prod-environment)
php artisan migrate

# Run Apache in "foreground" mode (the default mode that runs in Docker)
apache2-foreground