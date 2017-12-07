#!/usr/bin/env bash
# vi:syntax=bash

##### Converts Markdown to HTML
function mdToHTML() {
    if [ -z "$1" ]; then
        printError "The source document was not provided."
        return 255
    fi

    if [ ! -f "$1" ]; then
        printError "The source document does not exist."
        return 255
    fi

    folder=$(dirname "${1}")
    file=$(basename "${1}")
    extension="${file##*.}"
    fileName="${file%.*}"
    newFileName="${folder}/${fileName}.html"

    if [ -z "$2" ]; then
        pandoc "${1}" --output="${newFileName}" --to=html5 \
            --highlight-style=haddock --self-contained --smart
    else
        pandoc "${1}" --output="${newFileName}" --to=html5 \
            --highlight-style=haddock --self-contained --smart \
            --css="${2}"
    fi

    echo "${newFileName}"
}

function htmlToMd() {
    if [ -z "$1" ]; then
        printError "The source document was not provided."
        return 255
    fi

    if [ ! -f "$1" ]; then
        printError "The source document does not exist."
        return 255
    fi

    folder=$(dirname "${1}")
    file=$(basename "${1}")
    extension="${file##*.}"
    fileName="${file%.*}"
    newFileName="${folder}/${fileName}.pdf"

    if [ -z "$2" ]; then
        wkhtmltopdf --page-size A4 "${1}" "${newFileName}"
    else
        wkhtmltopdf --page-size A4 --user-style-sheet "${2}" \
            "${1}" "${newFileName}"
    fi

    echo "${newFileName}"
}

function mdToPdf() {
    if [ -z "$1" ]; then
        printError "The source document was not provided."
        return 255
    fi

    if [ ! -f "$1" ]; then
        printError "The source document does not exist."
        return 255
    fi

    folder=$(dirname "${1}")
    file=$(basename "${1}")
    extension="${file##*.}"
    fileName="${file%.*}"
    htmlFileName="/tmp/${fileName}.html"
    newFileName="${folder}/${fileName}.pdf"

    if [ -z "$2" ]; then
        pandoc "${1}" --output="${htmlFileName}" --to=html \
            --highlight-style=haddock --self-contained --smart

        wkhtmltopdf --page-size A4 "${htmlFileName}" "${newFileName}"
    else
        pandoc "${1}" --output="${htmlFileName}" --to=html \
            --highlight-style=haddock --self-contained --smart \
            --css="${2}"

        wkhtmltopdf --page-size A4 --user-style-sheet "${2}" \
            "${htmlFileName}" "${newFileName}"
    fi

    echo "${newFileName}"
}
