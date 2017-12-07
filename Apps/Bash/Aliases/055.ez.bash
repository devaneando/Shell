#!/usr/bin/env bash
# vi:syntax=bash

function eZClear() {

    if [ -d app ]; then
        rm -Rfv app/cache/*
        /usr/bin/env php -d memory_limit=-1 app/console cache:clear --env=prod
    fi

    if [ -d ezpublish ]; then
        rm -Rfv ezpublish/cache/*
        /usr/bin/env php -d memory_limit=-1 ezpublish/console cache:clear --env=prod
    fi

    if [ -d ezpublish_legacy/var/cache ]; then
        rm -Rfv ezpublish_legacy/var/cache/*
        rm -Rfv ezpublish_legacy/var/*/cache/*
        php -d memory_limit=-1 ezpublish/console cache:clear --env=prod --no-debug
        php -d memory_limit=-1 ezpublish/console ezpublish:legacy:script --env=prod bin/php/ezcache.php --clear-all --expiry=now --purge
        php -d memory_limit=-1 ezpublish/console ezpublish:legacy:script --env=prod bin/php/ezpgenerateautoloads.php --progress
    fi

    if [ -d var/cache ]; then
        rm -Rfv var/cache/*
        rm -Rfv var/*/cache/*
        php -d memory_limit=-1 bin/php/ezcache.php --clear-all --expiry=now --purge
        php -d memory_limit=-1 bin/php/ezpgenerateautoloads.php --progress
    fi
}

function eZAssets() {
    if [ -d app ]; then
        /usr/bin/env php -d memory_limit=-1 app/console cache:clear --env=prod
        /usr/bin/env php -d memory_limit=-1 app/console assetic:dump
        /usr/bin/env php -d memory_limit=-1 app/console assets:install
    fi

    if [ -d ezpublish ]; then
        php -d memory_limit=-1 ezpublish/console cache:clear --env=prod
        php -d memory_limit=-1 ezpublish/console assetic:dump
        php -d memory_limit=-1 ezpublish/console assets:install
    fi
}

function eZ54Update() {
    env echo -e "\e[97m Don't forget to  edit your ezpublish/EzPublishKernel.php file and add\e[0m"
    env echo -e "\e[93m \s\s\s\suse eZ\Bundle\EzPublishLegacySearchEngineBundle\EzPublishLegacySearchEngineBundle;\e[0m"
    env echo -e "\e[97m also, just before 'new EzPublishLegacyBundle( \$this ),' add \e[0m"
    env echo -e "\e[93m \s\s\s\snew EzPublishLegacySearchEngineBundle(),\e[0m"
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

function eZ53Update() {

    ##### 5.3.8

    # First install Composer v1.0 that works with old version of ezpublish-legacy-installer
    php -r "copy('https://getcomposer.org/download/1.0.3/composer.phar', 'composer.phar');"

    # As authentication is built in to composer now, we can remove the following plugin
    php -d memory_limit=-1 composer.phar remove --no-update --no-plugins bitexpert/composer-authstore-plugin

    # Then install newer version of ezpublish-legacy-installer that works on Composer 1.1
    # (will warn about the outdated versions you have from before)
    php -d memory_limit=-1 composer.phar update --no-dev --prefer-dist --no-scripts \
        ezsystems/ezpublish-legacy-installer

    # Then make sure composer is updated to latests
    rm composer.phar

    compose require --no-plugins --no-update \
        "sensio/distribution-bundle ~2.3|~3.0"

    ##### 5.3.2

    composer remove --no-update \
        zetacomponents/archive zetacomponents/authentication zetacomponents/authentication-database-tiein \
        zetacomponents/base zetacomponents/cache zetacomponents/configuration zetacomponents/console-tools \
        zetacomponents/database zetacomponents/debug zetacomponents/event-log zetacomponents/feed \
        zetacomponents/image-conversion zetacomponents/mail zetacomponents/mvc-tools zetacomponents/mvc-authentication-tiein \
        zetacomponents/persistent-object zetacomponents/php-generator zetacomponents/signal-slot \
        zetacomponents/system-information

    ##### 5.3.4

    composer remove --no-update --dev behat/mink-selenium-driver

    ##### Clear the caches

    rm ezpublish/cache/*/*ProjectContainer.php
    composer update --no-dev --prefer-dist

    echo "Don't forget to update the database"
    echo "/<ezp5-root>/ezpublish_legacy/update/database/<mysql|postgresql>/5.3/dbupdate-5.3.2-to-5.3.3.sql"
    echo "And if you use Cluster (DFS) the following:"
    echo "/<ezp5-root>/ezpublish_legacy/update/database/mysql/5.3/dbupdate-cluster-5.3.2-to-5.3.3.sql"
}

function eZUpdate() {
    if [ -d app ]; then
        composer update --no-dev --prefer-dist
    else
        composer update --no-dev --prefer-dist
    fi
}

function eZPlatformInstall() {
    case ${1} in
    "master")
        FOLDER="ezp_master"
        VERSION="dev-master"
        ;;
    "1.10")
        FOLDER="ezp_110x"
        VERSION="v1.10"
        ;;
    "1.9")
        FOLDER="ezp_19x"
        VERSION="v1.9"
        ;;
    "1.8")
        FOLDER="ezp_18x"
        VERSION="v1.8"
        ;;
    "1.7")
        FOLDER="ezp_17x"
        VERSION="v1.7"
        ;;
    "1.6")
        FOLDER="ezp_16x"
        VERSION="v1.6"
        ;;
    *)
        echo -e "You must use this command in the following format:\eZPlatformInstall 1.8"
        return
        ;;
    esac

    WWW="/var/www/ez/"

    if [[ ! -d ${WWW} ]]; then
        WWW="$(pwd)"
    fi

    if [[ -d ${WWW}/${FOLDER} ]]; then
        rm -Rf -v "${WWW:?}/${FOLDER}"
    fi

    cd "${WWW}" || exit
    composer create-project --no-dev --keep-vcs ezsystems/ezplatform "${FOLDER}" ${VERSION}
    cd "${FOLDER}" || exit
    php -d memory_limit=-1 app/console ezplatform:install --env prod clean
}

function eZStudioInstall() {
    case ${1} in
    "master")
        FOLDER="ezp_master"
        VERSION="dev-master"
        ;;
    "1.10")
        FOLDER="ezp_110x"
        VERSION="v1.10"
        ;;
    "1.9")
        FOLDER="ezp_19x"
        VERSION="v1.9"
        ;;
    "1.8")
        FOLDER="ezp_18x"
        VERSION="v1.8"
        ;;
    "1.7")
        FOLDER="ezp_17x"
        VERSION="v1.7"
        ;;
    "1.6")
        FOLDER="ezp_16x"
        VERSION="v1.6"
        ;;
    *)
        echo -e "You must use this command in the following format:\neZInstall 1.8"
        return
        ;;
    esac

    WWW="/var/www/ez"

    if [[ ! -d ${WWW} ]]; then
        WWW="$(pwd)"
    fi

    if [[ -d ${WWW}/${FOLDER} ]]; then
        rm -Rf -v "${WWW:?}/${FOLDER}"
    fi

    cd "${WWW}" || exit
    composer create-project --no-dev --keep-vcs ezsystems/ezstudio "${FOLDER}" ${VERSION}
    cd "${FOLDER}" || exit
    php -d memory_limit=-1 app/console ezplatform:install --env prod studio-clean
}

function solrInstall() {
    if [ -z "$1" ]; then
        printError "The Solr version (4 or 6) must be provided.\nExample solrInstall 4 /var/www/ezpublish"
        return 255
    fi

    if [ -z "$2" ] || [ ! -d "$2" ]; then
        printError "The eZ Platform root dir is invalid or does not exist.\nExample solrInstall 4 /var/www/ezpublish"
        return 255
    fi

    EZ_FOLDER="${2}/vendor/ezsystems/ezplatform-solr-search-engine"

    case ${1} in
    "6")
        SOLR_FOLDER="/opt/solr6"
        SOLR_TAR="/tmp/‘solr-6.6.0.tgz"
        SOLR_TAR_FOLDER="/opt/solr-6*"
        SOLR_URL="http://archive.apache.org/dist/lucene/solr/6.6.0/solr-6.6.0.tgz"
        ;;
    "*")
        SOLR_FOLDER="/opt/solr4"
        SOLR_TAR="/tmp/solr-4.10.4.tgz"
        SOLR_TAR_FOLDER="/opt/solr-4*"
        SOLR_URL="http://archive.apache.org/dist/lucene/solr/4.10.4/solr-4.10.4.tgz"
        ;;
    esac

    if [ ! -f "${SOLR_TAR}" ]; then
        cd /tmp && wget --show-progress "${URL}"
    fi

    if [ -d "${SOLR_FOLDER}" ]; then
        rm -Rf "${SOLR_FOLDER}"
    else
        cd /opt && sudo tar -xzf "${SOLR_TAR}"
        sudo mv "${SOLR_TAR_FOLDER}" "${SOLR_FOLDER}"
        sudo chown -R $(whoami):$(whoami) "${SOLR_FOLDER}"
    fi

    case ${1} in
    "6")
        cd "${SOLR_FOLDER}"
        mkdir -p server/ez/template
        cp -R "${EZ_FOLDER}"/lib/Resources/config/solr/* server/ez/template
        cp server/solr/configsets/basic_configs/conf/{currency.xml,solrconfig.xml,stopwords.txt,synonyms.txt,elevate.xml} server/ez/template
        cp server/solr/solr.xml server/ez
        ## Modify solrconfig.xml to remove section that doesn't agree with our schema
        sed -i.bak '/<updateRequestProcessorChain name="add-unknown-fields-to-the-schema">/,/<\/updateRequestProcessorChain>/d' server/ez/template/solrconfig.xml
        ;;
    "*")
        cd "${SOLR_FOLDER}"/example
        mkdir -p examulticore/collection1/conf
        cp -R "${EZ_FOLDER}"e/lib/Resources/config/solr/* multicore/collection1/conf
        cp solr/collection1/conf/{currency.xml,stopwords.txt,synonyms.txt} multicore/collection1/conf
        ## Remove default cores configuration and add core configuration
        sed -i.bak 's/<core name=".*" instanceDir=".*" \/>//g' multicore/solr.xml
        sed -i.bak "s/<shardHandlerFactory/<core name=\"collection1\" instanceDir=\"collection1\" \/><shardHandlerFactory/g" multicore/solr.xml
        cp multicore/core0/conf/solrconfig.xml multicore/collection1/conf
        sed -i.bak s/core0/collection1/g multicore/collection1/conf/solrconfig.xml
        ;;
    esac
}
