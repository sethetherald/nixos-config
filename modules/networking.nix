{ config, pkgs, lib, ... }:

{
  networking.hostName = "nixPad";
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
}
