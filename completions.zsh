# ---------------------------
#		Completions
# ---------------------------
# Generate completions into $ZSH_CACHE_DIR/completions/ (already in fpath)
# before compinit runs.

# Cache a completion file, regenerating if older than 15 minutes.
# Usage: cached_completion <name> <generation_command...>
# Example: cached_completion rustup "rustup completions zsh"
cached_completion() {
	local name=$1
	shift
	local cache_file="$ZSH_CACHE_DIR/completions/_$name"

	if [[ -f "$cache_file" ]]; then
		# mm-15: modified within the last 15 minutes
		local fresh=($cache_file(Nmm-15))
		[[ ${#fresh} -gt 0 ]] && return 0
	fi

	eval "$@" > "$cache_file" 2>/dev/null
}

# Example:
# cached_completion rustup "rustup completions zsh"
