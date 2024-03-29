#!/bin/bash

# Installing Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
export COMPOSER_HOME="$HOME/.config/composer";
php composer-setup.php
php -r "unlink('composer-setup.php');"

#Installing Drush
wget -O /usr/local/src/drush.phar https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
