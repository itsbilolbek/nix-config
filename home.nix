{ config, pkgs, inputs, ... }:

{
  
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./stylix.nix
    ./cmd/bash.nix
    ./cmd/delta.nix
    ./cmd/fzf.nix
    ./cmd/git.nix
    ./cmd/starship.nix
    ./editors/helix.nix
    ./editors/zed.nix
  ];
  
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kebol";
  home.homeDirectory = "/home/kebol";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  nix.package = pkgs.nix;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

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
    dust
    fastfetch
    fontconfig
    fzf
    gcc
    gdb
    git
    gnupg
    helix
    hunspell
    jq
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    ripgrep
    starship
    sqlite
    tealdeer
    tree-sitter
    wget
    zellij
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kebol/etc/profile.d/hm-session-vars.sh
  #

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"]; # Use system nixpkgs for nixd lsp

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    TERMINAL = "alacritty";
    XDG_TERMINAL_EMULATOR = "alacritty";
  };

  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;
  targets.genericLinux.gpu.enable = true;
}
