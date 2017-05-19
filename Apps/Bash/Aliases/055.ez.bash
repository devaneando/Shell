function eZClear()
{

    if [ -d app ]; then
        rm -Rf app/cache/*
        /usr/bin/env php -d memory_limit=-1 app/console cache:clear --env=prod
    fi

    if [ -d ezpublish_legacy/var/cache ]; then
        rm -Rf ezpublish/cache/*
        rm -Rf ezpublish_legacy/var/cache/*
        rm -Rf ezpublish_legacy/var/*/cache/*ez

        /usr/bin/env php5.6 -d memory_limit=-1 ezpublish/console cache:clear --env=prod --no-debug
        /usr/bin/env php5.6 -d memory_limit=-1 ezpublish/console ezpublish:legacy:script --env=prod bin/php/ezcache.php --clear-all --expiry=now --purge

    fi

}

function eZAssets()
{
    if [ -d app ]; then
        /usr/bin/env php -d memory_limit=-1 app/console cache:clear --env=prod
        /usr/bin/env php -d memory_limit=-1 app/console assetic:dump
        /usr/bin/env php -d memory_limit=-1 app/console assets:install
    fi

    if [ -d ezpublish ]; then
        /usr/bin/env php5.6 -d memory_limit=-1 ezpublish/console cache:clear --env=prod
        /usr/bin/env php5.6 -d memory_limit=-1 ezpublish/console assetic:dump
        /usr/bin/env php5.6 -d memory_limit=-1 ezpublish/console assets:install
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
    /usr/bin/env php5.6 -d memory_limit=-1 composer.phar update --no-dev --prefer-dist --no-scripts ezsystems/ezpublish-legacy-installer

    rm composer.phar

    /usr/bin/env php5.6 -d memory_limit=-1 /usr/local/bin/composer remove --no-update --dev behat/mink-selenium-driver

    /usr/bin/env php5.6 -d memory_limit=-1 /usr/local/bin/composer require --no-update symfony/symfony:~2.7.0 sensio/distribution-bundle:~3.0

    /usr/bin/env php5.6 -d memory_limit=-1 /usr/local/bin/composer update --no-dev --prefer-dist
}

function eZ53Update()
{

    ##### 5.3.8

    # First install Composer v1.0 that works with old version of ezpublish-legacy-installer
    php -r "copy('https://getcomposer.org/download/1.0.3/composer.phar', 'composer.phar');"
     
    # As authentication is built in to composer now, we can remove the following plugin
    /usr/bin/env php5.6 -d memory_limit=-1 composer.phar remove --no-update --no-plugins bitexpert/composer-authstore-plugin

    # Then install newer version of ezpublish-legacy-installer that works on Composer 1.1
    # (will warn about the outdated versions you have from before)
    /usr/bin/env php5.6 -d memory_limit=-1 composer.phar update --no-dev --prefer-dist --no-scripts \
        ezsystems/ezpublish-legacy-installer
     
    # Then make sure composer is updated to latests
    rm composer.phar

    /usr/bin/env php5.6 -d memory_limit=-1 /usr/local/bin/compose require --no-plugins --no-update \
        "sensio/distribution-bundle ~2.3|~3.0"
    
    ##### 5.3.2

    /usr/bin/env php5.6 -d memory_limit=-1 /usr/local/bin/composer remove --no-update \
        zetacomponents/archive zetacomponents/authentication zetacomponents/authentication-database-tiein \
        zetacomponents/base zetacomponents/cache zetacomponents/configuration zetacomponents/console-tools \
        zetacomponents/database zetacomponents/debug zetacomponents/event-log zetacomponents/feed \
        zetacomponents/image-conversion zetacomponents/mail zetacomponents/mvc-tools zetacomponents/mvc-authentication-tiein \
        zetacomponents/persistent-object zetacomponents/php-generator zetacomponents/signal-slot \
        zetacomponents/system-information

    ##### 5.3.4

    /usr/bin/env php5.6 -d memory_limit=-1 /usr/local/bin/composer remove --no-update --dev behat/mink-selenium-driver

    ##### Clear the caches

    rm ezpublish/cache/*/*ProjectContainer.php
    /usr/bin/env php5.6 -d memory_limit=-1 /usr/local/bin/composer update --no-dev --prefer-dist

    echo "Don't forget to update the database"
    echo "/<ezp5-root>/ezpublish_legacy/update/database/<mysql|postgresql>/5.3/dbupdate-5.3.2-to-5.3.3.sql"
    echo "And if you use Cluster (DFS) the following:"
    echo "/<ezp5-root>/ezpublish_legacy/update/database/mysql/5.3/dbupdate-cluster-5.3.2-to-5.3.3.sql"
}

function eZUpdate()
{
    if [ -d app ]; then
        /usr/bin/env php -d memory_limit=-1 /usr/local/bin/composer update --no-dev --prefer-dist
    else
        /usr/bin/env php5.6 -d memory_limit=-1 /usr/local/bin/composer update --no-dev --prefer-dist
    fi
}

function eZPlatformInstall()
{
    WWW="/var/www"
    FOLDER="NOGO"
    VERSION="NOGO"

    if [[ ${1} == "master" ]]; then
        FOLDER="ezp_18x"
        VERSION="dev-master"
    fi

    if [[ ${1} == "1.9" ]]; then
        FOLDER="/var/www/ezp_19x"
        VERSION="v1.9"
    fi

    if [[ ${1} == "1.8" ]]; then
        FOLDER="/var/www/ezp_18x"
        VERSION="v1.8"
    fi

    if [[ ${1} == "1.7" ]]; then
        FOLDER="/var/www/ezp_17x"
        VERSION="v1.7"
    fi

    if [[ ${1} == "1.6" ]]; then
        FOLDER="/var/www/ezp_16x"
        VERSION="v1.6"
    fi

    if [[ ${FOLDER} == "NOGO" ]]; then
        echo -e "You must use this command in the following format:\neZInstall 1.8"
        return
    fi

    if [[ -d ${WWW}/${FOLDER} ]]; then
        rm -Rf -v ${WWW}/${FOLDER}
    fi

    composer create-project --no-dev --keep-vcs ezsystems/ezplatform "${FOLDER}" ${VERSION}

}

function eZStudionInstall()
{
    WWW="/var/www"
    FOLDER="NOGO"
    VERSION="NOGO"

    if [[ ${1} == "master" ]]; then
        FOLDER="ezp_18x"
        VERSION="dev-master"
    fi

    if [[ ${1} == "1.9" ]]; then
        FOLDER="/var/www/ezp_19x"
        VERSION="v1.9"
    fi

    if [[ ${1} == "1.8" ]]; then
        FOLDER="/var/www/ezp_18x"
        VERSION="v1.8"
    fi

    if [[ ${1} == "1.7" ]]; then
        FOLDER="/var/www/ezp_17x"
        VERSION="v1.7"
    fi

    if [[ ${1} == "1.6" ]]; then
        FOLDER="/var/www/ezp_16x"
        VERSION="v1.6"
    fi

    if [[ ${FOLDER} == "NOGO" ]]; then
        echo -e "You must use this command in the following format:\neZInstall 1.8"
        return
    fi

    if [[ -d ${WWW}/${FOLDER} ]]; then
        rm -Rf -v ${WWW}/${FOLDER}
    fi

    composer create-project --no-dev ezsystems/ezstudio "${FOLDER}" ${VERSION}
    cd "${FOLDER}"
    php -d memory_limit=-1 app/console ezplatform:install --env prod studio-clean

}
