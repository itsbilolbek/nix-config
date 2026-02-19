{
  flake.homeModules.kitty =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
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

        themeFile = "gruvbox-light-hard";

        settings = {
          font_size = 15;
          font_family = "JetBrainsMonoNFM-SemiBold";
          bold_font = "JetBrainsMonoNFM-Bold";
          italic_font = "JetBrainsMonoNFM-SemiBoldItalic";
          bold_italic_font = "JetBrainsMonoNFM-BoldItalic";
        };

        keybindings = {
          "alt+1" = "goto_tab 1";
          "alt+2" = "goto_tab 2";
          "alt+3" = "goto_tab 3";
          "alt+4" = "goto_tab 4";
          "alt+5" = "goto_tab 5";
          "alt+6" = "goto_tab 6";
          "alt+7" = "goto_tab 7";
          "alt+8" = "goto_tab 8";
          "alt+9" = "goto_tab 9";
          "ctrl+shift+t" = "new_tab_with_cwd";
        };
      };
    };
}
