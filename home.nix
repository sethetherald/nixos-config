{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.twilight
    inputs.nix4nvchad.homeManagerModule
    inputs.catppuccin.homeModules.catppuccin
    inputs.xremap.homeManagerModules.default
    ./home-modules/programs.nix
    ./home-modules/packages.nix
    ./home-modules/services.nix
    ./home-modules/files.nix
    ./home-modules/session.nix
    ./home-modules/git.nix
    ./home-modules/hyprland.nix
    ./home-modules/waybar.nix
  ];

  home.username = "seth";
  home.homeDirectory = "/home/seth";

  catppuccin = {
    enable = true;
    gtk = {
      enable = true;
      flavor = "macchiato";
      accent = "flamingo";
      icon = {
        enable = true;
        flavor = "macchiato";
        accent = "flamingo";
      };
    };
    cursors = {
      enable = true;
      flavor = "macchiato";
      accent = "flamingo";
    };
    flavor = "macchiato";
    accent = "flamingo";
  };

  gtk = {
    enable = true;
  };

  home.stateVersion = "25.05";
}
