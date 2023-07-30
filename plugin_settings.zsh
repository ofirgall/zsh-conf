
# ---------------------------
#		  OMZ:tmux
# ---------------------------
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=false
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_FIXTERM=false

# ---------------------------
#		  FZF Tab
# ---------------------------
if [[ ${ZSH_VERSION:0:3} -ge 5.8 ]]; then
	# disable sort when completing `git checkout`
	zstyle ':completion:*:git-checkout:*' sort false
	# set descriptions format to enable group support
	zstyle ':completion:*:descriptions' format '[%d]'
	# set list-colors to enable filename colorizing
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
	# preview directory's content with exa when completing cd
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
	# switch group using `,` and `.`
	zstyle ':fzf-tab:*' switch-group ',' '.'

	zstyle ':fzf-tab:*' continuous-trigger '\'

	# case insensitive
	zstyle ':fzf-tab:*' fzf-flags '-i'
fi

# ---------------------------
#		  FZF History
# ---------------------------
ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS='--height=10 --reverse'

# ---------------------------
#	histdb integ for zsh-autosuggestions
# ---------------------------
if [[ ${ZSH_VERSION:0:3} -ge 5.1 ]] && command -v sqlite3 &> /dev/null; then
	_zsh_autosuggest_strategy_histdb_top() {
		local query="
			select commands.argv from history
			left join commands on history.command_id = commands.rowid
			left join places on history.place_id = places.rowid
			where commands.argv LIKE '$(sql_escape $1)%'
			group by commands.argv, places.dir
			order by places.dir != '$(sql_escape $PWD)', count(*) desc
			limit 1
		"
		suggestion=$(_histdb_query "$query")
	}

	ZSH_AUTOSUGGEST_STRATEGY=histdb_top
fi
