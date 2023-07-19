# syntax=docker/dockerfile:1
FROM nullstone/laravel

# Copy code, install dependencies
COPY . .
RUN composer install --optimize-autoloader --no-dev
RUN chown -R nobody:nobody .
