{pkgs, ...}: {
  home.packages = with pkgs; [
    # Language formatters
    alejandra
    black
    prettier
    shfmt

    # LSP
    bash-language-server
    clang-tools
    eslint
    nixd # Nix language server
    pyright
    shellcheck # required for bash-language-server
    typescript-language-server

    # Development
    lldb
    gcc
    gdb
    git
    sqlite
    tree-sitter

    # GUI
    alacritty
    firefox
    libreoffice-fresh
    telegram-desktop
    zed-editor
    zoom-us

    # Archiving
    zip
    unzip

    # Terminal and text utils
    bat
    btop
    coreutils
    curl
    delta
    direnv
    dust
    eza
    fd
    fzf
    jq
    moreutils # sponge util
    ripgrep
    sd
    tealdeer
    wget
    yazi
    zellij
    zoxide

    fastfetch
    fontconfig
    gnupg
    helix
    hunspell
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    starship
    zsh
  ];
}
