#!/usr/bin/env bash

# composer
sudo apt-get install composer

# vim
apt-get install vim

# git
apt-get install git
sudo touch .gitconfig
git config --global user.name "Didier Berlioz"
git config --global user.email "berliozd@gmail.com"

# nodejs
curl --silent --location https://deb.nodesource.com/setup_5.x | sudo bash -
sudo apt-get install nodejs

# grunt cli
sudo -i
npm install -g grunt-cli

# sass
sudo gem install sass

# php apache mysql phpmyadmin xdebug
sudo apt-get install php5
sudo apt-get install apache2
sudo apt-get install mysql-server
sudo apt-get install phpmyadmin
sudo apt-get install php5-xdebug
sudo apt-get install phpunit

# cherbouquin
sudo apt-get install php5-curl
sudo apt-get install php-apc
sudo a2enmod rewrite
cdcherbouquin
npm install

# capistrano
sudo apt-get install ruby-full
sudo gem install capistrano

# bower
sudo npm install -g bower

