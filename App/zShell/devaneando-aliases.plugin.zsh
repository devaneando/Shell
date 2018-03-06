##### Sudo aliases
########## Add sudo to normally sudoed commands

alias a2enmod='sudo env a2enmod'
alias a2ensite='sudo env a2ensite'
alias add-apt-repository='sudo env add-apt-repository'
alias apt-get='sudo env apt-get'
alias apt-key='sudo env apt-key'
alias apt='sudo env apt'
alias blkid='sudo env blkid'
alias chmod='sudo env chmod'
alias chown='sudo env chown'
alias docker-compose='sudo env docker-compose'
alias docker='sudo env docker'
alias dpkg-reconfigure='sudo env dpkg-reconfigure'
alias dpkg='sudo env dpkg'
alias fdisk='sudo env fdisk'
alias find='sudo env find'
alias ifdown='sudo env ifdown'
alias ifup='sudo env ifup'
alias iptables='sudo env iptables'
alias lshw='sudo env lshw'
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
alias egrep='env egrep --ignore-case -I --color=always'
alias eject='eject /dev/sr0'
alias eyeD3='env eyeD3 --force-update --verbose'
alias figlet-toilet='env figlet-toilet --gay --width 1100'
alias free='env free --mega --human --total'
alias gitTime="env git commit -m \"$(date +'%Y-%m-%d %H:%M')\""
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
alias reboot='sudo env reboot --force'
alias ripit='env ripit --device /dev/sr0 --mail nobody@nobody.com --archive --eject --outputdir /data/FS/Media/03.CDRip --coder 0 --bitrate 320 --tracktemplate '"'"'"$tracknum - $trackname"'"'"' --dirtemplate '"'"'"$artist/$album"'"'"
alias shutdown='env shutdown --poweroff now'
alias sl='env games/sl -ale'
alias sort='env sort --ignore-leading-blanks --ignore-case --unique --ignore-nonprinting'
alias sudo='env sudo --preserve-env'
alias synaptic='sudo env synaptic > /dev/null 2>&1 &'
alias syndaemon='env syndaemon -d -K -i 2'
alias toilet='env toilet --gay --width 1100 --font=mono9'
alias tree='env tree -d --noreport'
alias unattended-upgrade='sudo env unattended-upgrade --verbose'
alias vivaldi='env vivaldi --process-per-site'

##### Speeders
########## Create aliases to add new functionalities

alias dhclient='env sudo vi /etc/dhcp/dhclient.conf'
alias format='env echo "/data/FS/Media/01.Music/%g/%z/%y - %b/CD %d/%t [%z] %n@%b"'
alias imageSize='env exiftool -ImageSize -FileName -S -t'
alias la='env ls --color --quote-name --almost-all --file-type --si --time-style=long-iso --human-readable --numeric-uid-gid -go'
alias monitorLeft="env xrandr --output eDP-1 --rotate left"
alias monitorNormal="env xrandr --output eDP-1 --rotate normal"
alias networkFix='sudo env systemctl restart network-manager.service'
alias phpStan='reset && phpstan analyse --level=4'
alias toMe='sudo env chown --recursive `whoami`:`whoami`'
alias youtubeToMp3="youtube-dl --extract-audio --audio-quality 320K --audio-format mp3 -o '%(title)s.%(id)s.%(ext)s'"

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