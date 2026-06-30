bindkey "^ " autosuggest-accept # Accept suggestions with ctrl+space

# Edit cmd-line in editor with ctrl+x+e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
