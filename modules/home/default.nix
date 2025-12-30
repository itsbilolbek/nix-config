{inputs, ...}: {
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./delta.nix
    ./direnv.nix
    ./firefox.nix
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./packages.nix
    ./plasma.nix
    ./ssh.nix
    ./starship.nix
    ./stylix.nix
    ./zed.nix
    ./zellij.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "mocha";
    homeDirectory = "/home/mocha";
    stateVersion = "25.11";
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
      TERMINAL = "alacritty";
      XDG_TERMINAL_EMULATOR = "alacritty";
    };
  };

  xdg.enable = true;

  fonts.fontconfig.enable = true;

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };
}
