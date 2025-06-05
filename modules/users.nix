{ config, pkgs, lib, inputs, ... }:

{
  users.users.seth = {
    isNormalUser = true;
    description = "seth";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "seth" = {
        imports = [
          ../home.nix
        ];
      };
    };
  };
}
