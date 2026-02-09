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
        sessionVariables = {
          EDITOR = "hx";
          VISUAL = "hx";
        };
      };

      home.packages = with pkgs; [
        coreutils
        curl
        dust
        eza
        fastfetch
        fd
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
        alacritty
        baseUser
        firefox
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
        # Development
        sqlite

        # LSP
        llvmPackages.clang-unwrapped
        nixd
        pyright
        ruff

        # GUI
        anki
        celluloid
        kdePackages.kdeconnect-kde
        libreoffice-fresh
        # telegram-desktop
        obsidian
        poedit
        qbittorrent
        xreader
        zoom-us

        # Terminal and text utils
        tealdeer

        fontconfig
        hunspell
      ];
    };
}
