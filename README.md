# laravel-quickstart

This is a PHP Laravel Quickstart for [Nullstone](https://nullstone.io).

This is based on the Laravel [install guide](https://laravel.com/docs/8.x/installation).

This example is configured with the following:
- static assets served through nginx
- postgresql database

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

## How to launch via Nullstone

1. Create postgresql datastore.
2. Create a public container app named `laravel-quickstart`.
3. Add the postgresql datastore (from step 1) to the app.
4. Add a `APP_KEY for Laravel` capability to the app.
5. Add a `Nginx Sidecar for Fargate Service` capability to the app.
6. Add a subdomain to the app to make it accessible to the public.

```shell
docker build -t laravel-app .
nullstone launch --source=laravel-app --app=laravel-quickstart --env=dev
```

