#! /usr/bin/env bash

## Prints a simple colored information message
## Parameters:
##     $1: the message you want to print
function printInfo(){
    env echo -e "\e[1;32m\e[3m${1}\e[0m"
}

## Prints a simple colored error message and exits the script.
## Parameters:
##     $1: the message you want to print
function printError(){
    env echo -e "\e[0;31m\e[3m${1}\e[0m"
    exit 1
}

## Prints a confirmation message
## Parameters:
##     $1: the message you want to print
function printConfirmation(){
    env echo -e "\e[44m\e[97m ${1} \e[0m"
    read -p "" -n 1 -r
    echo
}

## Prints the date in the YYY-MM-DD.HH:MM:SS format
function getDate()
{
    echo $(date +%Y-%m-%d.%H:%M:%S)
}

## Copies a file to another destination.
## If the file exists in the destination, renames it to file.YYY-MM-DD.HH:MM:SS.ori
## Parameters:
##     $1: the original file you want to copy
##     $1: the destination file
function copyFile()
{

    ## All the necessary paraemeters must be given
    if [ "$#" -ne 2 ]; then
        printError "This function must receive the original and the destination files."
    fi

    ## The original file must exist
    if ! [ -e "${1}" ]; then
        printError "The original file does not exist:\n    ${1}"
    fi

    ## If the destination file is a link, remove it
    if [ -L "${2}" ]; then
        /usr/bin/env rm --force --verbose "${2}"
    fi

    ## If the destination file exists, rename it
    if [ -e "${2}" ]; then
        /usr/bin/env mv --force --verbose "${2}" "${2}".`getDate`.ori
    fi

    ## Copies the file
    /usr/bin/env cp --force --verbose --recursive "${1}" "${2}"
}

## LInks a file to another destination.
## Parameters:
##     $1: the original file you want to copy
##     $1: the destination file
function linkFile()
{

    ## All the necessary paraemeters must be given
    if [ "$#" -ne 2 ]; then
        printError "This function must receive the original and the destination files."
    fi

    ## The original file must exist
    if ! [ -e "${1}" ]; then
        printError "The original file does not exist:\n    ${1}"
    fi

    ## If the destination file is a link, remove it
    if [ -L "${2}" ]; then
        /usr/bin/env rm --force --verbose "${2}"
    fi

    ## If the destination file exists, rename it
    if [ -e "${2}" ]; then
        /usr/bin/env mv --force --verbose "${2}" "${2}".`getDate`.ori
    fi

    ## Copies the file
    /usr/bin/env ln --force --verbose --logical --symbolic "${1}" "${2}"
}
