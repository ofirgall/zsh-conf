# ---------------------------
#		Completions
# ---------------------------
# Generate completions into $ZSH_CACHE_DIR/completions/ (already in fpath)
# before compinit runs.

# Registry of cached completions: name -> command
typeset -gA _cached_completions

# Cache a completion file, regenerating if older than 15 minutes.
# Usage: cached_completion <name> <generation_command...>
# Example: cached_completion rustup "rustup completions zsh"
cached_completion() {
	local name=$1
	shift
	local cmd="$*"
	local cache_file="$ZSH_CACHE_DIR/completions/_$name"

	_cached_completions[$name]="$cmd"

	if [[ -f "$cache_file" ]]; then
		# mm-15: modified within the last 15 minutes
		local fresh=($cache_file(Nmm-15))
		[[ ${#fresh} -gt 0 ]] && return 0
	fi

	eval "$cmd" > "$cache_file" 2>/dev/null
}

# Regenerate all completions registered via cached_completion.
zsh-regen-comp() {
	local name cmd
	for name cmd in "${(@kv)_cached_completions}"; do
		local cache_file="$ZSH_CACHE_DIR/completions/_$name"
		echo "Regenerating completion: $name"
		eval "$cmd" > "$cache_file" 2>/dev/null
	done
	echo "Done. Run 'exec zsh' to pick up changes."
}

# Example:
# cached_completion rustup "rustup completions zsh"
