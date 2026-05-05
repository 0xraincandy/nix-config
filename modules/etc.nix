{ config, pkgs, ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";

  fileSystems."/mnt/1TB" = {
  device = "UUID=abfd2ddc-798d-4ea6-bba4-b7fe67d96e00";
  fsType = "xfs";
  options = [ "defaults" ];
  };

  security.sudo.extraConfig = "Defaults pwfeedback";

  nixpkgs.config.allowUnfree = true;

    }
