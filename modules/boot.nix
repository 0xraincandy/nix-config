{ config, pkgs, ...
}:


{
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.kernelPackages = pkgs.linuxPackages_zen;


  environment.etc."grub-theme".source =
  /etc/nixos/.dotfiles/GrubTheme;

  boot.loader.grub = {
  enable = true;
  device = "nodev";
  efiSupport = true;
  efiInstallAsRemovable = true;
};

  }
