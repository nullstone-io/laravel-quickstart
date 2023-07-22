# syntax=docker/dockerfile:1
FROM nullstone/laravel

# Copy code, install dependencies
COPY --chown=www-data:www-data . .
RUN composer install --optimize-autoloader --no-dev
RUN chown -R www-data:www-data /app/storage
RUN chmod -R 755 /app/storage
