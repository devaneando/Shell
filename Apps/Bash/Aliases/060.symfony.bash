#!/usr/bin/env bash
# vi:syntax=bash

function symClear()
{
    if [ ! -d app/config ]; then
		return 0
    fi

    if [ -d var/cache ]; then
        rm -Rfv var/cache/*
    fi

    if [ -f bin/console ]; then
		php -d memory_limit=-1 bin/console cache:clear --no-warmup --env=prod
		php -d memory_limit=-1 bin/console cache:warmup --env=prod
    fi    
	
}

function symAssets()
{
    if [ ! -d app/config ]; then
		return 0
    fi
    
    if [ -f bin/console ]; then
		php -d memory_limit=-1 bin/console assetic:dump --env=prod
		php -d memory_limit=-1 bin/console assets:install --env=prod
    fi        
}
