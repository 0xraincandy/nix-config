{ config, pkgs, ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";

  fileSystems."/mnt/1TB" = {
  device = "UUID=022d009f-3d08-434b-960e-8a7b53064890";
  fsType = "xfs";
  options = [ "defaults" ];
  };

  security.sudo.extraConfig = "Defaults pwfeedback";

  nixpkgs.config.allowUnfree = true;

    }
