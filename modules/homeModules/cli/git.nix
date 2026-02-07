{
  flake.homeModules.cli =
    { config, pkgs, ... }:
    let
      inherit (config.home) homeDirectory;
    in
    {
      home.packages = with pkgs; [
        gh
        git
        delta
      ];

      programs = {
        git = {
          enable = true;
          lfs.enable = true;

          ignores = [
            "*.swp"
            "*~"
            "*result"
            "TODO.md"
          ];

          settings = {
            user = {
              name = "Bilolbek Normuminov";
              email = "bilolbeknormuminov@gmail.com";
              signingkey = "${homeDirectory}/.ssh/id_ed25519.pub";
            };

            core.editor = "${config.home.sessionVariables.EDITOR}";
            core.autocrlf = "input";
            fetch.prune = true;
            gpg.format = "ssh";
            init.defaultBranch = "main";
            pull.rebase = true;
            rebase.autoStash = true;

            alias = {
              aa = "add -A";
              br = "branch";
              ca = "commit -am";
              ci = "commit";
              cm = "commit -m";
              co = "checkout";
              st = "status -s";
              oops = "commit --amend --no-edit";
              graph = "log --oneline --graph --decorate --all";
              unstage = "reset HEAD --";
              undo = "reset --soft HEAD~1";
            };
          };

          signing = {
            key = "${homeDirectory}/.ssh/id_ed25519"; # # Leave blank when using the ssh format above
            signByDefault = true;
            format = "ssh";
          };
        };

        delta = {
          enable = true;
          enableGitIntegration = true;

          options = {
            conflictStyle = "zdiff3";
            dark = true;
            line-numbers = true;
            navigate = true;
            side-by-side = true;
          };
        };

        gh = {
          enable = true;
          settings = {
            git_protocol = "ssh";
            prompt = "enabled";
            aliases = {
              co = "pr checkout";
            };
          };
        };
      };
    };
}
