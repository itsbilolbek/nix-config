{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = false;

    targets = {
      # gtk.enable = true;
      alacritty.enable = true;
      bat.enable = true;
      helix.enable = true;
      starship.enable = true;
      vim.enable = true;
      zed.enable = true;
      zellij.enable = true;
    };

    image = ./foggy-forest-wallpaper.jpg;
    # colorScheme = inputs.stylix.colorSchemes.gruvbox-dark-hard;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    fonts = {
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
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}