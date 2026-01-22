{ config, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;

    ignores = [
      "*.swp"
      "*~"
      "*result"
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
        ci = "commit";
        co = "checkout";
        st = "status -s";
        dog = "log --oneline --graph --decorate --all";
        unstage = "reset HEAD --";
      };
    };

    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519"; # # Leave blank when using the ssh format above
      signByDefault = true;
      format = "ssh";
    };
  };
}
