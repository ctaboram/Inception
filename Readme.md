*This project has been created as part of the 42 curriculum by ctaboada.*

# Inception

## Description
This project aims to broaden knowledge of system administration by using Docker. It consists of setting up a small infrastructure composed of different services under specific rules within a personal virtual machine.

The goal is to deploy a LEMP-like stack (Linux, NGINX, MariaDB, PHP) using isolated Docker containers. The infrastructure is managed using `docker-compose.yml` and is built from scratch using custom Dockerfiles.

### Main Design Choices & Sources
- **Base Image:** Debian (Bookworm) is used as the base image for all containers to ensure stability and compatibility.
- **Services:**
  - **NGINX:** Acts as the sole entry point to the infrastructure via port 443 (HTTPS), using TLSv1.2/TLSv1.3.
  - **WordPress + PHP-FPM:** Serves the website content. It communicates internally with NGINX.
  - **MariaDB:** Relational database used by WordPress to store its data.
- **Process Management:** All services run in the foreground (e.g., `daemon off;` for NGINX) to prevent containers from stopping.

### Technical Comparisons

**Virtual Machines vs Docker**
Virtual Machinesvirtualize the hardware, meaning each VM runs a full guest Operating System on top of a hypervisor. This makes them heavy and resource-intensive. Docker, on the other hand, virtualizes the OS. Containers share the host's OS kernel, making them lightweight, fast to start, and highly efficient in resource usage.

**Secrets vs Environment Variables**
Environment variables are key-value pairs used to pass configuration data into containers. However, they can be exposed through system commands or logs. Docker Secrets provide a more secure mechanism for managing sensitive data by encrypting the data and mounting it securely only into the containers that explicitly need access.

**Docker Network vs Host Network**
Using a Docker Network creates an isolated environment where containers can communicate securely with each other using internal DNS resolution, without exposing their internal ports to the outside world. The Host Network binds the container directly to the host machine's network stack, which removes network isolation and can lead to port conflicts and security risks.

**Docker Volumes vs Bind Mounts**
Bind Mounts link a specific file or directory on the host machine to the container, depending heavily on the host's directory structure and permissions. Docker Volumes are entirely managed by Docker itself. Volumes are safer, easier to back up, and abstract the underlying OS path, making them the preferred choice for persistent storage.

---

## Instructions

### Prerequisites
Before running the project, make sure Docker and Docker Compose are installed on your system. You must also configure your local domain name.
Append the following line to your `/etc/hosts` file:
```bash
127.0.0.1   ctaboada.42.fr
```

### Build and Execution
A `Makefile` is provided at the root of the repository to manage the application lifecycle.

1. **Start the infrastructure:**
   ```bash
   make all
   ```

2. **Access the website:**
   Open your web browser and navigate to: `https://ctaboada.42.fr`

3. **Stop the containers:**
   ```bash
   make down
   ```

4. **Clean up everything:**
   ```bash
   make fclean
   ```

   *Warning:* This will stop all containers, prune the Docker system, and forcefully delete all persistent data from the host directories.

## Resources

- [Docker Official Documentation](https://docs.docker.com/)
- [NGINX Official Documentation](https://nginx.org/en/docs/)
- [WordPress CLI Documentation](https://make.wordpress.org/cli/handbook/)
- [MariaDB Knowledge Base](https://www.google.com/search?q=https://mariadb.com/kb/en/)

### AI Usage
During the development of this project, Artificial Intelligence (LLM) was used as a learning and troubleshooting tool:

- To debug and resolve `404 Not Found` repository errors when fetching Debian packages by migrating from Debian Bullseye to Bookworm.
- To understand the correct implementation of NGINX configuration blocks for PHP-FPM communication.
- To gather theoretical comparisons between virtualization technologies and network types for this documentation.