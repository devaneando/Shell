##### Folder aliases
########## Add sudo to normally sudoed commands
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

##### Sudo aliases
########## Add sudo to normally sudoed commands

alias a2enconf='sudo env a2enconf'
alias a2enmod='sudo env a2enmod'
alias a2ensite='sudo env a2ensite'
alias add-apt-repository='sudo env add-apt-repository'
alias apachectl='sudo env apachectl'
alias apt-get='sudo env apt-get'
alias apt-key='sudo env apt-key'
alias apt='sudo env apt'
alias blkid='sudo env blkid'
alias chmod='sudo env chmod'
alias chown='sudo env chown'
alias dpkg-reconfigure='sudo env dpkg-reconfigure'
alias dpkg='sudo env dpkg'
alias fdisk='sudo env fdisk'
alias find='sudo env find'
alias ifdown='sudo env ifdown'
alias ifup='sudo env ifup'
alias iptables='sudo env iptables'
alias lshw='sudo env lshw'
alias service='sudo env service'
alias su='sudo env su'
alias systemctl='sudo env systemctl'
alias umount='sudo env umount --force'
alias update-alternatives='sudo env update-alternatives'
alias update-grub2='sudo env update-grub2'

##### Common usages
########## Change default commands according your normal usage

alias aptAllTheWay='apt-get update && apt-get dist-upgrade --assume-yes && apt autoremove --assume-yes'
alias aptClean='apt-get clean --assume-yes'
alias aptInstall='apt-get install'
alias aptPurge='apt-get purge'
alias aptUpdate='apt-get update'
alias aptUpgrade='apt-get dist-upgrade --assume-yes'
alias bc='env bc --mathlib'
alias cat='env cat --squeeze-blank'
alias chrome='env google-chrome --process-per-site'
alias chromium-browser='env chromium-browser --process-per-site'
alias chromium='env chromium-browser --process-per-site'
alias cp='env cp --verbose --interactive --recursive'
alias df='env df --block-size=1K --human-readable'
alias du='env du --total --human-readable --summarize'
alias echo='env echo -e'
alias egrep='env egrep --ignore-case -I'
alias eject='eject /dev/sr0'
alias eyeD3='env eyeD3 --force-update --verbose'
alias figlet-toilet='env figlet-toilet --gay --width 1100'
alias free='env free --mega --human --total'
alias google-chrome='env google-chrome --process-per-site'
alias grep='env grep --extended-regexp -I --ignore-case --color=always --exclude-dir=.git'
alias killall='sudo env killall --verbose --ignore-case --regexp'
alias kill='sudo env kill -9'
alias latexmk='env latexmk -f -g -halt-on-error -aux-directory=/tmp -output-directory=/tmp'
alias ls='env ls --color --quote-name --file-type --si'
alias mkdir='env mkdir --parents'
alias mount='sudo env mount --verbose'
alias mv='env mv --verbose --interactive'
alias ping='sudo env ping -a -c4'
alias ps='env ps -H -e --sort=ruser --lines 30 -o"%p   %P   %U %t     %c" --headers --forest '
alias reboot='sudo reboot --force --no-wall'
alias ripit='env ripit --device /dev/sr0 --mail nobody@nobody.com --archive --eject --outputdir /data/FS/Media/03.CDRip --coder 0 --bitrate 320 --tracktemplate '"'"'"$tracknum - $trackname"'"'"' --dirtemplate '"'"'"$artist/$album"'"'"
alias shutdown='sudo shutdown --poweroff --no-wall now'
alias sl='env games/sl -ale'
alias sort='env sort --ignore-leading-blanks --ignore-case --unique --ignore-nonprinting'
alias sudo='env sudo --preserve-env'
alias synaptic='sudo env synaptic > /dev/null 2>&1 &'
alias syndaemon='env syndaemon -d -K -i 2'
alias toilet='env toilet --gay --width 1100 --font=mono9'
alias tree='env tree -d --noreport'
alias unattended-upgrade='sudo env unattended-upgrade --verbose'
alias vivaldi='env vivaldi --process-per-site'
alias gti='git'

##### Speeders
########## Create aliases to add new functionalities

alias dhclient='env sudo vi /etc/dhcp/dhclient.conf'
alias format='env echo "${HOME}/Music/%g/%z/%y - %b/%t [%z] %d-%n@%b"'
alias imageSize='env exiftool -ImageSize -FileName -S -t'
alias la='env ls --color --quote-name --almost-all --file-type --si --time-style=long-iso --human-readable --numeric-uid-gid -go'
alias monitorLeft="env xrandr --output eDP-1 --rotate left"
alias monitorNormal="env xrandr --output eDP-1 --rotate normal"
alias networkFix='sudo env systemctl restart network-manager.service'
alias phpStan='/usr/local/bin/phpstan analyse --configuration=./phpstan.neon --level=4'
alias toMe='sudo env chown --recursive `whoami`:`whoami`'
alias youtubeToMp3="youtube-dl --extract-audio --audio-quality 320K --audio-format mp3 -o '%(title)s.%(id)s.%(ext)s'"
alias apacheStart="sudo service apache2 start"
alias apacheStop="sudo service apache2 stop"
alias apacheRestart="sudo service apache2 stop && sudo service apache2 start"

##### Dockers

alias dockerBuild='reset && docker-compose build --force-rm'
alias docker-compose='sudo env docker-compose'
alias dockerComposerStart='docker-compose start'
alias dockerComposerStop='docker-compose stop'
alias dockerComposerUp='reset && docker-compose up'
alias dockerExec='docker container exec -i -t'
alias dockerPs='reset && docker ps'
alias docker='sudo docker'
alias dockerRun='rdocker container run --rm'

##### Symfony

function symfonyCacheClear()
{
    if [ -f "bin/console" ]; then
        console="bin/console"
    elif [ -f "app/console" ]; then
        console="app/console"
    fi

    if [ -z "$1" ]; then
        ENV="dev"
    else
        ENV="${1}"
    fi

    reset
    echo -e "\e[3m\e[36mRemove: $(date +'%H:%M:%S')\e[0m"
    sudo rm -fv var/logs/*.log
    rm -Rfv var/cache/*

    echo -e "\e[3m\e[36mClear: $(date +'%H:%M:%S')\e[0m"
    $console cache:clear --env=${ENV} --no-warmup  --no-debug

    echo -e "\e[3m\e[36mWarmup: $(date +'%H:%M:%S')\e[0m"
    $console cache:warmup --env=${ENV} --no-interaction --no-debug

    echo -e "\e[3m\e[36mAsset: $(date +'%H:%M:%S')\e[0m"
    $console assets:install --env=${ENV} --symlink
}

function symfonyAssets()
{
    if [ -f "bin/console" ]; then
        console="bin/console"
    elif [ -f "app/console" ]; then
        console="app/console"
    fi

    reset
    $console assetic:dump
    $console assets:install --symlink
}

function symfonyFixtures()
{
    if [ -f "bin/console" ]; then
        console="bin/console"
    elif [ -f "app/console" ]; then
        console="app/console"
    fi

    if [ -z "$1" ]; then
        ENV="dev"
    else
        ENV="${1}"
    fi

    reset
    # $console cache:warmup --env=${ENV} --no-optional-warmers
    $console doctrine:fixtures:load --env=${ENV} --no-interaction
}

function symfonyDatabase()
{
    if [ -f "bin/console" ]; then
        console="bin/console"
    elif [ -f "app/console" ]; then
        console="app/console"
    fi

    if [ -z "$1" ]; then
        ENV="dev"
    else
        ENV="${1}"
    fi

    reset
    ${console} doc:data:drop --env="${ENV}" --force
    ${console} doc:data:create --env="${ENV}"
    ${console} doctrine:migrations:migrate --env="${ENV}" --no-interaction
}

alias symfonySecret="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 40 | head -n 1"

##### Functions
########## Functions to add new functionalities

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

# Docker bash
function dockerBash() {
    if [ -z "$1" ]; then
        echo "$fg[red]Can't connect to a docker container, without its ID.${reset_color}"
        return 255
    fi
    sudo docker container exec -i -t ${1} /bin/bash
}

# Docker delete all containers
function dockerDeleteAllContainers() {
    reset

    read -p "Are you sure you want to delete all containers? " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then

        containers=$(sudo docker ps -q)
        if [[ ! -z ${containers} ]]; then
            sudo docker kill ${containers}
        fi

        containers=$(sudo docker ps -a -q)
        if [[ -z ${containers} ]]; then
            echo "There's no container to delete".
            return 1
        fi

        sudo docker rm ${containers}
    fi
}

# Docker delete all images
function dockerDeleteAllImages() {
    reset

    read -p "Are you sure you want to delete all images? " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then

        containers=$(sudo docker ps -q)
        if [[ ! -z ${containers} ]]; then
            sudo docker kill ${containers}
        fi

        images=$(sudo docker images -q)
        if [[ -z ${images} ]]; then
            echo "There's no image to delete".
            return 1
        fi

        sudo docker rmi ${images} -f
    fi
}

# Docker stop all containers
function dockerStopAllContainers {
    reset

    read -p "Are you sure you want to stop all containers? " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then

        containers=$(sudo docker ps -q)
        if [[ -z ${containers} ]]; then
            echo "There's no container to stop".
            return 1
        fi

        sudo docker kill ${containers}
    fi
}

function loremIpsum()
{
    if [[ ! -z ${1} ]]; then
        curl https://loripsum.net/api/${1}/short/headers/plaintext
    else
        curl https://loripsum.net/api/3/short/headers/plaintext
    fi

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
