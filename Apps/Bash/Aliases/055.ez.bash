function installEZPClean()
{

    if [ $# -eq 1 ]; then

        composer create-project --no-dev --repository-url=https://updates.ez.no/bul ezsystems/ezstudio "${1}"
        cd "${1}"
        chmod 777 app/console
        php -d memory_limit=-1 app/console ezplatform:install --env=prod studio-clean
        php -d memory_limit=-1 app/console assetic:dump
        php -d memory_limit=-1 app/console cache:clear
        composer update --prefer-dist --no-dev

    fi

}

function installEZPDemo()
{

    if [ $# -eq 1 ]; then

        composer create-project --no-dev ezsystems/ezstudio-demo "${1}" v1.7.0
        
        cd "${1}"
        chmod 777 app/console
        php -d memory_limit=-1 app/console ezplatform:install --env=prod demo
        php -d memory_limit=-1 app/console assetic:dump
        php -d memory_limit=-1 app/console cache:clear
        composer update --prefer-dist --no-dev

    fi

}

function symfonySecret()
{
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 40 | head -n 1
}
