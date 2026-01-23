{ pkgs, ... }:
{
  home.packages = [ pkgs.bat ];

  programs.bat = {
    enable = true;
    config.theme = "gruvbox-dark";
  };
}
