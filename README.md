## Serendipity Blog docker-compose

Serendipity is blogging system.
https://github.com/s9y/Serendipity/tree/2.3

## how to start

* clone and run

```
$ git clone https://github.com/yakumo-saki/docker-serendipity.git
$ cd docker-serendipity
$ docker-compose up -d
```

* create DB and user

```
$ docker-compose exec db bash 

root@68ae9ab125ee:/# psql -U postgres
postgres=# create database serendipity;
CREATE DATABASE

postgres=# create user serendipity password 's9y1234';
CREATE ROLE

postgres=# alter database serendipity owner to serendipity;
ALTER DATABASE

postgres=# \q
```

