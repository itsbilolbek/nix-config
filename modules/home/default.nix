{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Development
    sqlite

    # GUI
    libreoffice-fresh
    # telegram-desktop
    zoom-us
    poedit
    qbittorrent
    celluloid
    virtualbox
    xreader

    # Archiving
    zip
    unzip

    # Terminal and text utils
    coreutils
    curl
    dust
    eza
    fd
    gh
    jq
    moreutils # sponge util
    nh
    ripgrep
    sd
    tealdeer
    wget

    fastfetch
    fontconfig
    gnupg
    hunspell
  ];

  imports = [
    ./alacritty.nix
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./firefox.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./ssh.nix
    ./starship.nix
    ./stylix.nix
    ./zed.nix
    ./zellij.nix
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
    "0" = {
      name = "keyboard-us";
    };
    "1" = {
      name = "hangul";
    };
  };
}
