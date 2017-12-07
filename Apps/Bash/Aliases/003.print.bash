#!/usr/bin/env bash
# vi:syntax=bash

##### Echoes an error on the screen
##### $1: the error message
function printError() {
    echo -e "${FORE_RED_DARK}${SET_ITALIC}${1}${RESET_FULL}"
}

##### Echoes an information on the screen
##### $1: the error message
function printInfo() {
    echo -e "${FORE_GREEN_DARK}${SET_ITALIC}${1}${RESET_FULL}"
}

##### Echoes a warn on the screen
##### $1: the error message
function printWarn() {
    echo -e "${FORE_YELLOW_LIGHT}${SET_ITALIC}${1}${RESET_FULL}"
}

##### Echoes a question on the screen
##### $1: the error message
function printQuestion() {
    echo -e "${FORE_WHITE}${SET_ITALIC}${1}${RESET_FULL}"
}
