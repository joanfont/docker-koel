docker-koel
===========
Koel music server dockerized into three separate docker containers.

* db: MariaDB 10.0
* php: PHP-FPM 7.0.2
* nginx: nginx 1.9

### Prerequisites
You must have installed in your computer `docker-compose`.

### Running
First set the environment vars: `ADMIN_EMAIL`, `ADMIN_PASSWORD` and `ADMIN_NAME` located in `dockerfiles/php/.env`

Put your media files into `./media/` folder.

Then run:

```bash
docker-compose pull
docker-compose build
docker-compose up -d web
```

To configure the app for the first time just run:

 ```bash
 docker exec -it dockerkoel_php_1 bash
 php artisan init # Configure database structure
 php artisan koel:sync # Dump music info into the database
```
