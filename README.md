
<p align="center">
	<img src="https://img.shields.io/badge/status-finished-success?color=%2312bab9&style=flat-square"/>
	<img src="https://img.shields.io/badge/evaluated-10%20%2F%2004%20%2F%202025-success?color=%2312bab9&style=flat-square"/>
	<img src="https://img.shields.io/badge/score-100%20%2F%20100-success?color=%2312bab9&style=flat-square"/>
	<img src="https://img.shields.io/github/last-commit/diocode/42-Inception?color=%2312bab9&style=flat-square"/>
	<a href='https://www.linkedin.com/in/diogo-gsilva' target="_blank"><img alt='Linkedin' src='https://img.shields.io/badge/LinkedIn-100000?style=flat-square&logo=Linkedin&logoColor=white&labelColor=0A66C2&color=0A66C2'/></a>
</p>

<p align="center">
	<a href="#about">About</a>
</p>

## ABOUT ([Subject](/.github/en.subject.pdf))

**Inception** is a foundational DevOps project designed to teach infrastructure deployment using **Docker**, **Docker Compose**, and basic **system administration** principles. The goal is to containerize and configure a small web infrastructure composed of essential services while adhering to best practices for security, networking, and container lifecycle management.

This project must be developed **entirely within a Virtual Machine** and focuses on building the infrastructure from the ground up without relying on prebuilt Docker images (except for base Alpine or Debian distributions).

### 🧱 Project Structure

- Every service (NGINX, WordPress, MariaDB) runs in its **own Docker container**.
- All configuration and source files reside in a structured `srcs/` directory.
- A `Makefile` at the root automates the build and setup process via `docker-compose`.
- Dockerfiles are written manually for each service and called through `docker-compose.yml`.
- Environment variables and secrets (like passwords) are managed securely using `.env` files and local secrets folders.

### 🛠 Services Included

- **NGINX** (with TLSv1.2 or TLSv1.3 only)  
- **WordPress** (with PHP-FPM, no NGINX)  
- **MariaDB** (database container)  
- **Volumes** for persistent WordPress data and database storage  
- **Docker network** for inter-container communication  

### 🔐 Security Practices

- No hardcoded passwords or secrets in Dockerfiles or source code  
- All credentials are stored securely in `.env` files and `secrets/` (excluded from version control)
- NGINX is the sole entry point and only exposes port **443** (HTTPS)

### ⚙️ Notable Requirements

- **Containers must restart** automatically on crash  
- **No hacky patches** like `tail -f` or `sleep infinity` allowed  
- **Proper process management** (PID 1) and Dockerfile best practices are followed  
- The domain name is configured to point to the VM's local IP (e.g., `yourlogin.42.fr`)  
- Admin usernames cannot include "admin" in any form  
- All containers are built from scratch — no prebuilt images except Alpine or Debian  

### 📁 Example Directory Layout
```
.
├── Makefile
├── secrets/
│   ├── credentials.txt
│   ├── db_password.txt
│   └── db_root_password.txt
└── srcs/
    ├── .env
    ├── docker-compose.yml
    └── requirements/
        ├── mariadb/
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   ├── conf/
        │   └── tools/
        ├── nginx/
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   ├── conf/
        │   └── tools/
        └── wordpress/
            ├── Dockerfile
            ├── .dockerignore
            ├── conf/
            └── tools/
```
#### MAKEFILE COMMANDS
`make` or `make all` - Compile program **mandatory** files.

`make clean` - Delete all .o (object files) files.

`make fclean` - Delete all .o (object file) and .a (executable) files.

`make re` - Use rules `fclean` + `all`.
