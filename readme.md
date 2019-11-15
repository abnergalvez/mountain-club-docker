# Mountain Club Docker

Clonar repositorio:

```sh
$ git clone [REPOSITORIO]
````

Ingresar a la carpeta:

```sh
$ cd mountain-club-docker
```

Clonar código:

```sh
$ git clone [REPOSITORIO] src
```

Copiar archivo de configuración:

```sh
$ cp src/.env.example .env
```

Configurar las variables de entorno en el archivo `.env`:

* DB_HOST=db
* DB_DATABASE=mountainclub
* DB_USERNAME=mountainclub
* DB_PASSWORD=secret

Configurar las variables de entorno en el archivo `docker-compose.yml`:

* MYSQL_ROOT_PASSWORD: secret
* MYSQL_DATABASE: mountainclub
* MYSQL_USER: mountainclub
* MYSQL_PASSWORD: secret

> Los valores de las variables en ambos archivos deben coincidir.

Levantar el entorno:

```sh
$ docker-compose up -d
```

Configuración inicial dentro del servicio `app`:

```sh
$ docker-compose exec app bash -c "php artisan key:generate && php artisan storage:link && php artisan migrate && php artisan db:seed"
```

Escalar el/los servicio `app`:

```sh
$ docker-compose up -d --scale app=2
```

Configurar el/los nuevo/s contener resultante/s del escalado:

```sh
$ docker exec -it [ID] php artisan storage:link
```