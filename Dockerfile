# syntax=docker/dockerfile:1
FROM nullstone/laravel

# Copy code, install dependencies
COPY --chown=nobody:nobody . .
RUN composer install --optimize-autoloader --no-dev

# Cache config and routes
RUN php artisan config:cache
RUN php artisan route:cache
