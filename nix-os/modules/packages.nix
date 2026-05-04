{ config, pkgs, ...
}:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    tree
    (discord.override {
      withVencord = true;
    })
    ruby
    man
    kitty
    librewolf
    input-remapper
    lunar-client
    vlc
    r2modman
    wine
    dxvk
    protonplus
    cider-2
    openssh
    xfsprogs
    fastfetch
    pciutils # neofetch gpu
    mesa-demos # neofetch gpu
    opentabletdriver
    xclicker
    osu-lazer-bin
    kdePackages.ark
    kdePackages.kate
  ];
}
