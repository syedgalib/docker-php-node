# php-node

A versatile Docker image based on **PHP 7.4.33-FPM** with a full developer stack for modern web applications.  
This image comes pre-configured with essential tools for PHP, Node.js, and frontend/backend development.  
It is designed to simplify setup and speed up development workflows.

👉 **Docker Hub Repository:** [syedgalibahmed/php-node](https://hub.docker.com/r/syedgalibahmed/php-node/)

---

## Badges
![Docker Pulls](https://img.shields.io/docker/pulls/syedgalibahmed/php-node)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/syedgalibahmed/php-node)
![Docker Stars](https://img.shields.io/docker/stars/syedgalibahmed/php-node)

---

## Key Features
- **PHP 7.4.33-FPM** with essential extensions enabled:
  - `mysqli`
  - `pdo`
  - `pdo_mysql`
  - `intl`
  - `mbstring`
  - `zip`
- **Composer** for PHP dependency management
- **Node.js 22.19.0** for modern JavaScript development
- **Yarn** and **PNPM** for fast, efficient package management
- **msmtprc** configured for sending emails via SMTP

---

## Use Cases
- Web application development with PHP + Node.js stack  
- Running WordPress, Laravel, Symfony, or custom PHP apps  
- Frontend asset compilation using Node.js, Yarn, or PNPM  
- Rapid prototyping with pre-installed development tools  

---

## Pull the Image
```bash
docker pull syedgalibahmed/php-node
```

---

## Quick Start

Run a container and mount your project into `/var/www/html`:

```bash
docker run -it --rm \
  -v $(pwd):/var/www/html \
  -w /var/www/html \
  syedgalibahmed/php-node bash
```

Inside the container, you can use:

```bash
# Install PHP dependencies
composer install

# Install Node.js dependencies
yarn install
# or
pnpm install

# Run PHP commands
php artisan serve
# or any other PHP CLI tool
```

---

## Example Project

For a ready-to-use Docker + PHP + Node.js starter setup, check out:  
👉 [wp-docker-starter](https://github.com/syedgalib/wp-docker-starter)

---