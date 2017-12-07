#!/usr/bin/env bash

# ●▬▬▬▬▬๑۩  Aliases ۩๑▬▬▬▬▬●

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
