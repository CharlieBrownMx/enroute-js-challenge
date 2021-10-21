# Javascript Fullstack - Code Challenge!

## Setup

Run the following in the root directory in order to update the git submodules:

```
git submodule update --init --recursive
```

Inside the **enroute** directory, run the following commands:

```
docker-compose up -d db_test
```

This will create the **test_db** container and set it up, after it's created, the following will be required for populating the **test_db** container with the **employees** database.

```
docker run -it --rm --network enroute -v "$(pwd)/../db/test_db/:/mnt/test_db" mysql:5.7 bash -c "cd /mnt/test_db && mysql -uenroute -ppassword -henroute_db_test_1 employees < ./employees.sql"
```

When the importation finishes, the **test_db** instance would be setup and ready to be used.
