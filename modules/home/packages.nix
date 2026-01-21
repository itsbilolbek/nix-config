{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Development
    git
    sqlite

    # GUI
    alacritty
    firefox
    libreoffice-fresh
    # telegram-desktop
    zed-editor
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
    gh
    jq
    moreutils # sponge util
    nh
    nix-direnv
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
