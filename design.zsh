# ---------------------------
#		Prompt & Theme
# ---------------------------
# Load starship theme
# line 1: `starship` binary as command, from github release
# line 2: starship setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
zinit ice as"command" from"gh-r" \
    atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
    atpull"%atclone" src"init.zsh"
zinit light starship/starship

_gen_starship() {
    echo "Generating $HOME/.config/starship.toml"

    # Convert all files to yamls before merging
    local dir=$(mktemp -d)
    local i=0
    for f in $_starship_files; do
        if [[ -f "$f" ]]; then
            yq eval -oy $f > $dir/$i.yaml
            ((i++))
        fi
    done

    # merge all yamls
    yq eval-all -oy --expression '. as $item ireduce ({}; . *+d $item)' $dir/*.yaml > $dir/merged.yaml

    # convert merged yaml to toml
    cat $dir/merged.yaml | yj -yt > "$HOME/.config/starship.toml"

    rm -rf $dir
}

if [[ $(uname) == "Darwin" ]]; then
    local get_last_modified_time() {
        [[ -f "$1" ]] && stat -f %B $1
    }
else
    local get_last_modified_time() {
        [[ -f "$1" ]] && stat -c %Y $1
    }
fi

if [[ $NERD_FONT == 1 ]]; then
    _starship_files=("$HOME/.zsh-conf/starship.toml" "$HOME/.zsh-conf/starship_nerdfont.toml" "$HOME/.my-zsh-conf/starship.toml")
else
    _starship_files=("$HOME/.zsh-conf/starship.toml" "$HOME/.my-zsh-conf/starship.toml")
fi
local last_time_generated=$(get_last_modified_time "$HOME/.config/starship.toml")

for f in $_starship_files; do
    if [[ $(get_last_modified_time $f) -gt $last_time_generated ]]; then
        _gen_starship
        break
    fi
done
