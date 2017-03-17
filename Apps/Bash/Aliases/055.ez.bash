function eZClear()
{
    if [ -d app/cache ]; then
        rm -Rf app/cache/*
    fi

    if [ -d app ]; then
        /usr/bin/env php app/console cache:clear --env=prod
    fi

}

function eZ54Clear()
{
    if [ -d ezpublish_legacy/var/cache ]; then
        rm -Rf ezpublish/cache/*
        rm -Rf ezpublish_legacy/var/cache/*
        rm -Rf ezpublish_legacy/var/*/cache/*ez

        /usr/bin/env php ezpublish/console cache:clear --env=prod --no-debug
        /usr/bin/env php ezpublish/console ezpublish:legacy:script --env=prod bin/php/ezcache.php --clear-all --expiry=now --purge

    fi
}

function eZAssets()
{

    if [ -d app ]; then
        /usr/bin/env php app/console cache:clear --env=prod
        /usr/bin/env app/console assetic:dump
        /usr/bin/env app/console assets:install
    fi

}

function eZ54Update()
{


    env echo -e "\e[97m Don't forget to  edit your ezpublish/EzPublishKernel.php file and add\e[0m"
    env echo -e "\e[93m \tuse eZ\Bundle\EzPublishLegacySearchEngineBundle\EzPublishLegacySearchEngineBundle;\e[0m"
    env echo -e "\e[97m also, just before 'new EzPublishLegacyBundle( \$this ),' add \e[0m"
    env echo -e "\e[93m \tnew EzPublishLegacySearchEngineBundle(),\e[0m"
    env echo -e "\e[44m\e[97m do you want to proceed? \e[0m"
    read -p "" -n 1 -r
    echo

    # First install Composer v1.0 that works with old version of ezpublish-legacy-installer
    php -r "copy('https://getcomposer.org/download/1.0.3/composer.phar', 'composer.phar');"

    # Then install newer version
    php -d memory_limit=-1 composer.phar update --no-dev --prefer-dist --no-scripts ezsystems/ezpublish-legacy-installer

    rm composer.phar

    composer remove --no-update --dev behat/mink-selenium-driver

    composer require --no-update symfony/symfony:~2.7.0 sensio/distribution-bundle:~3.0

    composer update --no-dev --prefer-dist

}
