{ config, pkgs, ... }:

let
  grubTheme = pkgs.stdenv.mkDerivation {
    name = "grub-theme";

    src = /etc/nixos/.dotfiles/GrubTheme;

    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';
  };

in
{
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    efiInstallAsRemovable = true;

    theme = grubTheme;
  };
}
