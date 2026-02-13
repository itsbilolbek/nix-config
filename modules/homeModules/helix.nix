{
  flake.homeModules.helix =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.helix ];

      programs.helix = {
        enable = true;
        defaultEditor = true;
        settings = {
          theme = "catppuccin_mocha";
          editor = {
            indent-guides.render = true;
            indent-guides.skip-levels = 1;
          };
        };
      };
    };
}
