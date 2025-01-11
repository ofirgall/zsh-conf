# ---------------------------
# Basic ZSH Settings from oh-my-zsh
# ---------------------------

# Functions cant be turbo and must be first
zinit snippet OMZL::functions.zsh
# Can't be turbo for history plugins (autosuggestions)
zinit snippet OMZL::history.zsh

# Can't turbo key-bindings, conflicting with vim-mode
zinit snippet OMZL::key-bindings.zsh

zinit ice wait lucid
zinit snippet OMZL::theme-and-appearance.zsh

zinit ice wait lucid
zinit snippet OMZL::completion.zsh

zinit ice wait lucid
zinit snippet OMZL::correction.zsh

zinit ice wait lucid
zinit snippet OMZL::directories.zsh

zinit ice wait lucid
zinit snippet OMZL::grep.zsh

zinit ice wait lucid
zinit snippet OMZL::misc.zsh

# Lazy load ls_aliases after "theme-and-appearance.zsh" and "directories.zsh"
zinit ice wait'1' link lucid
zinit snippet lazy/ls_aliases.zsh
