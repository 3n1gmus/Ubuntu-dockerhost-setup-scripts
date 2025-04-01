# Deps
sudo apt-get install -y  nginx sqlite3 php8.3 php8.3-{gd,mysql,mbstring,bcmath,xml,curl,zip,intl,sqlite3,fpm}

# Install Panel
sudo mkdir -p /var/www/pelican
cd /var/www/pelican
curl -L https://github.com/pelican-dev/panel/releases/latest/download/panel.tar.gz | sudo tar -xzv
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
sudo COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader
sudo chmod -R 755 /var/www/pelican/storage/* /var/www/pelican/bootstrap/cache/
sudo chown -R www-data:www-data /var/www/pelican

# Certificates
mkdir /etc/certs
cd /etc/certs
openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj "/C=NA/ST=NA/L=NA/O=NA/CN=Generic SSL Certificate" -keyout privkey.pem -out fullchain.pem

# setup artisan
cd /var/www/pelican
php artisan p:environment:setup