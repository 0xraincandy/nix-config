if [[ $- == *i* ]]; then
  ~/.config/neofetch/neofetch --backend kitty --source "$HOME/.config/neofetch/png/mabel5.png"
fi

neofetch() {
  "$HOME/.config/neofetch/neofetch" "$@"
}

alias update='sudo nixos-rebuild switch --upgrade'
alias clean='sudo nix-collect-garbage -d'
alias list='sudo nix-env -p /nix/var/nix/profiles/system --list-generations'

export PATH="$HOME/.scripts:$PATH"

PS1="\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] "
