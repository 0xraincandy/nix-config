# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/services.nix
      ./modules/environment.nix
      ./modules/etc.nix
      ./modules/gaming.nix
      ./modules/locale.nix
      ./modules/network.nix
      ./modules/packages.nix
      ./modules/plasma-ly.nix
      ./modules/user.nix

      <home-manager/nixos>
    ];


  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.rain = import ./home.nix;

  system.stateVersion = "25.11";

}
