{ config, pkgs, ...
}:

{

  users.users.rain = {
    isNormalUser = true;
    description = "Lieke";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

}
