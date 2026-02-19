{
  flake.homeModules.cli =
    { config, ... }:
    let
      inherit (config.home) homeDirectory;
    in
    {
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
              oops = "commit --amend --no-edit";
              graph = "log --oneline --graph --decorate --all";
              unstage = "reset HEAD --";
              undo = "reset --soft HEAD~1";
              restore-all = "!git reset --hard HEAD && git clean -fd";
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
            line-numbers = true;
            navigate = true;
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

        lazygit = {
          enable = true;
          settings = {
            git.pagers = [
              { pager = "delta --light --paging=never --line-numbers"; }
            ];
          };
        };
      };
    };
}
