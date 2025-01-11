# Remove aliases from "directories.zsh"
unalias l
unalias ll
if [[ $NO_EZA == 1 ]]; then
	alias ll='ls -alF'
	alias l='ls -alF'
else
	# eza
	unalias ls
	function ls() {
		eza "${EZA_PARAMS[@]}" "$@"
	}

	alias l='ls -lbF' #   list, size, type
	alias ll='ls -la' # long, all
	alias llm='ll --sort=modified' # list, long, sort by modification date
	alias la='ls -lbhHigUmuSa' # all list
	alias lx='ls -lbhHigUmuSa@' # all list and extended
	alias tree='eza --tree' # tree view
	alias lS='eza -1' # one column by just names
fi
