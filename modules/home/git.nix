{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
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
          name = "Normuminov Bilolbek";
          email = "bilolbeknormuminov@gmail.com";
          signingkey = "~/.ssh/id_ed25519.pub";
        };

        init.defaultBranch = "main";
        pull.rebase = true;
        rebase.autoStash = true;
        gpg.format = "ssh";

        core = {
          editor = "${config.home.sessionVariables.EDITOR}";
          autocrlf = "input";
        };

        alias = {
          aa = "add -A";
          br = "branch";
          ca = "commit -am";
          ci = "commit";
          cm = "commit -m";
          co = "checkout";
          st = "status -s";
          graph = "log --oneline --graph --decorate --all";
          unstage = "reset HEAD --";
        };
      };

      signing = {
        key = "${config.home.homeDirectory}/.ssh/id_ed25519"; # # Leave blank when using the ssh format above
        signByDefault = true;
        format = "ssh";
      };
    };

    delta = {
      enable = true;
      enableGitIntegration = true;

      options = {
        side-by-side = true;
        line-numbers = true;
        dark = true;
        syntax-theme = "gruvbox-dark";
        conflictStyle = "zdiff3";
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
  };
}
