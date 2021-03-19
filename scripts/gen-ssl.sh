#!/bin/bash
echo "Generating an SSL private key to sign your certificate..."
openssl genrsa -des3 -out pow.dev.key 1024

echo "Generating a Certificate Signing Request..."
openssl req -new -key pow.dev.key -out pow.dev.csr

echo "Removing passphrase from key (for nginx)..."
cp pow.dev.key pow.dev.key.org
openssl rsa -in pow.dev.key.org -out pow.dev.key
rm pow.dev.key.org

echo "Generating certificate..."
openssl x509 -req -days 365 -in pow.dev.csr -signkey pow.dev.key -out pow.dev.crt

echo "Creating ssl cert dir"
mkdir -p  /usr/local/etc/nginx/ssl

echo "Copying certificate (pow.dev.crt) to /etc/ssl/"
cp pow.dev.crt /usr/local/etc/nginx/ssl/

echo "Copying key (pow.dev.key) to /etc/ssl/"
cp pow.dev.key /usr/local/etc/nginx/ssl/
