{ inputs, config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    settings = {
      monitor = "eDP-1,1920x1080@60,0x0,1";
      exec-once = "startupScript";
      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "0xfff5c2e7 0xffb4befe 45deg";
        "col.inactive_border" = "0xff6e6c7e";
        layout = "dwindle";
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      misc = {
        disable_hyprland_logo = true;
        vfr = true;
      };
      decoration = {
        rounding = 5;
        active_opacity = "1";
        inactive_opacity = "0.8";
        shadow.enabled = false;
        blur.enabled = false;
      };
      animations.enabled = false;
      gestures.workspace_swipe = true;
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$browser" = "zen-twilight -P seth";
      "$filemanager" = "$terminal yazi";
      "$menu" = "rofi -show drun -show-icons";
      "$clipboard" = "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy";
      "$powermenu" = "rofi -show p -modi p:'rofi-power-menu' -theme-str 'window {width: 20em; height: 8em;} listview {border:0;} mainbox { children: [listview] ;}'";
      bind = [
        "$mod, Q, killactive"
        "$mod, W, exec, $browser"
        "$mod, RETURN, exec, $terminal"
        "$mod, D, exec, $menu"
        "$mod, F, exec, $filemanager"
        "$mod, X, exec, $powermenu"
        "$mod, V, exec, $clipboard"
      ];
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
    };
  };
}
