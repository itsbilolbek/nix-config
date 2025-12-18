{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = false;

    targets = {
      # gtk.enable = true;
      alacritty.enable = true;
      helix.enable = true;
      starship.enable = true;
      vim.enable = true;
      yazi.enable = true;
      zed.enable = true;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
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
        name = "Dejavu Sans Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
