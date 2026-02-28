neofetch --backend kitty --source /home/remi/.config/neofetch/png/Seija.png

alias update='sudo nixos-rebuild switch --upgrade'
alias clean='sudo nix-collect-garbage -d'
alias list='sudo nix-env -p /nix/var/nix/profiles/system --list-generations'

export PATH="$HOME/.scripts:$PATH"
