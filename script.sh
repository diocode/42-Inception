#!/bin/bash

rm -rf requirements/nginx/conf/ssl
rm -rf ~/data/database
rm -rf ~/data/wordpress_files

mkdir -p requirements/nginx/conf/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout requirements/nginx/conf/ssl/cert.key \
  -out requirements/nginx/conf/ssl/cert.pem \
  -subj "/C=FR/ST=Paris/L=Paris/O=42/CN=localhost"


mkdir -p ~/data/database
mkdir -p ~/data/wordpress_files
