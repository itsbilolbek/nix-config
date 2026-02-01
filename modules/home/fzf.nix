{
  flake.homeModules.fzf =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.fzf ];

      programs.fzf = {
        enable = true;

        enableBashIntegration = true;
      };
    };
}
