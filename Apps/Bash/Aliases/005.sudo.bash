# !/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Aliases ۩๑▬▬▬▬▬●

alias sudo='env sudo --preserve-env'

alias a2enmod='sudo env a2enmod'
alias a2ensite='sudo env a2ensite'
alias blkid='sudo env blkid'
alias chmod='sudo env chmod'
alias chown='sudo env chown'
alias fdisk='sudo env fdisk'
alias historyGrep='history | env cut --characters=8- | env sort --ignore-case --ignore-nonprinting --ignore-leading-blank | env uniq --unique'
alias ifdown='sudo env ifdown'
alias ifup='sudo env ifup'
alias iptables='sudo env iptables'
alias killall='sudo env killall --verbose --ignore-case --regexp'
alias kill='sudo env kill -9'
alias lshw='sudo env lshw'
alias mount='sudo env mount --verbose'
alias ping='sudo env ping -a -c4'
alias reboot='sudo env reboot --force'
alias shutdown='env shutdown -p now'
alias su='sudo env su'
alias synaptic='sudo env synaptic > /dev/null 2>&1 &'
alias asystemctl='sudo env systemctl'
alias umount='sudo env umount --force'
alias unattended-upgrade='sudo env unattended-upgrade --verbose'
alias update-alternatives='sudo env update-alternatives'
alias update-grub2='sudo env update-grub2'
