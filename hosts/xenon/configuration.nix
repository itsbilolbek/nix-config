{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./gaming
    ./virtualisation
    ../../modules/nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
      timeout = 3;
    };

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "systemd.show_status=false"
    ];

    consoleLogLevel = 3;
    initrd.verbose = false;
    initrd.kernelModules = [ "amdgpu" ];

    plymouth = {
      enable = true;
      theme = "spinner";
    };
  };

  system.stateVersion = "25.11";

  networking = {
    hostName = "xenon";
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
    ];
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ];
    };
  };

  time.timeZone = "Asia/Tashkent";

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
        serif = [
          "Noto Serif CJK KR"
          "NanumMyeongjo"
        ];
        sansSerif = [
          "Noto Sans CJK KR"
          "NanumGothic"
        ];
        monospace = [
          "Noto Sans Mono CJK KR"
          "NanumGothicCoding"
        ];
      };
    };

    packages = with pkgs; [
      nanum # Classic Korean fonts (Gothic, Myeongjo, Pen, Brush)
      noto-fonts-cjk-sans # Google's high-quality CJK fonts
      noto-fonts-cjk-serif
      baekmuk-ttf # Older but standard compatibility fonts
    ];
  };

  services = {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.cinnamon.enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "uzx,us";
        options = "ctrl:nocaps";
        extraLayouts.uzx = {
          description = "Uzbek (US)";
          languages = [ "uzb" ];
          symbolsFile = ./uz;
        };
      };
    };

    printing.enable = true;
    pulseaudio.enable = false;
    openssh.enable = true;

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
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}
