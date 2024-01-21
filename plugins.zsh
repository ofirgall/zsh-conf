# ---------------------------
#		  Plugins
# ---------------------------
## oh-my-zsh plugins ##
zinit ice wait lucid
zinit snippet OMZP::pip

# Check if VIM_MODE is enabled and zsh version is greater than 5.1 to enable zsh-vi-mode
_VIM_MODE=$(( $VIM_MODE == 1 && ${ZSH_VERSION:0:3} >= 5.1 ))

# sudo by pressing ESC twice, don't load with vim mode enabled
if [[ $_VIM_MODE == 0 ]]; then
	zinit ice wait lucid
	zinit snippet OMZP::sudo
fi

if command -v tmux &> /dev/null; then
	zinit ice wait lucid
	zinit snippet OMZP::tmux
fi

zinit ice wait lucid
zinit snippet OMZP::rust

## Custom Plugins ##
if [[ $_VIM_MODE == 1 ]]; then
	zinit ice depth=1
	zinit light jeffreytse/zsh-vi-mode
fi

zinit ice wait lucid atload'_zsh_autosuggest_start; source_conf binds.zsh' # Lazy load binds
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
