function eZClear()
{

    if [ -d app ]; then
        rm -Rf app/cache/*
        /usr/bin/env php app/console cache:clear --env=prod
    fi

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

    if [ -d ezpublish ]; then
        /usr/bin/env php ezpublish/console cache:clear --env=prod
        /usr/bin/env ezpublish/console assetic:dump
        /usr/bin/env ezpublish/console assets:install
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
