{
  flake.homeModules.cli =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.helix ];

      home.sessionVariables = {
        EDITOR = "hx";
        VISUAL = "hx";
      };

      programs.helix = {
        enable = true;
        defaultEditor = true;

        languages = {
          language-server = {
            clangd.command = "clangd";
            "bash-language-server".command = "bash-language-server";
            nixd.command = "nixd";
            pylsp.command = "${pkgs.python313Packages.python-lsp-server}/bin/pylsp";
          };

          language = [
            { name = "bash"; }
            { name = "c"; }
            { name = "cpp"; }
            {
              name = "nix";
              formatter.command = "alejandra";
              formatter.args = [ "--stdin" ];
            }
            {
              name = "python";
              formatter.command = "black";
              formatter.args = [ "--stdin" ];
            }
          ];
        };
      };
    };
}
