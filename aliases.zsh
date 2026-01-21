
alias pwdc='echo \"$(pwd)\" | tr -d "\n" | toclip'
alias pwdcd='echo "cd \"$(pwd)\"" | toclip'

function get_ticket() {
	# If argument passed parse ticket num from the arg
	if [ -n "$1" ]; then
		echo "$1" | grep -oP "([A-Z]+-[0-9]+)"
		return
	fi

	local branch=$(git rev-parse --abbrev-ref HEAD 2>&1 | tr -d "\n")
	if echo $branch | grep -q "fatal"; then
		# non git folder, try to from pwd
		local from_pwd=$(echo "$PWD" | grep -oP "([A-Z]+-[0-9]+)")
		if [ -z $from_pwd ]; then
			if [ -n "$TMUX" ]; then
				# failed from pwd, try from current tmux session
				local current_session=$(tmux display-message -p '#S')
				echo "$current_session" | grep -oP "([A-Z]+-[0-9]+)"
			fi
		else
			echo $from_pwd
		fi
	else
		echo $branch | grep -oP ".+/\K([A-Z]+-[0-9]+)"
	fi
}

# Tickets & Branches
alias cticket='get_ticket | toclip'
alias ticket='open $JIRA_URL/browse/$(get_ticket)'
alias cbranch='git rev-parse --abbrev-ref HEAD | tr -d "\n" | toclip'

# Tmux
alias tkill='tmux kill-session'
alias trename='tmux rename-session'

# cd aliases
alias cdl='cd "$_"' # cd to last arg (usefull after mkdir)

# Misc
function p() { python -c "print($@)"} # run single python command
alias drop_cache='sync; echo 1 | sudo tee /proc/sys/vm/drop_caches'

# Create log dir & cd for the current ticket by git/pwd/passed argument
function logs() {
	ticket=$(get_ticket $1)
	if ! test -d ~/logs/$ticket; then
		mkdir -p ~/logs/$ticket
	fi
	cd ~/logs/$ticket
}

# Git aliases, no git plugin
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gs='git status'
alias gst='git status'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias ghs='git hist'
alias ghist='git hist'
alias gdiff='git diff'
alias gshow='git show'
alias grim='git rebase -i origin/master'
alias groot='cd $(git rev-parse --show-toplevel)'
