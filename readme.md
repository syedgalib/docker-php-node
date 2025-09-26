# php-node

A versatile Docker image based on **PHP 7.4.33-FPM** with a full developer stack for modern web applications. This image comes pre-configured with essential tools for PHP, Node.js, and frontend/backend development. It is designed to simplify setup and speed up development workflows.

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

## Use Cases
- Web application development with PHP + Node.js stack  
- Running WordPress, Laravel, Symfony, or custom PHP apps  
- Frontend asset compilation using Node.js, Yarn, or PNPM  
- Rapid prototyping with pre-installed development tools  

## Why Use This Image
- Fully set up developer environment in a single image  
- No need to manually install PHP extensions, Node.js, or package managers  
- Optimized for both PHP backend and modern frontend workflows  

## Pull the Image
```bash
docker pull syedgalibahmed/php-node
