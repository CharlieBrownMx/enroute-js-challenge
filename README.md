# Javascript Fullstack - Code Challenge!

## Setup

### Git submodules

Run the following in the root directory in order to update the git submodules:

```
git submodule update --init --recursive
```

___

### Spinning up the db container

Inside the **enroute** directory, run the following commands:
```
docker-compose up -d db_test
```
This will build and start the **test_db** container in detached mode, and set up the necessary permissions, you can watch the status of the container by running in a separate terminal the following:
```
watch -n 5 "docker ps -a --format \"table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\""
```
After the **test_db** container is created and gets healthy(it can take a few seconds), the following will be required for populating the **test_db** container with the **employees** database.
```
docker run -it --rm --network enroute -v "$(pwd)/../db/test_db/:/mnt/test_db" mysql:5.7 bash -c "cd /mnt/test_db && mysql -uenroute -ppassword -henroute_db_test_1 employees < ./employees.sql"
```

When the import finishes, the **test_db** instance would be setup and ready to be used.
___
## Backend

To start the **backend** instance, it is assumed that the **test_db** container is built, started in healthy status, and pre-populated with the **employees** database.
___
### Development environment

Inside the **enroute** directory, build the **backend**, run the following to build and start the container:
```
docker-compose build employees
```
```
docker-compose up -d employees
```
Wait until the container gets healthy, the **backend** will be run in watch mode by **nodemon**, go to the `root` directory, then `app/backend/employees-service/app` to start making changes to the code.
___
### Production

Assuming you have the **test_db** container up, healthy and pre-populated with the employees database.
Inside the **enroute/production** directory, build the **backend**, run the following to build and start the container:
```
docker-compose build employees
```
```
docker-compose up -d employees
```
Wait until the container gets healthy, the **backend** will be running in production mode.
___
