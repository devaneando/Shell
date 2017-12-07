#!/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Aliases ۩๑▬▬▬▬▬●

##### Change commands
alias add-apt-repository='sudo env add-apt-repository'
alias apt-get='sudo env apt-get'
alias apt-key='sudo env apt-key'
alias apt='sudo env apt'
alias dpkg-reconfigure='sudo env dpkg-reconfigure'
alias dpkg='sudo env dpkg'

##### Apt-get
alias aptAllTheWay='apt-get update && apt-get dist-upgrade --assume-yes && apt autoremove --assume-yes'
alias aptClean='apt-get clean --assume-yes'
alias aptInstall='apt-get install'
alias aptPurge='apt-get purge'
alias aptUpdate='apt-get update'
alias aptUpgrade='apt-get dist-upgrade --assume-yes'
