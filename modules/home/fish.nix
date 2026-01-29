{ pkgs, ... }:
{
  home.packages = [ pkgs.fish ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAliases = {
      tree = "eza --tree";
    };

    shellAbbrs = {
      ll = "eza -Alh --no-quotes --git --icons=auto --group-directories-first";
      grep = "grep --color=auto";
      zj = "zellij";
    };
  };
}
