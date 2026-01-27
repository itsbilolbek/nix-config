{ pkgs, ... }:
{
  home.packages = [ pkgs.fish ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAbbrs = {
      ll = "eza -Alh --no-quotes --git --icons=auto --group-directories-first";
      grep = "grep --color=auto";
      zj = "zellij";
    };
  };
}
