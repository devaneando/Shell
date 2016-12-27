# !/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Aliases ۩๑▬▬▬▬▬●

alias service="sudo env service"

##### Apache
alias apacheStart="__services apache start"
alias apacheStop="__services apache stop"

##### FPM
alias fpmStart="__services $(__serviceFpm) start"
alias fpmStop="__services $(__serviceFpm) stop"

##### MySQL
alias mySqlStart="__services mysql start"
alias mySqlStop="__services mysql stop"

##### Nginx
alias nginxStart="__services nginx start"
alias nginxStop="__services nginx stop"

##### Varnish
alias varnishStart="__services varnish start"
alias varnishStop="__services varnish stop"

# ●▬▬▬▬▬๑۩  Functions ۩๑▬▬▬▬▬●

##### Pass actions to the services
function __services()
{
	if [ $# -eq 0 ]; then
		echo "Usage: __services your_service your_action"
		return 0
	fi
	
	if [ -z "$2" ]; then
		sudo --preserve-env env service ${1} start
	fi
	
	if [ "${2}" == "start" ]; then
		sudo --preserve-env env service ${1} stop
		sudo --preserve-env env service ${1} start
	else
		sudo --preserve-env env service ${1} ${2}
	fi
}

##### Finds the correct PHP-FPM service's name
function __serviceFpm()
{
	echo '$(env ps | env grep -m 1 -o "php.*fpm.*")'
}




