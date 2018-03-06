# Add sudo aliases

alias historyGrep='history | env cut --characters=8- | env sort --ignore-case --ignore-nonprinting --ignore-leading-blank | env uniq --unique'
alias 7zipAdd='env 7z a -t7z -mx9'
alias 7zipExtract='env 7z x'
alias bigFolders='sudo env du -h | env grep ^[0-9.]*G | env sort -rn | env head -n 20'
alias chrome='env google-chrome --process-per-site'
alias dhclient='env sudo vi /etc/dhcp/dhclient.conf'
alias format='env echo "/data/FS/WD2Tb/01.Music/%g/%z/%y - %b/CD %d/%t [%z] %n@%b"'
alias go='cd ~ && env reset && env ssh -q'
alias imageSize='env exiftool -ImageSize -FileName -S -t'
alias la='env ls --color --quote-name --almost-all --file-type --si --time-style=long-iso --human-readable --numeric-uid-gid -go'
alias networkFix='sudo env systemctl restart network-manager.service'
alias patchApply='env patch --strip=0 -i'
alias patchReverse='env patch --reverse --strip=0 -i'
alias patchTest='env patch --dry-run --strip=0 -i'
alias pg='env ps -H -e --sort=ruser --lines 30 -o"%p   %P   %U %t     %c" --headers --forest  | grep -in --color=always'
alias psMem='sudo ${BASE}/Scripts/Python/ps_mem/ps_mem.py'
alias sortReverse='env sort --ignore-leading-blanks --ignore-case --unique --ignore-nonprinting --reverse'
alias startVM='env vboxmanage --type headless startvm'
alias tarAdd='env tar --create --verbose --gzip --file'
alias tarExtract='env tar --warning=none --extract --gunzip --file'
alias toMe='sudo env chown --recursive `whoami`:`whoami`'
alias youtubeToMp3="youtube-dl --extract-audio --audio-quality 320K --audio-format mp3 -o '%(title)s.%(id)s.%(ext)s'"
alias monitorNormal="env xrandr --output eDP-1 --rotate normal"
alias monitorLeft="env xrandr --output eDP-1 --rotate left"
alias phpStan='reset && phpstan analyse --level=4'

function sshKeyGenerate()
{
    if [ -z "$1" ]; then
        printError "Can't generate a key without a filename. Don't add a 'rsa' sufix to the filename."
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

##### Checks if a process is running and returns 0 if it's not and 1 if it is
##### $1: The process name
function isRunning()
{
    COUNT=$(env ps -o command -e | env grep "${1}" | env wc --lines)
    if [ "${COUNT}" -lt 1 ]; then
        echo 0
    else
        echo 1
    fi
}

##### checks the quality of the wireless connection
##### $1: wireless interface (ex.: wlan0)
function wirelessQuality()
{
    if [ $# -eq 1 ]; then
        sudo /sbin/iwlist "wlan0" scan | env grep --ignore-case --color=always "Quality"
    else
        sudo /sbin/iwlist "${1}" scan | env grep --ignore-case --color=always "Quality"
    fi
}

##### Start a virtualbox VM in headless mode
##### $1: VM Name
function vmStart() {
    if [ $# -ne 1 ]; then
        print error "It's not possible to proceed without the VM name."
        return 255
    fi

    env vboxmanage startvm "$1" --type headless
}

##### Stop a virtualbox VM
##### $1: VM Name
function vmStop()
{
    if [ $# -ne 1 ]; then
        print error "It's not possible to proceed without the VM name."
        return 255
    fi

    env vboxmanage controlvm "$1" acpipowerbutton
}

##### Allows command line calculations
##### $1: mathematical expressions
function calc()
{
    echo "scale=2; ${1}" | env bc --mathlib
}

##### Generates LoremIpsum dummy data
##### Requires Internet access
function loremIpsum()
{
    url="http://loripsum.net/api/plaintext"
    paragraphs=2
    size="medium"

    if [ -z "$1" ]; then
        print info "-h/--help\s\s\s\sDisplays this help"
        print info "-p/--paragraph\s\s\s\sNumbers of paragraphs to display"
        print info "-s/--size\s\s\s\sSize of the paragraphs. Accepted values: 'short', 'medium', 'long', 'verylong'"
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
            print info "-h/--help\s\s\s\sDisplays this help"
            print info "-p/--paragraph\s\s\s\sNumbers of paragraphs to display"
            print info "-s/--size\s\s\s\sSize of the paragraphs. Accepted values: 'short', 'medium', 'long', 'verylong'"
            return 0
            ;;
        esac
    done
    curl "${url}/${size}/${paragraphs}"
}

##### Searches the history for data
function historyFind() {
    if [ -z "$1" ]; then
        print error "You must provide the terms you want to search for!"
        return 0
    fi

    history | grep "${1}" | env cut --characters=8- | env sort --ignore-case --ignore-nonprinting --ignore-leading-blank --unique
}

# Cow-spoken fortunes every time you open a terminal
function cowsayfortune() {
    NUMOFCOWS=$(cowsay -l | tail -n +2 | wc -w)
    WHICHCOW=$((RANDOM % $NUMOFCOWS + 1))
    THISCOW=$(cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d')

    #echo "Selected cow: ${THISCOW}, from ${WHICHCOW}"
    fortune -as | cowsay -f $THISCOW
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

# Generates a SSH Key
function sshKey() {
    if [ -z "$1" ]; then
        echo "${FORE_RED_DARK}${SET_ITALIC}You must provide the email and the key name${RESET_FULL}"
        echo "${FORE_RED_DARK}${SET_ITALIC}Ex.: sshKey john.doe@gmail.com johnDoe.rsa${RESET_FULL}"
        return 9
    fi

    if [ -z "$2" ]; then
        myKey="myKey.rsa"
    else
        myKey="${2}"
    fi

    /usr/bin/env ssh-keygen -t rsa -b 4096 -C "${1}" -f "${myKey}"
}
