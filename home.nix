{ config, pkgs, inputs, ... }:

{
  
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

    # anki
    alacritty
    bash
    bash-language-server
    bat
    btop
    clang-tools
    coreutils
    curl
    delta
    dust
    fastfetch
    fontconfig
    fzf
    gcc
    git
    gnupg
    helix
    hunspell
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nil  # Nix language server
    python313
    python313Packages.python-lsp-server
    starship
    sqlite
    # telegram-desktop
    tmux
    # tree-sitter-grammars.tree-sitter-bash
    # tree-sitter-grammars.tree-sitter-c
    # tree-sitter-grammars.tree-sitter-cpp
    # tree-sitter-grammars.tree-sitter-nix
    # tree-sitter-grammars.tree-sitter-python
    tree-sitter
    unzip
    wget
    yazi
    zed-editor
    zellij
    zip
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

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    TERMINAL = "alacritty";
    XDG_TERMINAL_EMULATOR = "alacritty";
  };
  
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -AhvolF --color=auto --group-directories-first";
      grep = "grep --color=auto";
    };

    historyControl = [ "ignoreboth" ];
    historyIgnore = [
      "ls"
      "cd"
      "exit"
    ];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      side-by-side = true;
      line-numbers = true;
    };
  };

  programs.fzf = {
    enable = true;

    enableBashIntegration = true;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;

    ignores = [
      "*.swp"
    ];

    settings = {
      user.name = "Normuminov Bilolbek";
      user.email = "bilolbeknormuminov@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
      # commit.gpgsign = true;

      core = {
        editor = "${config.home.sessionVariables.EDITOR}";
      };
    };
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;

    # settings = {
    #   theme = "gruvbox_dark_hard";
    # };

    languages = {
      language-server.clangd.command = "clangd";
      language-server."bash-language-server".command = "bash-language-server";
      language-server.nil.command = "nil";
      language-server.pylsp.command = "${pkgs.python313Packages.python-lsp-server}/bin/pylsp";

      language = [
        { name = "bash"; }
        { name = "c"; }
        { name = "cpp"; }
        { name = "nix"; }
        { name = "python"; }
      ];
    };
  };
  
  programs.vim.enable = true;

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };

  programs.zed-editor = {
    enable = true;
    
    userSettings = {
      disable_ai = true;
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
    };
  };

  programs.starship = {
    enable = true;
  };
  
  xdg.enable = true;
  
  stylix = {
    enable = true;
    autoEnable = false;
    
    targets = {
      # gtk.enable = true;
      alacritty.enable = true;
      bat.enable = true;
      helix.enable = true;
      starship.enable = true;
      vim.enable = true;
      zed.enable = true;
      zellij.enable = true;
    };
    
    image = ./foggy-forest-wallpaper.jpg;
    # colorScheme = inputs.stylix.colorSchemes.gruvbox-dark-hard;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml"; 
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
  
      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;
  targets.genericLinux.gpu.enable = true;
}
