# !/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Custom locale settings ۩๑▬▬▬▬▬●

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="pt_PT.UTF-8"
export LC_NUMERIC="pt_PT.UTF-8"
export LC_TIME="pt_PT.UTF-8"
export LC_COLLATE="pt_PT.UTF-8"
export LC_MONETARY="pt_PT.UTF-8"
export LC_PAPER="pt_PT.UTF-8"
export LC_NAME="pt_PT.UTF-8"
export LC_ADDRESS="pt_PT.UTF-8"
export LC_TELEPHONE="pt_PT.UTF-8"
export LC_MEASUREMENT="pt_PT.UTF-8"
export LC_IDENTIFICATION="pt_PT.UTF-8"

# ●▬▬▬▬▬๑۩  Default mysql data ۩๑▬▬▬▬▬●

export SQL_HOST='localhost'
export SQL_USER='yourUser'
export SQL_PASSWORD='yourPassword'

# ●▬▬▬▬▬๑۩  Path ۩๑▬▬▬▬▬●

export PATH=$PATH:.:\
~/bin:\
/bin:\
/sbin:\
/usr/bin:\
/usr/games:\
/usr/local/bin:\
/usr/local/games:\
/usr/local/sbin:\
/usr/sbin:\
:${JAVA_HOME}/bin:\
${JRE_HOME}/bin:

# ●▬▬▬▬▬๑۩  CDPATH: Allows you to add other directories to cd builtin ۩๑▬▬▬▬▬●

export CDPATH=.:\
~:\
~/Desktop:\
~/Documents:

# ●▬▬▬▬▬๑۩  Other variables ۩๑▬▬▬▬▬●

export COWPATH="${BASE}/Apps/Funnies/cowfiles"
export SYMFONY_ENV="prod"

