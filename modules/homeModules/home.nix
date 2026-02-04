{ inputs, self, ... }:
{
  flake.homeModules.defaultUser =
    { config, pkgs, ... }:
    {
      imports = [
        inputs.stylix.homeModules.stylix

        self.homeModules.alacritty
        self.homeModules.bat
        self.homeModules.btop
        self.homeModules.direnv
        self.homeModules.firefox
        self.homeModules.fish
        self.homeModules.fzf
        self.homeModules.git
        self.homeModules.helix
        self.homeModules.ssh
        self.homeModules.starship
        self.homeModules.stylix
        self.homeModules.zed
        self.homeModules.zellij
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

        # Archiving
        ouch

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
        stateVersion = "25.11";
        sessionVariables = {
          EDITOR = "hx";
          VISUAL = "hx";
          TERMINAL = "alacritty";
          XDG_TERMINAL_EMULATOR = "alacritty";
          NH_FLAKE = "${config.home.homeDirectory}/nix-config";
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
    };
}
