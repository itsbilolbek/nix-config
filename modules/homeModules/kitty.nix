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

        themeFile = "gruvbox-light-hard";

        settings = {
          font_size = 15;
          font_family = "JetBrainsMonoNFM-SemiBold";
          bold_font = "JetBrainsMonoNFM-Bold";
          italic_font = "JetBrainsMonoNFM-SemiBoldItalic";
          bold_italic_font = "JetBrainsMonoNFM-BoldItalic";
        };
      };
    };
}
