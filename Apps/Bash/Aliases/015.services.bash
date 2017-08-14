#!/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Aliases ۩๑▬▬▬▬▬●

alias service="sudo env service"

##### Apache
alias apacheStart="sudo env service apache2 start"
alias apacheStop="sudo env service apache2 stop"
alias apacheRestart="sudo env service apache2 stop && sudo env service apache2 start"

##### MySQL
alias mySqlStart="sudo env service mysql start"
alias mySqlStop="sudo env service mysql stop"
alias mySqlRestart="sudo env service mysql stop && sudo env service mysql start"

##### Nginx
alias nginxStart="sudo env service nginx start"
alias nginxStop="sudo env service nginx stop"
alias nginxRestart="sudo env service nginx stop && sudo env service nginx start"

##### Varnish
alias varnishStart="sudo env service varnish start"
alias varnishStop="sudo env service varnish stop"
alias varnishRestart="sudo env service varnish stop && sudo env service varnish start"
