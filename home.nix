{ config, pkgs, ... }:

let
  dotfiles = ./.dotfiles;
in
{
  home.username = "lesley";
  home.homeDirectory = "/home/lesley";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.file.".config/kitty".force = true;

  home.file.".config/neofetch".source =
    dotfiles + "/neofetch";

  home.file.".config/kitty".source =
    dotfiles + "/kitty";

  programs.bash = {
  enable = true;

  shellAliases = {
    update = "sudo nixos-rebuild switch --upgrade";
    clean = "sudo nix-collect-garbage -d";
    list = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
  };

  initExtra = ''
    export PATH="$HOME/.scripts:$PATH"

    neofetch() {
      $HOME/.config/neofetch/neofetch "$@"
    }

    if [[ $- == *i* ]]; then
      $HOME/.config/neofetch/neofetch \
        --backend kitty \
        --source $HOME/.config/neofetch/png/lain.png
    fi

    PS1="\[\e[38;2;194;246;255m\][\u@\h:\w]\\$\[\e[0m\] "
  '';
};
}
