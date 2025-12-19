{inputs, ...}: {
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./delta.nix
    ./direnv.nix
    ./firefox.nix
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./packages.nix
    ./ssh.nix
    ./starship.nix
    ./stylix.nix
    ./zed.nix
    ./zellij.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "kebol";
    homeDirectory = "/home/kebol";
    stateVersion = "25.11";
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
      TERMINAL = "alacritty";
      XDG_TERMINAL_EMULATOR = "alacritty";
    };
  };

  xdg.enable = true;

  fonts.fontconfig.enable = true;

  # Enable graphics on non-NixOS distros
  targets.genericLinux = {
    enable = true;
    gpu.enable = true;
  };
}
