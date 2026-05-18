{ config, pkgs, ...
}:

{

  users.users.lesley = {
    isNormalUser = true;
    description = "Lesley";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

}
