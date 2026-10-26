# Developer Documentation - Inception

This document provides technical instructions for developers to set up, build, and manage the Inception project infrastructure.

## 1. Setting Up the Environment

Before starting, ensure that Docker and Docker Compose are installed on the Debian virtual machine.

### Prerequisites and Configuration Files

Add the following entry to `/etc/hosts` so the host resolves the project domain locally:

```text
127.0.0.1    ctaboada.42.fr
```

The environment variables are defined in `srcs/.env`. The file contains the domain, database settings, and WordPress administrator settings used by the startup scripts.

The `srcs/requirements/` directory contains the Dockerfiles and setup scripts for NGINX, WordPress, and MariaDB.

## 2. Building and Launching the Project

The deployment is automated through the `Makefile`.

Build the images and launch the containers with:

```bash
make all
```

This creates the local persistent-storage directories under `/home/ctaboada/data/` and runs:

```bash
docker compose -f srcs/docker-compose.yml up -d --build
```

## 3. Managing Containers and Volumes

View live logs for all services:

```bash
docker compose -f srcs/docker-compose.yml logs -f
```

Open a shell in a container, for example NGINX:

```bash
docker exec -it nginx /bin/bash
```

Stop the services and remove the containers:

```bash
make down
```

Remove the containers and their Docker volumes:

```bash
make clean
```

The `clean` target also prunes unused Docker resources. Use it carefully.

## 4. Project Data Storage and Persistence

The Compose file uses Docker named volumes backed by host directories:

* **MariaDB data:** `/home/ctaboada/data/mariadb`
* **WordPress files and uploads:** `/home/ctaboada/data/wordpress`

Destroying the containers with `make down` does not remove these host directories, so the database and WordPress files persist. Delete the host directories manually only when a complete reset is intended.
