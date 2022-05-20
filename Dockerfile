# syntax=docker/dockerfile:1
FROM nullstone/laravel

# Copy code, install dependencies
COPY --chown=nobody:nobody . .
RUN composer install --optimize-autoloader --no-dev
