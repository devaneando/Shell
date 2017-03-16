function eZClear()
{
    if [ -d app/cache ]; then
        rm -Rf app/cache/*
    fi

    if [ -d app ]; then
        /usr/bin/env php app/console cache:clear --env=prod
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

