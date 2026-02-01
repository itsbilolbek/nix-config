{
  flake.homeModules.fish =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.fish ];

      programs.fish = {
        enable = true;

        interactiveShellInit = ''
          set fish_greeting # Disable greeting
        '';

        shellAliases = {
          ll = "eza -Alh --no-quotes --git --icons=auto --group-directories-first";
          ls = "eza";
          tree = "eza --tree";
        };

        shellAbbrs = {
          grep = "grep --color=auto";
          zj = "zellij";
          tempd = "cd (mktemp -d)";
        };

        functions = {
          template.body = "nix flake init -t github:itsbilolbek/flake-templates#\"$argv\"";
        };
      };
    };
}
