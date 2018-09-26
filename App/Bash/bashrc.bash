# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export BASE="${HOME}/Shell"

if [[ -f "${BASE}/App/Bash/Inc/settings.bash" ]]; then
    source "${BASE}/App/Bash/Inc/settings.bash"
fi

if [[ -f "${BASE}/App/Bash/Inc/aliases.bash" ]]; then
    source "${BASE}/App/Bash/Inc/aliases.bash"
fi

if [[ -f "${BASE}/App/Bash/Inc/other.bash" ]]; then
    source "${BASE}/App/Bash/Inc/other.bash"
fi

if [[ -f "${BASE}/App/Bash/Inc/dirColors.bash" ]]; then
    eval "$(dircolors ${BASE}/App/Bash/Inc/dirColors.bash)"
fi

if [[ -f "${BASE}/App/Bash/Inc/prompt.bash" ]]; then
    source "${BASE}/App/Bash/Inc/prompt.bash"
fi

if [[ -f "${BASE}/App/Bash/Inc/fortunes.bash" ]]; then
    source "${BASE}/App/Bash/Inc/fortunes.bash"
fi

export PATH="$PATH:.:/bin:/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/${HOME}/.composer/vendor/bin"

export CDPATH=~Projects
