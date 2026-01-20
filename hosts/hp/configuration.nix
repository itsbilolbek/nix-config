{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./gaming
    ../../modules/nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  system.stateVersion = "25.11";

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tashkent";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "uzx,us";
    options = "ctrl:nocaps";
    extraLayouts.uzx = {
      description = "Uzbek (US)";
      languages = ["uzb"];
      symbolsFile = ./uz;
    };
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ko_KR.UTF-8/UTF-8"
    ];

    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = false;
        addons = with pkgs; [
          fcitx5-gtk
          fcitx5-hangul
        ];
      };
    };
  };

  fonts = {
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK KR" "NanumMyeongjo"];
        sansSerif = ["Noto Sans CJK KR" "NanumGothic"];
        monospace = ["Noto Sans Mono CJK KR" "NanumGothicCoding"];
      };
    };

    packages = with pkgs; [
      nanum # Classic Korean fonts (Gothic, Myeongjo, Pen, Brush)
      noto-fonts-cjk-sans # Google's high-quality CJK fonts
      noto-fonts-cjk-serif
      baekmuk-ttf # Older but standard compatibility fonts
    ];
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.cinnamon.enable = true;
  };

  services = {
    printing.enable = true;
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
      mouse = {
        # Disable mouse acceleration
        accelProfile = "flat";
        accelSpeed = "0";
      };
    };
  };

  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mocha = {
    isNormalUser = true;
    description = "Bilolbek";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
