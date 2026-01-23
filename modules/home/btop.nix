{ pkgs, ... }:
{
  home.packages = [ pkgs.btop ];

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_dark_v2";
      theme_background = false;
      net_download = 10;
      net_upload = 1;
      net_auto = false;
      graph_symbol = "block";
    };
  };
}
