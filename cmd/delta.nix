{
  programs.delta = {
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
}
