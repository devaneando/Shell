#!/usr/bin/env bash
# vim: ft=bash ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for BASH
#
# (Converted from ZSH theme by Kenny Root)
# https://gist.github.com/kruton/8345450
#
# Updated & fixed by Erik Selberg erik@selberg.org 1/14/17
# Tested on MacOSX, Ubuntu, Amazon Linux
# Bash v3 and v4
#

# note: requires bash v4+... Mac users - you often have bash3.
# 'brew install bash' will set you free
PROMPT_DIRTRIM=2 # bash4 and above

######################################################################
DEBUG=0
function debug() {
    if [[ ${DEBUG} -ne 0 ]]; then
        echo >&2 -e $*
    fi
}

######################################################################
### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
CURRENT_RBG='NONE'
SEGMENT_SEPARATOR=''
RIGHT_SEPARATOR=''
LEFT_SUBSEG=''
RIGHT_SUBSEG=''

function text_effect() {
    case "$1" in
    reset) echo 0 ;;
    bold) echo 1 ;;
    underline) echo 4 ;;
    esac
}

# to add colors, see
# http://bitmote.com/index.php?post/2012/11/19/Using-ANSI-Color-Codes-to-Colorize-Your-Bash-Prompt-on-Linux
# under the "256 (8-bit) Colors" section, and follow the example for orange below
# See also http://misc.flogisoft.com/bash/tip_colors_and_formatting
function fg_color() {
    case "$1" in
    default) echo 39 ;;
    black) echo 30 ;;
    red) echo 31 ;;
    red_light) echo 91 ;;
    green) echo 32 ;;
    green_light) echo 92 ;;
    yellow) echo 33 ;;
    yellow_light) echo 93 ;;
    blue) echo 34 ;;
    blue_light) echo 94 ;;
    magenta) echo 35 ;;
    magenta_light) echo 95 ;;
    cyan) echo 36 ;;
    cyan_light) echo 96 ;;
    white) echo 37 ;;
    orange) echo 38\;5\;166 ;;
    gray) echo 90 ;;
    gray_light) echo 37 ;;
    esac
}

function bg_color() {
    case "$1" in
    default) echo 49 ;;
    black) echo 40 ;;
    red) echo 41 ;;
    red_light) echo 101 ;;
    green) echo 42 ;;
    green_light) echo 102 ;;
    yellow) echo 43 ;;
    yellow_light) echo 103 ;;
    blue) echo 44 ;;
    blue_light) echo 104 ;;
    magenta) echo 45 ;;
    magenta_light) echo 105 ;;
    cyan) echo 46 ;;
    cyan_light) echo 106 ;;
    white) echo 47 ;;
    orange) echo 48\;5\;166 ;;
    gray) echo 100 ;;
    gray_light) echo 47 ;;
    esac
}

# TIL: declare is global not local, so best use a different name
# for codes (mycodes) as otherwise it'll clobber the original.
# this changes from BASH v3 to BASH v4.
function ansi() {
    local seq
    declare -a mycodes=("${!1}")

    debug "ansi: ${!1} all: $* aka ${mycodes[@]}"

    seq=""
    for ((i = 0; i < ${#mycodes[@]}; i++)); do
        if [[ -n $seq ]]; then
            seq="${seq};"
        fi
        seq="${seq}${mycodes[$i]}"
    done
    debug "ansi debug:" '\\[\\033['${seq}'m\\]'
    echo -ne '\[\033['${seq}'m\]'
    #    PR="$PR\[\033[${seq}m\]"
}

function ansi_single() {
    echo -ne '\[\033['$1'm\]'
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
function prompt_segment() {
    local bg fg
    declare -a codes

    debug "Prompting $1 $2 $3"

    # if commented out from kruton's original... I'm not clear
    # if it did anything, but it messed up things like
    # prompt_status - Erik 1/14/17

    #    if [[ -z $1 || ( -z $2 && $2 != default ) ]]; then
    codes=("${codes[@]}" $(text_effect reset))
    #    fi
    if [[ -n $1 ]]; then
        bg=$(bg_color $1)
        codes=("${codes[@]}" $bg)
        debug "Added $bg as background to codes"
    fi
    if [[ -n $2 ]]; then
        fg=$(fg_color $2)
        codes=("${codes[@]}" $fg)
        debug "Added $fg as foreground to codes"
    fi

    debug "Codes: "
    #    declare -p codes

    if [[ $CURRENT_BG != NONE && $1 != $CURRENT_BG ]]; then
        declare -a intermediate=($(fg_color $CURRENT_BG) $(bg_color $1))
        debug "pre prompt " $(ansi intermediate[@])
        PR="$PR $(ansi intermediate[@])$SEGMENT_SEPARATOR"
        debug "post prompt " $(ansi codes[@])
        PR="$PR$(ansi codes[@]) "
    else
        debug "no current BG, codes is $codes[@]"
        PR="$PR$(ansi codes[@]) "
    fi
    CURRENT_BG=$1
    [[ -n $3 ]] && PR="$PR$3"
}

# End the prompt, closing any open segments
function prompt_end() {
    if [[ -n $CURRENT_BG ]]; then
        declare -a codes=($(text_effect reset) $(fg_color $CURRENT_BG))
        PR="$PR $(ansi codes[@])$SEGMENT_SEPARATOR"
    fi
    declare -a reset=($(text_effect reset))
    PR="$PR $(ansi reset[@])"
    CURRENT_BG=''
}

######################################################################
#
# experimental right prompt stuff
# requires setting prompt_foo to use PRIGHT vs PR
# doesn't quite work per above

function rightprompt() {
    printf "%*s" $COLUMNS "$PRIGHT"
}

# quick right prompt I grabbed to test things.
function __command_rprompt() {
    local times n=$COLUMNS tz
    for tz in ZRH:Europe/Zurich PIT:US/Eastern \
        MTV:US/Pacific TOK:Asia/Tokyo; do
        [ $n -gt 40 ] || break
        times="$times ${tz%%:*}\e[30;1m:\e[0;36;1m"
        times="$times$(TZ=${tz#*:} date +%H:%M)\e[0m"
        n=$(($n - 10))
    done
    [ -z "$times" ] || printf "%${n}s$times\\r" ''
}
# PROMPT_COMMAND=__command_rprompt

# this doens't wrap code in \[ \]
function ansi_r() {
    local seq
    declare -a mycodes2=("${!1}")

    debug "ansi: ${!1} all: $* aka ${mycodes2[@]}"

    seq=""
    for ((i = 0; i < ${#mycodes2[@]}; i++)); do
        if [[ -n $seq ]]; then
            seq="${seq};"
        fi
        seq="${seq}${mycodes2[$i]}"
    done
    debug "ansi debug:" '\\[\\033['${seq}'m\\]'
    echo -ne '\033['${seq}'m'
    #    PR="$PR\[\033[${seq}m\]"
}

# Begin a segment on the right
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
function prompt_right_segment() {
    local bg fg
    declare -a codes

    debug "Prompt right"
    debug "Prompting $1 $2 $3"

    # if commented out from kruton's original... I'm not clear
    # if it did anything, but it messed up things like
    # prompt_status - Erik 1/14/17

    #    if [[ -z $1 || ( -z $2 && $2 != default ) ]]; then
    codes=("${codes[@]}" $(text_effect reset))
    #    fi
    if [[ -n $1 ]]; then
        bg=$(bg_color $1)
        codes=("${codes[@]}" $bg)
        debug "Added $bg as background to codes"
    fi
    if [[ -n $2 ]]; then
        fg=$(fg_color $2)
        codes=("${codes[@]}" $fg)
        debug "Added $fg as foreground to codes"
    fi

    debug "Right Codes: "
    #    declare -p codes

    # right always has a separator
    #    if [[ $CURRENT_RBG != NONE && $1 != $CURRENT_RBG ]]; then
    #	$CURRENT_RBG=
    #    fi
    declare -a intermediate2=($(fg_color $1) $(bg_color $CURRENT_RBG))
    #    PRIGHT="$PRIGHT---"
    debug "pre prompt " $(ansi_r intermediate2[@])
    PRIGHT="$PRIGHT$(ansi_r intermediate2[@])$RIGHT_SEPARATOR"
    debug "post prompt " $(ansi_r codes[@])
    PRIGHT="$PRIGHT$(ansi_r codes[@]) "
    #   else
    #	debug "no current BG, codes is $codes[@]"
    #	PRIGHT="$PRIGHT$(ansi codes[@]) "
    #    fi
    CURRENT_RBG=$1
    [[ -n $3 ]] && PRIGHT="$PRIGHT$3"
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
function prompt_time() {
    prompt_segment magenta white "\t"
}

# Dir: current working directory
function prompt_dir() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        prompt_segment cyan black "\W@ssh"
    else
        prompt_segment blue_light black '\W'
    fi
}

# Git: branch/detached head, dirty status
function git_status_dirty() {
    dirty=$(git status -s 2>/dev/null | tail -n 1)
    [[ -n $dirty ]] && echo ""
}

function prompt_git() {
    local ref dirty
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        ZSH_THEME_GIT_PROMPT_DIRTY='±'
        dirty=$(git_status_dirty)
        ref=$(git symbolic-ref HEAD 2>/dev/null) || ref="➦ $(git show-ref --head -s --abbrev | head -n1 2>/dev/null)"
        if [[ -n $dirty ]]; then
            prompt_segment yellow black
        else
            prompt_segment green black
        fi
        PR="$PR${ref/refs\/heads\// }"
    fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
function prompt_status() {
    local symbols
    symbols=()
    if [[ $RETVAL -ne 0 ]]; then
        symbols+="$(ansi_single $(fg_color red))✘"
    else
        symbols+="$(ansi_single $(fg_color green))✓"
    fi

    [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

######################################################################
## Main prompt

function build_prompt() {
    prompt_time
    prompt_git
    prompt_dir
    prompt_status
    prompt_end
}

# from orig...
# export PS1='$(ansi_single $(text_effect reset)) $(build_prompt) '
# this doesn't work... new model: create a prompt via a PR variable and
# use that.

function set_bash_prompt() {
    RETVAL=$?
    PR=""
    PRIGHT=""
    CURRENT_BG=NONE
    PR="$(ansi_single $(text_effect reset))"
    build_prompt

    # uncomment below to use right prompt
    #     PS1='\[$(tput sc; printf "%*s" $COLUMNS "$PRIGHT"; tput rc)\]'$PR
    PS1=$PR
}

PROMPT_COMMAND=set_bash_prompt
