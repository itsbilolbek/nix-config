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
}
