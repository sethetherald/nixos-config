{ config, pkgs, ... } :

{
  services.mako = {
    enable = true;
    settings = {
      border-radius = 5;
      default-timeout = 5000;
    };
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
    extraOptions = [
      "-max-dedupe-search"
      "10"
      "-max-items"
      "500"
    ];
  };

  services.xremap = {
    enable = true;
    withWlroots = true;
    config.modmap = [
      {
        name = "Global";
        remap = { 
        };
      }
    ];
  };
}
