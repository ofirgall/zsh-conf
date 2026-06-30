
# ---------------------------
#		 ENV VARS
# ---------------------------

# Skip global compinit before addons
skip_global_compinit=1

# fzf settings
export FZF_DEFAULT_OPTS=""

# PATH
export PATH=~/.local/bin:$PATH
export PATH=$PATH:$HOME/.npm-packages/bin/

# LANG
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# MANPATH
export MANPATH="$HOME/pkgs/usr/share/man:$HOME/.npm-packages/share/man:$MANPATH"

[[ -f "$HOME/.my-zsh-conf/env.zsh" ]] && source "$HOME/.my-zsh-conf/env.zsh"
