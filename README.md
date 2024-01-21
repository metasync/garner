# Garner

This is a sample application based on Garnet.

## Setup

Go to your project directory:

```
cd /path/to/your/project/home
```

### Code Repos Cloning

Clone Garnet gem from Github:

```
git clone https://github.com/metasync/garnet.git
```

Then clone Garner app from Github:

```
git clone https://github.com/metasync/garner.git
```

### Build Dev Image

YOu need to build development container image before bringing up the development environment via docker-compose:

```
cd garner/docker
make build.dev
```

After image is built, you can check image info:

```
make image.dev

quay.io/metasync/dataops_garner     0.1.0-dev                                  0be368ffa6b7   9 days ago      378MB
quay.io/metasync/dataops_garner     0.1.0-dev.0                                0be368ffa6b7   9 days ago      378MB
```

### Up & Running Garner App

Now you are ready to bring up Garner app:

```
make up
```

To check if the app/db containers are up:

```
make ps
```

### Setup Database

By default, docker-compose starts up a MSSQL database and you need to create app database before running the Garner app:

```
make shell.app.db
./setup-db.sh
exit
```

### Setup Application

First you need to bundle gem dependencies:

```
make shell.app
bundle install
```

Then run database migration task:

```
rake db:migrate    # run database migration
rake db:reset      # Rerun database migration

rake -T            # To get full list of rake tasks
```

Now you can run the Garner app:

```
ruby run.rb
````

### Shutdown

To bring down the development environment for Garner app, you can run:

```
make down
```

## Switch to PostgreSQL

By default, MSSQL is used as the database engine for Garner app.

You can update the `DEV_DB_TYPE` in `database.env` to switch to use PostgreSQL:

```
cd docker/make.env
vi database.env

... ...
DEV_DB_TYPE=psql
# DEV_DB_TYPE=mssql
... ...

```
