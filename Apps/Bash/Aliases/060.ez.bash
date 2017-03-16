##### find files in the current directory
##### $1: search pattern
function eZClear()
{
    if [ -d app/cache ]; then
        rm -Rf app/cache/*
    fi
    /usr/bin/env php app/console cache:clear --env=prod
}



