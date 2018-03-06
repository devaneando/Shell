# If you come from bash you might have to change your $PATH.
export PATH=$PATH:.:~/bin:/bin:/sbin:/usr/bin:/usr/games:/usr/local/bin:/usr/local/games:/usr/local/sbin:/usr/sbin:

# Finds what is the base path of the Shell config files
if [[ -L "${HOME}/.zshrc" ]]; then
    export BASE=$(env readlink --canonicalize-missing ${HOME}/.zshrc | /bin/grep --color=never -P "^.*(?=\/App)" -o)
    export ZSH="${BASE}/App/zShell/oh-my-zsh"
fi

# Path to your oh-my-zsh installation.


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="miloshadzic-custom"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="${HOME}/Shell/App/zShell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  branch,
  colored-man-pages,
  colorize,
  command-not-found,
  composer,
  devaneando-aliases,
  devaneando-colors,
  devaneando-functions,
  docker,
  docker-compose,
  emoji,
  fortunes,
  git,
  git-extras,
  history,
  history-substring-search,
  sudo  
)

source $ZSH/oh-my-zsh.sh

# Options
# http://zsh.sourceforge.net/Doc/Release/Options.html
setopt autocd
setopt CDABLE_VARS
setopt PUSHD_IGNORE_DUPS
setopt ALWAYS_TO_END
setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

# User configuration

# You may need to manually set your language environment
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

# Preferred editor for local and remote sessions
export EDITOR='vim'

