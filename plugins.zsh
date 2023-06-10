# ---------------------------
#		  Plugins
# ---------------------------
## oh-my-zsh plugins ##
zinit ice wait lucid
zinit snippet OMZP::pip

zinit ice wait lucid
zinit snippet OMZP::sudo

zinit ice wait lucid
zinit snippet OMZP::tmux

zinit ice wait lucid
zinit snippet OMZP::rust

## Custom Plugins ##
if [[ ! -z $VIM_MODE && ${ZSH_VERSION:0:3} -ge 5.1 ]]; then
	zinit ice depth=1
	zinit light jeffreytse/zsh-vi-mode
fi

zinit ice wait lucid atload'_zsh_autosuggest_start; bindkey "^ " autosuggest-accept'
zinit light zsh-users/zsh-autosuggestions

if [[ ${ZSH_VERSION:0:3} -ge 5.8 ]]; then
	zinit ice wait lucid
	zinit light Aloxaf/fzf-tab
fi

zinit ice wait lucid
zinit light ofirgall/cd-to-git

zinit ice wait lucid
zinit light paulirish/git-open

zinit ice wait lucid
zinit light peterhurford/up.zsh

zinit ice wait lucid
zinit light joshskidmore/zsh-fzf-history-search

if [[ ${ZSH_VERSION:0:3} -ge 5.1 ]] && command -v sqlite3 &> /dev/null; then
	zinit ice wait lucid
	zinit light larkery/zsh-histdb
fi

# zsh-completions
zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions

zinit ice wait lucid
zinit light hlissner/zsh-autopair
