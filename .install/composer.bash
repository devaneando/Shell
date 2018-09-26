#! /usr/bin/env bash

##### Install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

##### Install composer completion
composer global require bamarni/symfony-console-autocomplete

##### Install php-cs-fixer
sudo wget https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.12.3/php-cs-fixer.phar -O php-cs-fixer
sudo chmod a+x php-cs-fixer
sudo mv --force php-cs-fixer /usr/local/bin/php-cs-fixer

##### Install phpcs
wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -O phpcs
sudo chmod a+x phpcs
sudo mv --force phpcs /usr/local/bin/phpcs
wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar -O phpcbf
sudo chmod a+x phpcbf
sudo mv --force phpcbf /usr/local/bin/phpcbf
