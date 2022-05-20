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
- Error logs
    - Emitted to stdout for docker builds
    - Pretty errors for local development
- Hot reload for local development

## How to launch via Nullstone

1. Create postgresql datastore.
2. Create a public web app. (Remember `app-name` for later)
3. Add the postgresql datastore (from step 1) to the app.
4. Add a subdomain. (this will add a Load Balancer capability)
5. Add the `APP_KEY for Laravel` capability to the app. (This enables encryption of cookies)
6. Add the `Nginx Sidecar for Fargate Service` capability to the app.
7. Provision
  ```shell
  nullstone up --wait --block=<app-name> --env=<env-name>
  ```
4. Build, push, and deploy
  ```shell
  docker build -t laravel-app .
  nullstone launch --source=laravel-app --app=<app-name> --env=<env-name>
  ```

## Running locally

You can run this project locally inside Docker or using a dev server.
The docker setup is configured to hot reload; you don't have to rebuild/restart the container when you change code.

### Docker

```shell
docker compose up
```

Visit [http://localhost:9000](http://localhost:9000).

### Hot reload

The `app` in `docker-compose.yml` is configured to automatically reload changes to files.
You do not need to rebuild/restart the app when making changes to Laravel files.

However, when updating dependencies, you will need to restart your docker container.
The dependencies will be installed on boot of the docker container.

## Details about quickstart

1. `composer create-project laravel/laravel .`
