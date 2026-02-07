{
  flake.homeModules.alacritty =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        alacritty
        nerd-fonts.jetbrains-mono
        nerd-fonts.hack
        noto-fonts-color-emoji
      ];

      home.sessionVariables = {
        TERMINAL = "alacritty";
        XDG_TERMINAL_EMULATOR = "alacritty";
      };

      programs.alacritty = {
        enable = true;

        settings = {
          window.startup_mode = "Maximized";

          font = {
            size = 13;
            normal.family = "JetBrainsMono Nerd Font Mono";
          };

          # Catppuccin mocha theme
          colors = {
            primary = {
              background = "#1e1e2e";
              foreground = "#cdd6f4";
              dim_foreground = "#7f849c";
              bright_foreground = "#cdd6f4";
            };
            cursor = {
              text = "#1e1e2e";
              cursor = "#f5e0dc";
            };
            vi_mode_cursor = {
              text = "#1e1e2e";
              cursor = "#b4befe";
            };
            selection = {
              text = "#1e1e2e";
              background = "#f5e0dc";
            };
            normal = {
              black = "#45475a";
              red = "#f38ba8";
              green = "#a6e3a1";
              yellow = "#f9e2af";
              blue = "#89b4fa";
              magenta = "#f5c2e7";
              cyan = "#94e2d5";
              white = "#bac2de";
            };
            bright = {
              black = "#585b70";
              red = "#f38ba8";
              green = "#a6e3a1";
              yellow = "#f9e2af";
              blue = "#89b4fa";
              magenta = "#f5c2e7";
              cyan = "#94e2d5";
              white = "#a6adc8";
            };
          };
        };
      };
    };
}
