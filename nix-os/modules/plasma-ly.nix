{ config, pkgs, ...
}:

{

  services.xserver.enable = true;

  services.displayManager.ly = {
    enable = true;

    settings = {
      lang = "nl";
      numlock = true;
    };
  };

  environment.etc."ly/lang/nl.ini".source =
    /home/rain/.config/ly/nl.ini;

  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  konsole
  elisa
  discover
  okular
];

}
