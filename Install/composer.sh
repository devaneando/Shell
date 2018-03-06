#! /usr/bin/env bash

# ●▬▬▬▬▬๑۩  Install Composer ۩๑▬▬▬▬▬●

if [ ! -f /usr/bin/php ]; then
	die "Can't install composer without php-cli"
fi

printInfo "Installing composer..."

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --force --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

composer global require --no-suggest --dev --verbose \
    escapestudios/symfony2-coding-standard:3.x-dev \
    friendsofphp/php-cs-fixer \
    jakub-onderka/php-var-dump-check \
    jakub-onderka/php-console-highlighter \
    phing/phing \
    phploc/phploc \
    phpmd/phpmd \
    phpstan/phpstan \
    phpstan/phpstan-doctrine \
    phpunit/dbunit \
    phpunit/phpunit \
    sebastian/phpcpd \
    symfony/expression-language \
    symfony/proxy-manager-bridge \
    squizlabs/php_codesniffer

${HOME}/.composer/vendor/bin/phpcs --config-set \
    installed_paths ${HOME}/.composer/vendor/escapestudios/symfony2-coding-standard
${HOME}/.composer/vendor/bin/phpcs --config-set default_standard Symfony
${HOME}/.composer/vendor/bin/phpcs --config-set report_format summary
${HOME}/.composer/vendor/bin/phpcs --config-set show_warnings 0
${HOME}/.composer/vendor/bin/phpcs --config-set show_progress 1
${HOME}/.composer/vendor/bin/phpcs --config-set colors 1
${HOME}/.composer/vendor/bin/phpcs --config-set error_severity 4
${HOME}/.composer/vendor/bin/phpcs --config-set report_width 120
${HOME}/.composer/vendor/bin/phpcs --config-set tab_width 4
${HOME}/.composer/vendor/bin/phpcs --config-set php_version 70113
${HOME}/.composer/vendor/bin/phpcs --config-set ignore_warnings_on_exit 1
${HOME}/.composer/vendor/bin/phpcs --config-set php_path /usr/bin/php

# ●▬▬▬▬▬๑۩  Install Symfony installer ۩๑▬▬▬▬▬●

printInfo "Installing Symfony installer..."

php -r "file_put_contents('symfony', file_get_contents('https://symfony.com/installer'));"
sudo chmod 755 ./symfony
sudo mv --force --verbose symfony /usr/local/bin/

# ●▬▬▬▬▬๑۩  Make tools globally available ۩๑▬▬▬▬▬●

printInfo "Making tools globally available..."

sudoLinkFile ${HOME}/.composer/vendor/bin/phpcs /usr/bin/phpcs
sudoLinkFile ${HOME}/.composer/vendor/bin/php-cs-fixer /usr/local/bin/php-cs-fixer
sudoLinkFile ${HOME}/.composer/vendor/bin/phpstan /usr/local/bin/phpstan
