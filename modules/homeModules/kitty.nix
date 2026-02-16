{
  flake.homeModules.kitty =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kitty
        nerd-fonts.jetbrains-mono
        nerd-fonts.hack
        noto-fonts-color-emoji
      ];

      home.sessionVariables = {
        TERMINAL = "kitty";
      };

      programs.kitty = {
        enable = true;
        enableGitIntegration = true;

        actionAliases = {
          "launch_tab" = "launch --cwd=current --type=tab";
          "launch_window" = "launch --cwd=current --type=window";
        };

        settings = {
          font_size = 15;
          font_family = "JetBrainsMonoNFM-SemiBold";
          bold_font = "JetBrainsMonoNFM-Bold";
          italic_font = "JetBrainsMonoNFM-SemiBoldItalic";
          bold_italic_font = "JetBrainsMonoNFM-BoldItalic";

          # Solarized Light color theme
          foreground = "#657b83";
          background = "#fdf6e3";
          selection_foreground = "#586e75";
          selection_background = "#eee8d5";

          # Cursor
          cursor = "#586e75";
          cursor_text_color = "#fdf6e3";

          # URL underline color
          url_color = "#268bd2";

          # The 16 terminal colors

          # Black (Base02 / Base03)
          color0 = "#073642";
          color8 = "#002b36";
          # Red
          color1 = "#dc322f";
          color9 = "#cb4b16";
          # Green
          color2 = "#859900";
          color10 = "#586e75";
          # Yellow
          color3 = "#b58900";
          color11 = "#657b83";
          # Blue
          color4 = "#268bd2";
          color12 = "#839496";
          # Magenta
          color5 = "#d33682";
          color13 = "#6c71c4";
          # Cyan
          color6 = "#2aa198";
          color14 = "#93a1a1";
          # White (Base2 / Base3)
          color7 = "#eee8d5";
          color15 = "#fdf6e3";
        };
      };
    };
}
