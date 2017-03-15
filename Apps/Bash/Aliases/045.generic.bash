# !/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Functions ۩๑▬▬▬▬▬●

##### Checks if a process is running and returns 0 if it's not and 1 if it is
##### $1: The process name
function isRunning()
{
  COUNT=`env ps -o command -e | env grep "${1}"| env wc --lines`
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
    sudo  /sbin/iwlist "wlan0" scan |env grep --ignore-case --color=always "Quality"
  else
    sudo  /sbin/iwlist "${1}" scan |env grep --ignore-case --color=always "Quality"
  fi
}

##### Start a virtualbox VM in headless mode
##### $1: VM Name
function vmStart()
{
  if [ $# -ne 1 ]; then
    print error "It's not possible to proceed without the VM name."
    return 999
  fi

  env vboxmanage startvm "$1" --type headless
}

##### Stop a virtualbox VM
##### $1: VM Name
function vmStop()
{
  if [ $# -ne 1 ]; then
    print error "It's not possible to proceed without the VM name."
    return 999
  fi

  env vboxmanage controlvm "$1" savestate
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
    print info "-h/--help\tDisplays this help"
    print info "-p/--paragraph\tNumbers of paragraphs to display"
    print info "-s/--size\tSize of the paragraphs. Accepted values: 'short', 'medium', 'long', 'verylong'"
    echo -e "\n"
    curl "${url}/2/medium"
    return 0
  fi

  for i in "$@"; do
    case $i in
      -p=*|--paragraph=*)
        paragraphs="${i#*=}"
        shift # past argument=value
        ;;
      -s=*|--size=*)
        size="${i#*=}"
        shift # past argument=value
        ;;
      -h|--help)
        print info "-h/--help\tDisplays this help"
        print info "-p/--paragraph\tNumbers of paragraphs to display"
        print info "-s/--size\tSize of the paragraphs. Accepted values: 'short', 'medium', 'long', 'verylong'"
        return 0
        ;;
    esac
  done
  curl "${url}/${size}/${paragraphs}"
}

##### Searches the history for data
function historyFind()
{
  if [ -z "$1" ]; then
    print error "You must provide the terms you want to search for!"
    return 0
  fi

  history | grep "${1}" | env cut --characters=8- | env sort --ignore-case --ignore-nonprinting --ignore-leading-blank --unique
}

# Cow-spoken fortunes every time you open a terminal
function cowsayfortune {
  NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
  WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
  THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

   #echo "Selected cow: ${THISCOW}, from ${WHICHCOW}"
   fortune -as | cowsay -f $THISCOW 
}
