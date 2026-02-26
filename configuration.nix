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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    LC_TIME = "nl_NL.UTF-8";
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
  gwenview
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
    ];
  };

# 2nd drive
  fileSystems."/mnt/1TB" = {
    device = "UUID=78acee78-b900-4060-b91d-b9a261a5b747";
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
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    extraPackages = with pkgs; [
      kdePackages.breeze
    ];
  };



# Packages
  environment.systemPackages = with pkgs; [
    vim
    git
    tree
    ruby
    man
    kitty
    librewolf
    vesktop
    input-remapper
    qimgv
    lunar-client
    vlc
    neofetch
    r2modman
    protonplus
    cider-2
    openssh
  ];


  system.stateVersion = "25.11";

}
