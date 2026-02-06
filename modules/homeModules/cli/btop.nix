{
  flake.homeModules.cli =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.btop ];

      programs.btop = {
        enable = true;
        settings = {
          net_download = 10;
          net_upload = 1;
          net_auto = false;
        };
      };
    };
}
