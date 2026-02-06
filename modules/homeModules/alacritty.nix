{
  flake.homeModules.alacritty =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.alacritty ];

      home.sessionVariables = {
        TERMINAL = "alacritty";
        XDG_TERMINAL_EMULATOR = "alacritty";
      };

      programs.alacritty = {
        enable = true;

        settings = {
          window.startup_mode = "Maximized";
        };
      };
    };
}
