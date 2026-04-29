#!/usr/bin/env zsh
# Preview helper for fzf-tab. Receives $realpath from fzf-tab's eval context.

# --- debug ---
{
	print -r -- "==== $(date +%T) ===="
	print -r -- "realpath=[$realpath]"
	print -r -- "realpath type: $(typeset -p realpath 2>&1)"
	print -r -- "word=[$word]"
	print -r -- "group=[$group]"
	print -r -- "desc=[$desc]"
	print -r -- "PWD=[$PWD]"
} >> /tmp/fzf-tab-preview.log 2>&1
# --- end debug ---

[[ -z $realpath ]] && return

if [[ -d $realpath ]]; then
	ls -lh --color=always --time-style=long-iso -- $realpath
elif [[ -f $realpath ]]; then
	stat --printf='%n\nmodified: %y\nsize: %s bytes\n\n' -- $realpath
	bat --color=always --style=plain --line-range=:50 -- $realpath 2>/dev/null \
		|| head -50 -- $realpath
fi
