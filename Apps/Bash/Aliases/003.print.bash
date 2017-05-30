##### Echoes an error on the screen
##### $1: the error message
function printError()
{
    env echo -e "${FORE_RED_DARK}${SET_ITALIC}${1}${RESET_FULL}"
}

##### Echoes an information on the screen
##### $1: the error message
function printInfo()
{
    env echo -e "${FORE_GREEN_DARK}${SET_ITALIC}${1}${RESET_FULL}"
}

##### Echoes a warn on the screen
##### $1: the error message
function printWarn()
{
    env echo -e "${FORE_YELLOW_LIGHT}${SET_ITALIC}${1}${RESET_FULL}"
}

##### Echoes a question on the screen
##### $1: the error message
function printQuestion()
{
    env echo -e "${FORE_WHITE}${SET_ITALIC}${1}${RESET_FULL}"
}
