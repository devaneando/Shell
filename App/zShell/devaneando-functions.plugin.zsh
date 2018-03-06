# Generate a SSH key
function sshKeyGenerate()
{
    if [ -z "$1" ]; then
        echo "$fg[red]Can't generate a key without a filename. Don't add a 'rsa' sufix to the filename.${reset_color}"
        return 255
    fi
    FILENAME="${HOME}/.ssh/Keys/${1}.rsa"

    if [ -z "$2" ]; then
		PASSPHRASE=""
	else
		PASSPHRASE="${2}"
    fi

    if [ -z "$3" ]; then
		COMMENT="edu.fernandes.pt@gmail.com"
	else
		COMMENT="${3}"
    fi

	ssh-keygen -t rsa \
		-b 4096 \
		-C "${COMMENT}" \
		-N "${PASSPHRASE}" \
		-f "${FILENAME}"
}

# Allows vi to automatically edit protected files
function __vi() {
    # If the file in question does not exist
    if [ ! -e "${1}" ]; then
        if [ ! -w "$(dirname \"${1}\")" ]; then
            sudo --preserve-env env vi "${1}"
            return 0
        else
            env vi "${1}"
            return 0
        fi
    fi

    # If the file is a dir, exits
    if [ -d "${1}" ]; then
        return 0
    fi

    # If the file exists, make sure you have permissions to write it
    if [ ! -w "{1}" ]; then
        sudo --preserve-env env vi "${1}"
    else
        env vi "${1}"
    fi
}
alias vi="__vi"

##### find files in the current directory
##### $1: search pattern
function findHere() {
    if [ -z "$1" ]; then
        echo "${fg[red]}No search pattern provided${reset_color}"
        return 255
    fi

    env sudo --preserve-env env find . -type f -iname "*${1}*"
}

##### find files in the current directory and move to anothe location
##### $1: search pattern
##### $2: destination folder
function findMove() {
    if [ -z "$1" ]; then
        echo "${fg[red]}No search pattern provided${reset_color}"
        return 255
    fi

    shopt -s nocasematch
    if [[ "$1" == "the" ]]; then
        echo "${fg[red]}This command won't work with the word THE as search pattern${reset_color}"
        return 255
    fi

    if [ -z "$2" ]; then
        echo "${fg[red]}No destination folder provided${reset_color}"
        return 255
    fi

    env sudo --preserve-env env find . -type f -iname "*$1*" -exec mv --force --verbose {} "$2" \;
}

##### find files in the current directory and delete them all
##### $1: search pattern
function findDelete() {
    if [ -z "$1" ]; then
        echo "${fg[red]}No search pattern provided${reset_color}"
        return 255
    fi

    shopt -s nocasematch
    if [[ "$1" == "the" ]]; then
        echo "${fg[red]}This command won't work with the word THE as search pattern${reset_color}"
        return 255
    fi

    env sudo --preserve-env env find . -iname "*$1*"

    echo -e "\e[31m"
    read -p "Are you sure you want to delete those files? " -n 1 -r
    echo -e "\e[0m"

    shopt -s nocasematch
    if [[ "$REPLY" == "y" ]]; then
        env sudo --preserve-env env find . -type f -iname "*$1*" -exec echo -e "\e[94m Deleting {} \e[0m \n" \; -exec rm -Rfv {} \;
    fi
}

##### find Empty folders in the current directory and delete them all
function deleteEmptyFolders() {
    find . -empty -type d

    echo -e "\e[31m"
    read -p "Are you sure you want to delete those files? " -n 1 -r
    echo -e "\e[0m"

    shopt -s nocasematch
    if [[ "$REPLY" == "y" ]]; then
        env sudo --preserve-env env find . -empty -type d -exec echo -e "\e[94m Deleting {} \e[0m \n" \; -exec rm -Rfv {} \;
    fi
}

##### Adds a .gitkeep file to all folders
function gitKeepIt() {
    find . -type d -name ".git" -prune -o -type d -exec touch {}/.gitkeep \;
}

##### checks the quality of the wireless connection
##### $1: wireless interface (ex.: wlan0)
function wirelessQuality() {
    if [ $# -eq 1 ]; then
        sudo /sbin/iwlist "wlan0" scan | env grep --ignore-case --color=always "Quality"
    else
        sudo /sbin/iwlist "${1}" scan | env grep --ignore-case --color=always "Quality"
    fi
}

##### Allows command line calculations
##### $1: mathematical expressions
function calc() {
    echo "scale=2; ${1}" | env bc --mathlib
}

##### Generates LoremIpsum dummy data
##### Requires Internet access
function loremIpsum() {
    url="http://loripsum.net/api/plaintext"
    paragraphs=2
    size="medium"

    if [ -z "$1" ]; then
        echo "${fg[yellow]}-h/--help\s\s\s\sDisplays this help${reset_color}"
        echo "${fg[yellow]}-p/--paragraph\s\s\s\sNumbers of paragraphs to display${reset_color}"
        echo "${fg[yellow]}-s/--size\s\s\s\sSize of the paragraphs. Accepted values: 'short', 'medium', 'long', 'verylong'${reset_color}"
        echo -e "\n"
        curl "${url}/2/medium"
        return 0
    fi

    for i in "$@"; do
        case $i in
        -p=* | --paragraph=*)
            paragraphs="${i#*=}"
            shift # past argument=value
            ;;
        -s=* | --size=*)
            size="${i#*=}"
            shift # past argument=value
            ;;
        -h | --help)
            echo "${fg[yellow]}-h/--help\s\s\s\sDisplays this help${reset_color}"
            echo "${fg[yellow]}-p/--paragraph\s\s\s\sNumbers of paragraphs to display${reset_color}"
            echo "${fg[yellow]}-s/--size\s\s\s\sSize of the paragraphs. Accepted values: 'short', 'medium', 'long', 'verylong'${reset_color}"
            return 0
            ;;
        esac
    done
    curl "${url}/${size}/${paragraphs}"
}

# Generates a Symfony secret key
function symfonySecret() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 40 | head -n 1
}

# Generates a Symfony secret key
function strongPassword() {
    if [ -z "$1" ]; then
        cat /dev/urandom | tr -dc 'a-zA-Z0-9#%' | fold -w 12 | head -n 1
    else
        cat /dev/urandom | tr -dc 'a-zA-Z0-9#%' | fold -w ${1} | head -n 1
    fi
}

function symClear() {
    reset

    if [ ! -d app/config ]; then
        return 0
    fi

    if [ -d var/cache ]; then
        rm -Rfv var/cache/*
    fi

    if [ -d app/cache ]; then
        echo "removed " $(rm -Rfv app/cache/* | wc -l) " cache files."
    fi

    if [ -d app/logs ]; then
        echo "removed " $(rm -Rfv app/logs/*.log | wc -l) " log files."
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

function symAssets() {
    reset

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

function symServerStart() {
    reset

    if [ -f app/console ]; then
        app/console server:start 0.0.0.0:8080
    fi

    if [ -f bin/console ]; then
        bin/console server:start 0.0.0.0:8080
    fi
}

function symServerStop() {
    if [ -f app/console ]; then
        app/console server:stop 0.0.0.0:8080
    fi

    if [ -f bin/console ]; then
        bin/console server:stop 0.0.0.0:8080
    fi
}

function symServerRestart() {
    reset

    if [ -f app/console ]; then
        app/console server:stop 0.0.0.0:8080
        app/console server:start 0.0.0.0:8080
    fi

    if [ -f bin/console ]; then
        bin/console server:stop 0.0.0.0:8080
        bin/console server:start 0.0.0.0:8080
    fi
}

function symDoctrineRecreate() {
    reset

    if [ ! -d app/config ]; then
        return 0
    fi

    if [ -f bin/console ]; then
        php -d memory_limit=-1 bin/console doctrine:database:drop --force
        php -d memory_limit=-1 bin/console doctrine:database:create
        php -d memory_limit=-1 bin/console doctrine:schema:create
        if [ ! -z "$1" ]; then
            php -d memory_limit=-1 bin/console doctrine:fixtures:load --no-interaction
        fi
    fi

    if [ -f app/console ]; then
        php -d memory_limit=-1 app/console doctrine:database:drop --force
        php -d memory_limit=-1 app/console doctrine:database:create
        php -d memory_limit=-1 app/console doctrine:schema:create
        if [ ! -z "$1" ]; then
            php -d memory_limit=-1 app/console doctrine:fixtures:load --no-interaction
        fi
    fi
}

function symDoctrineUpdate() {
    reset

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
