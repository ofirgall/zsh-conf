zi ice from"gh-r" as"program"
zi light junegunn/fzf

zi ice from"gh-r" as"program" mv"yq* -> yq"
zi light mikefarah/yq

zi ice from"gh-r" as"program" mv"yj* -> yj"
zi light sclevine/yj

if [[ $(uname) == "Darwin" ]]; then
	if ! command -v eza &> /dev/null; then
		brew install eza
	fi
else
	zi ice from"gh-r" as"program"
	zi light eza-community/eza
fi
