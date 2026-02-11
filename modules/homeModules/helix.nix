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
          editor.whitespace = {
            render = "all";
          };
        };
      };
    };
}
