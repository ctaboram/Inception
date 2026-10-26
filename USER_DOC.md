# User Documentation - Inception

This document provides a clear and simple guide for end users and administrators to interact with the Inception project infrastructure.

## 1. Services Provided by the Stack

This project sets up a complete LEMP-like stack using Docker containers:

* **NGINX:** The web server and sole HTTPS entry point on port 443.
* **WordPress:** The content management system, running with PHP-FPM.
* **MariaDB:** The relational database storing WordPress users, posts, and configuration.

## 2. How to Start and Stop the Project

The project lifecycle is managed through the `Makefile`.

To start the project, open a terminal in the repository root and run:

```bash
make all
```

This builds the Docker images and starts the containers in the background.

To stop the project, run:

```bash
make down
```

This stops and removes the containers without deleting persistent data.

## 3. Accessing the Website and Administration Panel

Once the project is running, access the following URLs:

* **Website:** `https://ctaboada.42.fr`
* **Admin panel:** `https://ctaboada.42.fr/wp-admin`

Because the project uses a self-signed SSL certificate, the browser displays a security warning. Select **Advanced** and then proceed to `ctaboada.42.fr`.

## 4. Locating and Managing Credentials

The stack configuration is defined by environment variables in the `.env` file inside `srcs/`.

The file contains the domain, database name and user, and the WordPress administrator credentials. To change credentials for a new installation, edit `.env` before building the containers.

WordPress data is persistent. Changing the administrator values in `.env` does not automatically change an already-installed WordPress account; update that account through WordPress or WP-CLI.

For a real production environment, credentials should not be stored in a public repository.

## 5. Checking if Services Are Running Correctly

Run:

```bash
docker ps
```

The `nginx`, `wordpress`, and `mariadb` containers should all be listed with an `Up` status.
