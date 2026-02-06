{ inputs, ... }:
{
  flake.homeModules.stylix =
    { pkgs, ... }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];

      home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.hack
        tinty
      ];

      stylix = {
        enable = true;
        autoEnable = false;

        targets = {
          alacritty.enable = true;
          helix.enable = true;
          starship.enable = true;
        };

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Classic";
          size = 24;
        };

        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        fonts = {
          sizes = {
            applications = 11;
            terminal = 13;
            desktop = 11;
            popups = 12;
          };

          serif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
          };

          sansSerif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Sans";
          };

          monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font Mono";
          };
          emoji = {
            package = pkgs.noto-fonts-color-emoji;
            name = "Noto Color Emoji";
          };
        };
      };
    };
}
