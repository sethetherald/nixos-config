{ inputs, config, pkgs, lib, ... }:

{
  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
    };
  };

  programs.waylogout = {
    enable = true;
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/.config/nixos";
      config = ''pushd ${config.home.homeDirectory}/.config/nixos; nvim +Telescope\ find_files; popd'';
    };
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
    };
  };

  programs.nvchad = {
    enable = true;
    backup = false;
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      nixd
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.gitui = {
    enable = true;
  };
}
