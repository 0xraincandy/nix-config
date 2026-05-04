{ config, pkgs, ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";

  fileSystems."/mnt/1TB" = {
    device = "UUID=137d7e54-7a4e-452e-a0ae-d6f256007179";
    fsType = "xfs";
    options = [ "defaults" ];
  };

  security.sudo.extraConfig = "Defaults pwfeedback";

  nixpkgs.config.allowUnfree = true;

    }
