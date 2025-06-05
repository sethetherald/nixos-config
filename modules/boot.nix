{ config, pkgs, lib, ... }:

{
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/nvme0n1";
    };
    loader.timeout = 0;
    initrd.kernelModules = [
      "i915"
      "msr"
      "uinput"
    ];
    plymouth = {
      enable = true;
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    extraModprobeConfig = ''
      options iwlwifi power_save=1
    '';
    kernelParams = [
      "intel_pstate=passive"
      "thinkpad_acpi.force_load=1"
      "fbcon=nodefer"
      "quiet"
      "boot.shell_on_fail"
      "udev.log_level=3"
      "rd.systemd.show_status=auto"
      "vt.global_cursor_default=0"
    ];
  };
}
