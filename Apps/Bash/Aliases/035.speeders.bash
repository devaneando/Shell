# !/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Aliases ۩๑▬▬▬▬▬●

alias 7zipAdd='env 7z a -t7z -mx9'
alias 7zipExtract='env 7z x'
alias chrome='env google-chrome --process-per-site'
alias dhclient='env sudo vi /etc/dhcp/dhclient.conf'
alias imageSize='env exiftool -ImageSize -FileName -S -t'
alias la='env ls --color --quote-name --almost-all --file-type --si --time-style=long-iso --human-readable --numeric-uid-gid -go'
alias patchApply='env patch --strip=0 -i'
alias patchReverse='env patch --reverse --strip=0 -i'
alias patchTest='env patch --dry-run --strip=0 -i'
alias psGrep='env ps -H -e --sort=ruser --lines 30 -o"%p   %P   %U %t     %c" --headers --forest  | grep -in --color=always'
alias psMem='sudo ${BASE}/Scripts/Python/ps_mem/ps_mem.py'
alias sortReverse='env sort --ignore-leading-blanks --ignore-case --ignore-nonprinting --reverse'
alias startVM='env vboxmanage --type headless startvm'
alias tarAdd='env tar --create --verbose --gzip --file'
alias tarExtract='env tar --warning=none --extract --gunzip --file'
alias toMe='sudo env chown --recursive `whoami`:`whoami`'