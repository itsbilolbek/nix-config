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
      user.name = "Normuminov Bilolbek";
      user.email = "bilolbeknormuminov@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
      # commit.gpgsign = true;

      core = {
        editor = "${config.home.sessionVariables.EDITOR}";
      };
    };
  };
}
