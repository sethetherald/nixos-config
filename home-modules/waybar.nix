{ configs, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        mode = "dock";
        margin-left = 4;
        margin-right = 4;
        margin-top = 4;
        margin-bottom = 0;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        reload_style_on_change = true;

        modules-left = [ 
          "custom/smallspacer" 
          "hyprland/workspaces" 
          "custom/spacer" 
        ];
        modules-center = [
          "custom/padd" 
          "custom/smallspacer" 
          "custom/smallspacer" 
          "hyprland/window" 
          "custom/padd"
        ];
  	    modules-right = [
          "custom/padd" 
          "custom/smallspacer" 
          "group/expand" 
          "network"
          "bluetooth"
          "idle_inhibitor"
          "group/expand-3" 
          "group/expand-2" 
          "memory" 
          "cpu"
          "battery"
          "clock" 
          "custom/padd"
        ];

        "hyprland/workspaces" = {
	        format = "{icon}";
	        format-icons = {
	          default = " ";
	          active = " ";
	        };
        };

        "hyprland/window" = {  
          format = "<span weight='bold'>{}</span>";
          max-length = 120;
          icon = false;
          tooltip = false;
        };

        "group/expand-2" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 600;
            children-class = "not-power";
            transition-to-left = true;
            click-to-reveal = true;
          };
          modules = [ "backlight" "backlight/slider" "custom/smallspacer" ];
        };

        "backlight" = {
          device = "intel_backlight";
          rotate = 0;
          format = "{icon}";
          format-icons = [ "󰃞 " "󰃝 " "󰃟 " "󰃠 " ];
          scroll-step = 10;
          min-length = 2;
        };

        "backlight/slider" = {
          min = 5;
          max = 100;
          rotate = 0;
          device = "intel_backlight";
          scroll-step = 10;
        };
        
        "group/expand" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 600;
            children-class = "not-power";
            transition-to-left = true;
          };
          modules = [ "custom/menu" "custom/spacer" "tray"];
        };

        "custom/menu" = {
          format = "󰅃";
          rotate = 90;
        };

        "tray" = {
          icon-size = 16;
          rotate = 0;
          spacing = 3;
        };

        "network" = {
          tooltip = true;
          format-wifi = "{icon}";
          format-icons = ["󰤟 " "󰤢 " "󰤥 "];
          rotate = 0;
          format-ethernet = "󰈀 ";
          tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = " ";
          tooltip-format-disconnected = "Disconnected";
          interval = 2;
          on-click = "rofi-network-manager";
        };

        "bluetooth" = {
	        format = "󰯯 ";
	        format-connected = "󰯯 ";
	        format-connected-battery = "󰯯 ";
	        tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
	        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
	        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
	        tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          on-click = "rofi-bluetooth";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          rotate = 0;
          format-icons = {
            activated = "󰮔 ";
            deactivated = "󰮕 ";
          };
        };

        "group/expand-3" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 600;
            children-class = "not-power";
            transition-to-left = true;
            click-to-reveal = true;
          };
          modules = ["pulseaudio" "pulseaudio/slider"];
        };

        "pulseaudio" = {
          format = "{icon}";
          rotate = 0;
          format-muted = "婢";
          tooltip-format = "{icon} {desc} // {volume}%";
          scroll-step = 5;
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [ " " " " " "];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          rotate = 0;
          format-source = "";
          format-source-muted = " ";
          tooltip-format = "{format_source} {source_desc} // {source_volume}%";
          scroll-step = 5;
        };

        "pulseaudio/slider" = {
          min = 5;
          max = 100;
          rotate = 0;
          device = "pulseaudio";
          scroll-step = 5;
        };

        "memory" = {
          interval = 1;
          format = "{icon}";
          format-icons = [ "󰝦 " "󰪞 " "󰪟 " "󰪠 " "󰪡 " "󰪢 " "󰪣 " "󰪤 " "󰪥 " ];
        };

        "cpu" = {
          interval = 1;
          format = "{icon}";
          format-icons = [ "󰝦 " "󰪞 " "󰪟 " "󰪠 " "󰪡 " "󰪢 " "󰪣 " "󰪤 " "󰪥 "];
        };

        
        "battery" = {
          interval = 30;
          states = {
            good = 70;
            warning = 30;
            critical = 20;
          };
          format = "{icon}";
          rotate = 0;
          format-charging = "<span color='#a6d189'>󰠠 </span>";
          format-plugged = " ";
          format-icons = [ "󰝦 " "󰪞 " "󰪟 " "󰪠 " "󰪡 " "󰪢 " "󰪣 " "󰪤 " "󰪥 " ];
          tooltip = true;
          tooltip-format = "{timeTo}\nat {capacity}%";
        };

        "clock" = {
          format = "{:%I:%M %p}";
          rotate = 0;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b>{}</b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        "custom/smallspacer" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };

        "custom/spacer" = {
          format = "|";
        };

        "custom/padd" = {
          format = "  ";
          interval = "once";
          tooltip = false;
        };
      }
    ];

    style = ''
      * {
        font-family: "JetBrains Mono Nerd Font";
        font-weight: bold; 
        font-size: 15px;
      }

      window#waybar {
        background: #181926;
        border: 3px solid rgba(255, 255, 255, 0.1);
        border-radius: 10px;
      }

      tooltip {
        background: #1e2030;
        color: #8aadf4;
        font-size: 13px;
        border-radius: 7px;
        border: 2px solid #101a24;
      }

      #workspaces {
        background: rgba(30, 32, 48, 0.0);
        color: #a5adcb;
        box-shadow: none;
        text-shadow: none;
        border-radius: 9px;
        transition: 0.2s ease;
        padding-left: 4px;
        padding-right: 4px;
        padding-top: 1px;
      }

      #workspaces button {
        background: rgba(30, 32, 48, 0.0);
        color: #8aadf4;
        border: none;
        box-shadow: none;
        text-shadow: none;
        transition: 0.2s ease;
        padding-left: 4px;
        padding-right: 4px;
      }

      #workspaces button.active {
        color: #8aadf4;
        transition: all 0.3s ease;
        padding-left: 4px;
        padding-right: 4px;
      }

      #workspaces button:hover {
        border-color: transparent;
        box-shadow: none;
        text-shadow: none;
        background: none;
        transition: none;
      }

      #custom-spacer,
      #custom-smallspacer {
        opacity: 0.0;
      }

      #backlight {
        color: #7dc4e4;
        background: rgba(30, 32, 48, 0.0);
        font-weight: normal;
        margin: 4px 0px 4px 0px;
        padding-left: 4px;
        padding-right: 4px;
      }

      #bluetooth {
        color: #cad3f5;
        opacity: 1;
        margin: 4px 0px 4px 0px;
        padding-left: 4px;
        padding-right: 4px;
      }

      #battery {
        font-weight: normal;
        color: #a6da95;
        background: rgba(30, 32, 48, 0.0);
        opacity: 1;
        margin: 4px 0px 4px 0px;
        padding-left: 4px;
        padding-right: 4px;
      }

      #idle_inhibitor {
        color: #8bd5ca;
        opacity: 1;
        margin: 4px 0px 4px 0px;
        padding-left: 4px;
        padding-right: 4px;
      }

      #clock {
        color: #8aadf4;
        font-weight: 900;
        font-family: "JetBrains Mono Nerd Font";
        background: rgba(30, 32, 48, 0.0);
        opacity: 1;
        margin: 4px 0px 4px 0px;
        padding-left: 4px;
        padding-right: 4px;
        border: none;
      }

      #pulseaudio {
        font-weight: normal;
        color: #b7bdf8;
        background: rgba(30, 32, 48, 0.0);
        opacity: 1;
        margin: 4px 0px 4px 0px;
        padding-left: 4px;
        padding-right: 4px;
      }

      #cpu {
        font-weight: normal;
        margin: 4px 0px 4px 0px;
        color: #c6a0f6;
        padding-left: 4px;
        padding-right: 4px;
      }

      #memory {
        font-weight: normal;
        margin: 4px 0px 4px 0px;
        color: #eed49f;
        padding-left: 4px;
        padding-right: 4px;
      }

      @keyframes blink {
        to {
          color: #4a4a4a;
        }
      }

      #network {
        color: #8aadf4;
        margin: 4px 0px 4px 0px;
        font-weight: normal;
        padding-right: 4px;
        padding-left: 4px;
      }

      #tray,
      #window {
        color: #8aadf4;
        font-family: "JetBrains Mono Nerd Font";
      }

      #backlight-slider slider,
      #pulseaudio-slider slider {
        border: none;
        background: #8aadf4;
        background-color: transparent;
        box-shadow: none;
        margin-right: 7px;
      }

      #backlight-slider trough,
      #pulseaudio-slider trough {
        border: none;
        margin-top: -3px;
        min-width: 90px;
        min-height: 10px;
        margin-bottom: -4px;
        background: #5b6078;
      }

      #backlight-slider highlight,
      #pulseaudio-slider highlight {
        border-radius: 8px;
        background-color: #7dc4e4;
      }

      #battery.charging, #battery.plugged {
        color: #cad3f5;
      }

      #battery.critical:not(.charging) {
        color: #ed8796;
      }
    '';
  };
}
