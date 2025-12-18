{config, ...}: {
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
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";

      core = {
        editor = "${config.home.sessionVariables.EDITOR}";
      };
    };

    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519"; # # Leave blank when using the ssh format above
      signByDefault = true;
      format = "ssh";
    };
  };
}
