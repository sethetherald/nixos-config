{ config, pkgs, lib, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''${pkgs.greetd.tuigreet}/bin/tuigreet \
          --theme 'border=magenta;text=white;prompt=green;time=yellow;action=blue;button=bright_yellow;container=black;input=red;greet=bright_red' \
          --time \
          --asterisks \
          --cmd ActivateHyprland \
          --remember
        '';
        user = "greeter";
      };
    };
  };
  systemd.services.greetd.serviceConfig.ExecStartPre = [
    "/run/current-system/sw/bin/setfont Lat2-Terminus16"
  ];

  security.rtkit.enable = true;
  security.sudo.enable = false;
  security.sudo-rs = {
    enable = true;
    extraConfig = ''
      Defaults pwfeedback
    '';
  };
  
  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input",TAG+="uaccess"
  '';

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.throttled = {
    enable = true;
    extraConfig = ''
        [GENERAL]
        Enabled: True
        Sysfs_Power_Path: /sys/class/power_supply/AC*/online
        Autoreload: True

        [BATTERY]
        Update_Rate_s: 30
        PL1_Tdp_W: 29
        PL1_Duration_s: 28
        PL2_Tdp_W: 44
        PL2_Duration_S: 0.002
        Trip_Temp_C: 85
        cTDP: 1
        Disable_BDPROCHOT: False

        [AC]
        Update_Rate_s: 5
        PL1_Tdp_W: 44
        PL1_Duration_s: 28
        PL2_Tdp_W: 44
        PL2_Duration_S: 0.002
        Trip_Temp_C: 95
        cTDP: 0
        Disable_BDPROCHOT: False

        [UNDERVOLT.BATTERY]
        CORE: -75
        GPU: -70
        CACHE: -75
        UNCORE: 0
        ANALOGIO: 0

        [UNDERVOLT.AC]
        CORE: -75
        GPU: -70
        CACHE: -75
        UNCORE: 0
        ANALOGIO: 0
    '';
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      RUNTIME_PM_ON_AC="auto";
      START_CHARGE_THRESH_BAT0 = "40";
      STOP_CHARGE_THRESH_BAT0 = "80";
    };
  };
}
