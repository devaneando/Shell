# !/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Aliases ۩๑▬▬▬▬▬●

alias find='sudo env find'

# ●▬▬▬▬▬๑۩  Functions ۩๑▬▬▬▬▬●

##### find files in the current directory
##### $1: search pattern
function findHere()
{
    if [ -z "$1" ]; then
        printError "No search pattern provided"
        return 999
    fi

    env sudo --preserve-env env find . -type f -iname "*${1}*"
}

##### find files in the current directory and move to anothe location
##### $1: search pattern
##### $2: destination folder
function findMove()
{
    if [ -z "$1" ]; then
        printError "No search pattern provided"
        return 999
    fi

    shopt -s nocasematch
    if [[ "$1" == "the" ]]; then
        printError "This command won't work with the word THE as search pattern"
        return 999
    fi

    if [ -z "$2" ]; then
        printError "No destination folder provided"
        return 999
    fi

    env sudo --preserve-env env find . -type f -iname "*$1*" -exec mv --force --verbose {} "$2" \;
}

##### find files in the current directory and delete them all
##### $1: search pattern
function findDelete()
{
    if [ -z "$1" ]; then
        printError "No search pattern provided"
        return 999
    fi

    shopt -s nocasematch
    if [[ "$1" == "the" ]]; then
        printError "This command won't work with the word THE as search pattern"
        return 999
    fi

    env sudo --preserve-env env find . -iname "*$1*"

    echo -e "\e[31m"
    read -p "Are you sure you want to delete those files? " -n 1 -r
    echo -e "\e[0m"

    shopt -s nocasematch
    if [[ "$REPLY" == "y" ]]; then
        env sudo --preserve-env env find . -type f -iname "*$1*" -exec echo -e "\e[94m Deleting "{}" \e[0m \n" \; -exec rm -Rfv {} \;
    fi
}

##### find Empty folders in the current directory and delete them all
function deleteEmptyFolders()
{
    find . -empty -type d

    echo -e "\e[31m"
    read -p "Are you sure you want to delete those files? " -n 1 -r
    echo -e "\e[0m"

    shopt -s nocasematch
    if [[ "$REPLY" == "y" ]]; then
        env sudo --preserve-env env find . -empty -type d -exec echo -e "\e[94m Deleting "{}" \e[0m \n" \; -exec rm -Rfv {} \;
    fi
}
