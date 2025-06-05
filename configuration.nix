{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/console.nix
      ./modules/users.nix
      ./modules/networking.nix
      ./modules/services.nix
      ./modules/environment.nix
      ./modules/fonts.nix
      ./modules/locale.nix
      ./modules/programs.nix
      inputs.home-manager.nixosModules.default
    ];
  
  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "flamingo";
  };

  system.stateVersion = "24.11";
}
