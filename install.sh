#!/usr/bin/env bash

# Install prerequisites
sudo apt install software-properties-common -y

# Install Lamp Server
sudo apt update -y && sudo apt uprade -y
sudo apt install lamp-server^ -y

# Install ondrej/php
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y

# Install composer
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo "Composer hash: $HASH"
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo rm /tmp/composer-setup.php

# composer global require "squizlabs/php_codesniffer=*" --dev

# Install NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install --lts
nvm use --lts

# SSH
sudo apt install ssh-client -y
mkdir ~/.ssh

# ------------------------------------------------------------------------------
# Project and profile environment setup
# ------------------------------------------------------------------------------
#
# - Creates a folder called `Code` in /home/<user>.
# - Copies scripts from ./bin to ~/Code/bin and makes them executable
# - Symlink some scripts to /usr/bin
# - Adds .bash_aliases file to root $HOME directory.

echo "Copying script files"
mkdir -p ~/Code
cp -r $PWD/bin ~/Code/bin
chmod a+x -R ~/Code/bin
ln -si ~/Code/bin/www-services /usr/bin/www-services
echo "Done copying script files"

echo "Copying file to ~/.bash_aliases"
cp $PWD/.profile ~/.bash_aliases
source ~/.bashrc
echo "Done copying file to ~/.bash_aliases"

# ------------------------------------------------------------------------------
# Apache setup
# ------------------------------------------------------------------------------
#
# Symlink ~/Code directory as /var/www/html directory.
#

if [ -d "/var/www/html/bin" ] ; then
  echo "Skipping symlink ~/Code => /var/www/html"
else
  echo "Symlink: ~/Code => /var/www/html"
  if [ -d "/var/www/html" ] ; then
    sudo mv /var/www/html /var/www/html.bk
  fi
  sudo ln -s ~/Code /var/www/html
  sudo chmod 755 -R /var/www/html
  sudo rm -rf /var/www/html.bk
  sudo usermod -a -G $USER www-data
  echo "Done symlink"
fi

