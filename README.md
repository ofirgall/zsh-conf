# Zsh Config
Extendable zsh config powered by [zinit](https://github.com/zdharma-continuum/zinit) + [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh).

## Installation
```bash
mv ~/.zshrc ~/.zshrc_bakup # Backup your zshrc

git clone --depth=1 https://github.com/ofirgall/zsh-conf ~/.zsh-conf/ # Clone zsh-conf
ln -s ~/.zsh-conf/entrypoint.zsh ~/.zshrc # Link ~/.zshrc to point to ~/.zsh-conf/entrypoint.zsh
ln -s ~/.zsh-conf/env.zsh ~/.zshenv # Link ~/.zshenv to point to ~/.zsh-conf/env.zsh
ln -s ~/.zsh-conf/starship.toml ~/.config/starship.toml # Link starship config

# Generate personal zsh config folder
mkdir ~/.my-zsh-conf/
cp ~/.zsh-conf/vars.zsh ~/.my-zsh-conf/
```

## Plugins
- [starship](https://github.com/starship/starship) - Prompt.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Suggest completions with dimmed text (hit `Right` to accept)
- [fzf-tab](https://github.com/Aloxaf/fzf-tab) - Use [fzf](https://github.com/junegunn/fzf) for tab completions.
- [zsh-fzf-history-search](https://github.com/joshskidmore/zsh-fzf-history-search) - Use [fzf](https://github.com/junegunn/fzf) for reverse search (ctrl-r).
- [oh-my-zsh/sudo](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo) - Hit escape twice to toggle sudo for current command.
- [zsh-autopair](https://github.com/hlissner/zsh-autopair) - Add closing pair while typing.
- [zsh-histdb](https://github.com/larkery/zsh-histdb) - History per dir (requires sqlite3).
- [cd-to-git](https://github.com/ofirgall/cd-to-git) - cd to git dir's with [fzf](https://github.com/junegunn/fzf).
- [up](https://github.com/peterhurford/up.zsh) - Go up multiple dirs `up <N>`.
- [git-open](https://github.com/paulirish/git-open) - `git open` to open current git repo in browser.
- [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode) - vim mode in zsh (Disabled by default).
- [zsh-completions](https://github.com/zsh-users/zsh-completions) - Add more default completions.

## Extend
Every config file that is being sourced from `~/.zsh-conf/` is also being sourced from `~/.my-zsh-conf/`.
In addition `~/.my_zshrc` is loaded as well.

For example in order to add aliases you should create `~/.my-zsh-conf/aliases.zsh` and add them there. You can add them in `~/.my_zshrc` as well.

### Config loading order
- [vars.zsh](https://github.com/ofirgall/zsh-conf/blob/master/vars.zsh) - Config variables.
- [aliases.zsh](https://github.com/ofirgall/zsh-conf/blob/master/aliases.zsh) - Aliases.
- [settings.zsh](https://github.com/ofirgall/zsh-conf/blob/master/settings.zsh) - zsh settings.
- [design.zsh](https://github.com/ofirgall/zsh-conf/blob/master/design.zsh) - Prompt.
- [plugin_settings.zsh](https://github.com/ofirgall/zsh-conf/blob/master/plugin_settings.zsh) - Settings for plugins.
- [plugins.zsh](https://github.com/ofirgall/zsh-conf/blob/master/plugins.zsh) - Plugins declarations.
- [hooks.zsh](https://github.com/ofirgall/zsh-conf/blob/master/hooks.zsh) - zsh hooks.
- [binaries.zsh](https://github.com/ofirgall/zsh-conf/blob/master/binaries.zsh) - Binaries to install with zinit.
