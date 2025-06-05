{ inputs, config, pkgs, lib, ... } :

{
  programs.git = {
    enable = true;
    userName = "Seth";
    userEmail = "sethetherald@duck.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
