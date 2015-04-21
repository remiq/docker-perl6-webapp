# docker-perl6-webapp

Docker-compose setup for Perl6+Dancer webapp development.


## Containers

### Web

Perl6 executing application using Bailador (Dancer's Perl6 clone).

### Db

Postgres db

## Usage

### Quick-start

Start everything

    $ docker-compose up

Import Postgres data

    $ docker-compose run --rm db /app/db/init.sh

### Useful commands

Start Perl6 CLI

    $ docker-compose run --rm web perl6

Access Postgres

    $ psql --host=$POSTGRES_HOST --username=$POSTGRES_USER --dbname=$POSTGRES_DATABASE


## Issues

You cannot use `panda`. You should git-clone libraries into web/src/vendors instead of using Perl6 library managers. 

    $ git submodule git@github.com:perl6/DBIish.git web/src/vendors/DBIish

DBIish requires libpq.so. It can be solved by installing libpq-dev package:

    $ apt-get update && apt-get install libpq-dev
    
But the better way was to create docker image including libpq as seen in `web/Dockerfile`.

## Conclusion

Single request with one SELECT takes ~300ms on Intel Xeon CPU E3-1225 V2 @ 3.20GHz. Current Perl6 MoarVM build (2015.03)
is not ready for production.