{
  flake.homeModules.alacritty =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.alacritty ];

      programs.alacritty = {
        enable = true;

        settings = {
          window.startup_mode = "Maximized";
        };
      };
    };
}
