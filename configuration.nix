# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:




{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

# Bootloader
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = false;

  boot.loader.grub = {
  enable = true;
  device = "nodev";
  efiSupport = true;
  efiInstallAsRemovable = true;
  theme = "/boot/grub/themes/GrubTheme";
};


# flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


# Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

# bluetooth
  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  settings = {
    General = {
      Experimental = true;
      FastConnectable = true;
    };
    Policy = {
      AutoEnable = true;
    };
  };
};

# Hostname
  networking.hostName = "nixos";

# Network
  networking.networkmanager.enable = true;

# Timezone
  time.timeZone = "Europe/Amsterdam";

# Locale
  i18n.defaultLocale = "nl_NL.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  services.xserver.enable = true;

# Plasma & Displaymanager
  services.displayManager.ly = {
    enable = true;

    settings = {
      lang = "nl";
      numlock = true;
    };
  };

  environment.etc."ly/lang/nl.ini".source =
    /home/remi/.config/ly/nl.ini;



  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  konsole
  elisa
  discover
  okular
];

# Keymap
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };
  console.keyMap = "de";


# Print
  services.printing.enable = true;

# fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

# Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };

# User
  users.users.remi = {
    isNormalUser = true;
    description = "Remilia";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.ark
    ];
  };

# 2nd drive
  fileSystems."/mnt/1TB" = {
    device = "UUID=137d7e54-7a4e-452e-a0ae-d6f256007179";
    fsType = "xfs";
    options = [ "defaults" ];
  };

# flatpak
  services.flatpak.enable = true;

# sudo pw
  security.sudo.extraConfig = "Defaults pwfeedback";

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# gamemode
  programs.gamemode.enable = true;

# steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraPackages = with pkgs; [
      kdePackages.breeze
    ];
  };



# Packages
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
  ];


  system.stateVersion = "25.11";

}
