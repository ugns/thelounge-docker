# The Lounge - a self-hosted modern web IRC client

## Overview

This project is taken in part from the [official](https://github.com/thelounge/thelounge-docker)
Docker build with some modifications.

* Use the latest Alpine [Node](https://hub.docker.com/r/library/node/) container as a base
* Upgrade Alpine before installing The Lounge

## Running a container

A container can be started manually:

```sh
$ docker run --detach \
              --name thelounge \
              --publish 9000:9000 \
              --volume ~/.thelounge:/var/opt/thelounge \
              --restart always \
              jtbouse/thelounge:latest
```

## Data persistence

The Lounge reads and stores all its configuration, logs and other data to THELOUNGE_HOME which is
defaulted to /var/opt/thelounge in the container.

*You will probably want to persist the data at this location by using
[one of the means](https://docs.docker.com/storage/) to do so.*

## Adding users

If you're not running The Lounge in public mode, you can add users as follows:

```sh
$ docker exec -it <container name> thelounge add <username>
```

*Note: without [peristing data](#data-persistence), any added users will be lost when the container
is removed.*

## Changing the port that The Lounge will be available on

To change the port on which The Lounge will be available on, you will have to change the host port
mapping. To make The Lounge available on e.g. port 5000:

```sh
$ docker run --detach \
              --name thelounge \
              --publish 5000:9000 \
              --volume ~/.thelounge:/var/opt/thelounge \
              --restart always \
              jtbouse/thelounge:latest
```

## Environment variables (advanced usage)

You can control how The Lounge is started inside the container through the following environment
variables:

- `HOST` (equivalent to the `-H, --host` CLI option)
- `PORT` (equivalent to the `-P, --port` CLI option)
- `BIND` (equivalent to the `-B, --bind` CLI option)
