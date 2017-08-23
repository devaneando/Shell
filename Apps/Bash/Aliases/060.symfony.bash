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
    
    if [ -d app/cache ]; then
        rm -Rfv app/cache/*
    fi    

    if [ -f bin/console ]; then
		php -d memory_limit=-1 bin/console cache:clear --no-warmup --env=prod
		php -d memory_limit=-1 bin/console cache:warmup --env=prod
    fi    
    
    if [ -f app/console ]; then
		php -d memory_limit=-1 app/console cache:clear --no-warmup --env=prod
		php -d memory_limit=-1 app/console cache:warmup --env=prod
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
    
    if [ -f app/console ]; then
		php -d memory_limit=-1 app/console assetic:dump --env=prod
		php -d memory_limit=-1 app/console assets:install --env=prod
    fi          
}

function symDoctrineRecreate()
{
    if [ ! -d app/config ]; then
		return 0
    fi
    
    if [ -f bin/console ]; then
		php -d memory_limit=-1 bin/console doctrine:database:drop --force
		php -d memory_limit=-1 bin/console doctrine:database:create
		php -d memory_limit=-1 bin/console doctrine:schema:create
		php -d memory_limit=-1 bin/console doctrine:fixtures:load
    fi     
    
    if [ -f app/console ]; then
		php -d memory_limit=-1 app/console doctrine:database:drop --force
		php -d memory_limit=-1 app/console doctrine:database:create
		php -d memory_limit=-1 app/console doctrine:schema:create
		php -d memory_limit=-1 app/console doctrine:fixtures:load
    fi              
}

function symDoctrineUpdate()
{
    if [ ! -d app/config ]; then
		return 0
    fi
    
    if [ -f bin/console ]; then
		php -d memory_limit=-1 bin/console doctrine:schema:update -f
		php -d memory_limit=-1 bin/console doctrine:schema:validate
    fi     
    
    if [ -f app/console ]; then
		php -d memory_limit=-1 app/console doctrine:schema:update -f
		php -d memory_limit=-1 app/console doctrine:schema:validate
    fi              
}

