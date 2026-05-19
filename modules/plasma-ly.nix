{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-lain-wired-theme";


    extraPackages = with pkgs.kdePackages; [
      qtmultimedia
      qt5compat
    ];
  };


  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "sddm-lain-wired-theme";
      src = ./../.dotfiles/sddm-lain-wired-theme;

      dontBuild = true;
      installPhase = ''
        mkdir -p $out/share/sddm/themes/sddm-lain-wired-theme
        cp -r $src/* $out/share/sddm/themes/sddm-lain-wired-theme/
      '';
    })
  ];

  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    discover
    okular
    qrca
  ];
}
