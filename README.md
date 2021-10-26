# Javascript Fullstack - Code Challenge!

For more details, go to the [Code Challenge](https://github.com/CharlieBrownMx/enroute-js-challenge/blob/master/JS-Challenge-Fullstack.20211006.pdf "Code Challenge") specifications.

## Setup

### Git submodules

Run the following in the **root** directory in order to update the git submodules:

```
git submodule update --init --recursive
```

___

### Database import

These steps are only required the first time the project is freshly cloned, if you already have followed these steps within this repo, you can skip to the **dev** or **prod** instructions.

Inside the **enroute** directory, run the following commands:
```
docker-compose up -d db_test
```
This will build and start the **test_db** container in detached mode, and set up the necessary permissions, you can watch the status of the container by running in a separate terminal the following:
```
watch -n 5 "docker ps -a --format \"table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\""
```
After the **test_db** container is created and gets healthy(it can take a few seconds), the following will be required for populating the **test_db** container with the **employees** database.

Run the following inside the **enroute** directory:
```
docker run -it --rm --network enroute -v "$(pwd)/../db/test_db/:/mnt/test_db" mysql:5.7 bash -c "cd /mnt/test_db && mysql -uenroute -ppassword -henroute_db_test_1 employees < ./employees.sql"
```

When the import finishes, the database will be ready, you can now terminate the db container.
```
docker-compose down
```

___
### Development environment

For these instructions, it is assumed that the **test_db** container is built, and pre-populated with the **employees** database.

Inside the **enroute** directory, build the **development** images:

```
docker-compose build
```
When the images are built, you can now spinup the development environment.

```
docker-compose up -d
```

Wait until all the containers get healthy, the project will be run in watch mode. 
To start making changes, go to the **root** directory and inside **app** you'll find the **backend** and **frontend** services as git submodules.

The application will be forwarded to your localhost on port **8080**.

[Go to the dev employees app](http://localhost:8080 "Go to the dev employees app")
___
### Production

For these instructions, it is assumed that the **test_db** container is built, and pre-populated with the **employees** database.

Inside the **enroute/production** directory, build the **production** images:

```
docker-compose build
```

When the images are built, you can now spinup the production environment.

```
docker-compose up -d
```

Wait until all the containers get healthy, the project will be run in production mode.

The application will be forwarded to your localhost on port **80**(Note that this port is not the same as in development).

[Go to the prod employees app](http://localhost:80 "Go to the prod employees app")
___



