{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./stylix.nix
    ./cmd/bat.nix
    ./cmd/delta.nix
    ./cmd/fzf.nix
    ./cmd/git.nix
    ./cmd/ssh.nix
    ./cmd/zellij.nix
    ./cmd/zsh.nix
    ./cmd/starship.nix
    ./editors/helix.nix
    ./editors/zed.nix
  ];

  home.username = "kebol";
  home.homeDirectory = "/home/kebol";

  home.stateVersion = "25.11";

  nix.package = pkgs.nix;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Language formatters
    alejandra
    black
    prettier
    shfmt

    # LSP
    bash-language-server
    clang-tools
    nixd # Nix language server
    pyright
    typescript-language-server

    # Linters
    shellcheck # required for bash-language-server
    eslint

    # Debuggers
    lldb

    # GUI
    alacritty
    telegram-desktop
    zed-editor

    # Archiving
    zip
    unzip

    bash
    bat
    btop
    coreutils
    curl
    delta
    direnv
    dust
    eza
    fastfetch
    fontconfig
    fd
    fzf
    gcc
    gdb
    git
    gnupg
    helix
    hunspell
    jq
    moreutils # sponge util
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    ripgrep
    sd
    starship
    sqlite
    tealdeer
    tree-sitter
    wget
    yazi
    zellij
    zoom-us
    zsh
    zoxide
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"]; # Use system nixpkgs for nixd lsp

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    TERMINAL = "alacritty";
    XDG_TERMINAL_EMULATOR = "alacritty";
  };

  xdg.enable = true;

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;
  targets.genericLinux.gpu.enable = true;
}
