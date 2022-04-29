# laravel-quickstart

This is a PHP Laravel Quickstart for [Nullstone](https://nullstone.io).

This is based on the Laravel [install guide](https://laravel.com/docs/8.x/installation).

This quickstart uses the production-ready docker image [nullstone/laravel](https://hub.docker.com/r/nullstone/laravel) that works locally with hot-reload.
The base docker image can be found at [github.com/nullstone-io/docker-laravel](https://github.com/nullstone-io/docker-laravel).

This quickstart is set up with:

- PHP 8
- Laravel
- Static Assets
    - Configured to hot-reload assets for local development
    - Served through NGINX for docker builds
- Postgresql Database
    - Migrations are executed on start of docker image
- Error logs
    - Emitted to stdout for docker builds
    - Pretty errors for local development
- Hot reload for local development

## How to launch via Nullstone

1. Create postgresql datastore.
2. Create a public web app. (Remember `app-name` for later)
3. Add the postgresql datastore (from step 1) to the app.
4. Add the `APP_KEY for Laravel` capability to the app.
5. Add the `Nginx Sidecar for Fargate Service` capability to the app.

```shell
docker build -t laravel-app .
nullstone launch --source=laravel-app --app=<app-name> --env=dev
```

## How to run locally

```shell
docker compose up
```

Visit [http://localhost:3000](http://localhost:3000).

### Hot reload

The `app` in `docker-compose.yml` is configured to automatically reload changes to files.
You do not need to rebuild/restart the app when making changes to Laravel files.

However, when updating dependencies, you will need to restart your docker container.
The dependencies will be installed on boot of the docker container.

