{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    # settings = {
    #   theme = "gruvbox_dark_hard";
    # };

    languages = {
      language-server.clangd.command = "clangd";
      language-server."bash-language-server".command = "bash-language-server";
      language-server.nixd.command = "nixd";
      language-server.pylsp.command = "${pkgs.python313Packages.python-lsp-server}/bin/pylsp";

      language = [
        { name = "bash"; }
        { name = "c"; }
        { name = "cpp"; }
        {
          name = "nix";
          formatter.command = "alejandra";
          formatter.args = ["--stdin"];
        }
        {
          name = "python";
          formatter.command = "black";
          formatter.args = ["--stdin"];
        }
      ];
    };
  };
}
