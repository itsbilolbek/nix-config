{
  flake.homeModules.bat =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.bat ];

      programs.bat = {
        enable = true;
        config.theme = "Catppuccin Mocha";
      };
    };
}
