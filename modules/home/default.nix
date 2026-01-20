{inputs, ...}: {
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./btop.nix
    ./delta.nix
    ./direnv.nix
    ./firefox.nix
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./packages.nix
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
      NH_FLAKE = "/home/mocha/nix-config";
    };
  };

  xdg.enable = true;

  fonts.fontconfig.enable = true;

  i18n.inputMethod.fcitx5.settings.inputMethod = {
    "0" = {name = "keyboard-us";};
    "1" = {name = "hangul";};
  };
}
