{
  flake.homeModules.btop =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.btop ];

      programs.btop = {
        enable = true;
        settings = {
          # theme_background = false;
          net_download = 10;
          net_upload = 1;
          net_auto = false;
        };
      };
    };
}
