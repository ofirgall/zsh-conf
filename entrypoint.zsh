# ---------------------------
# Install and load zinit (must be in .zshrc, zinit adding it if it doesn't)
# ---------------------------
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# ---------------------------

optional_source () {
    [[ -f "$1" ]] && source "$1"
}

# ---------------------------
# Source the actual .zshrc files
# ---------------------------
source $HOME/.zsh-conf/aliases.zsh
optional_source $HOME/.my-zsh-conf/aliases.zsh
source $HOME/.zsh-conf/settings.zsh
optional_source $HOME/.my-zsh-conf/settings.zsh
source $HOME/.zsh-conf/design.zsh
optional_source $HOME/.my-zsh-conf/design.zsh
source $HOME/.zsh-conf/plugins.zsh
optional_source $HOME/.my-zsh-conf/plugins.zsh
source $HOME/.zsh-conf/hooks.zsh
optional_source $HOME/.my-zsh-conf/hooks.zsh

# Source user zsh rc
optional_source $HOME/.my_zshrc

# Typer (must be in .zshrc, typer adding it if it doesn't)
autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
compinit # Build completions

### Added by broot
source /home/ofirg/.config/broot/launcher/bash/br

# ---------------------------
# Source post_init.zsh at the end
# ---------------------------
source $HOME/.zsh-conf/post_init.zsh
optional_source $HOME/.my-zsh-conf/post_init.zsh
