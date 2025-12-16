{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      path = "$HOME/.zsh_history";
    };

    shellAliases = {
      ll = "eza -Alh --no-quotes --git --icons=auto --group-directories-first";
      grep = "grep --color=auto";
    };
  };
}
