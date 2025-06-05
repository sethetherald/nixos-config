{ config, pkgs, ... }:

{
  home.sessionVariables = {
    SHELL = "fish";
    EDITOR = "nvim";
  };
}
