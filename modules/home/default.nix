{ pkgs, ... }:
{
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

  home.packages = with pkgs; [
    # Development
    sqlite

    # LSP
    llvmPackages.clang-unwrapped
    nixd
    pyright
    ruff

    # GUI
    celluloid
    kdePackages.kdeconnect-kde
    libreoffice-fresh
    # telegram-desktop
    obsidian
    poedit
    qbittorrent
    virtualbox
    xreader
    zoom-us

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
    ncdu
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
