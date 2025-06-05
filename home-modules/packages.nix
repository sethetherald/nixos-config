{ inputs, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    powerstat
    zoxide
    libnotify
    wbg
    wl-clipboard
    cliphist
    rofi-bluetooth
    rofi-network-manager
    rofi-power-menu

    (writeShellScriptBin "startupScript" ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      wbg ${config.home.homeDirectory}/.config/nixos/wallpapers/nixos.png &
    '')
  ];
} 
