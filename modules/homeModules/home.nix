{ self, ... }:
{
  flake.homeModules.baseUser =
    {
      pkgs,
      username,
      ...
    }:
    {
      imports = with self.homeModules; [
        cli
        fish
      ];

      programs.home-manager.enable = true;
      home = {
        stateVersion = "25.11";
        inherit username;
        homeDirectory = "/home/${username}";
      };

      home.packages = with pkgs; [
        bat
        btop
        coreutils
        curl
        dust
        eza
        fastfetch
        fd
        fzf
        jq
        moreutils # sponge util
        ncdu
        ouch # archiving
        ripgrep
        sd
        wget
      ];
    };

  flake.homeModules.defaultUser =
    { pkgs, ... }:
    {
      imports = with self.homeModules; [
        baseUser
        firefox
        helix
        kitty
        ssh
        zed
      ];

      xdg.enable = true;

      fonts.fontconfig.enable = true;

      i18n.inputMethod.fcitx5.settings.inputMethod = {
        "0".name = "keyboard-us";
        "1".name = "hangul";
      };

      home.packages = with pkgs; [
        # GUI
        celluloid
        # libreoffice-fresh
        # telegram-desktop
        qbittorrent
        # zoom-us

        fontconfig
      ];
    };
}
