# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/joshaddington/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="theunraveler"

BULLETTRAIN_PROMPT_ORDER=(
  git
  dir
  time
)

plugins=(
  git
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joshaddington/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joshaddington/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joshaddington/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joshaddington/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

alias dp="dockerpromote"
alias cld="closedocker"

alias dc="DISABLE_BULLET=1 docker-compose"
alias dy="dc run --rm app yarn"
alias da="dc run --rm app"
alias dr="dc restart"

alias dra="dc stop app && dc start app"
alias dras="dc stop assets && dc start assets"
alias drw="dc stop web && dc start web && dra"

# alias dslog="docker-sync logs -f | awk '/Synchronization/ { print }'"
alias dslog="docker-compose logs -f sync | awk '/Synchronization/ { print }'"

alias snaps="da rm spec/fixtures/snapshots/partner_v2_application.scss.snapshot && da rm spec/fixtures/snapshots/mini_partner_v2_application.scss.snapshot && da bin/rspec spec_redux/services/assets"
