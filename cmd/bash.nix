{
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -AhvolF --color=auto --group-directories-first";
      grep = "grep --color=auto";
    };

    historyControl = [ "ignoreboth" ];
    historyIgnore = [
      "ls"
      "cd"
      "exit"
    ];
  };
}
