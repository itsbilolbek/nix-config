{
  config,
  pkgs,
  inputs,
  ...
}: let
  modules = [
    ./alacritty.nix
    ./firefox.nix
    ./stylix.nix
    ./packages.nix
    ./cmd/bat.nix
    ./cmd/delta.nix
    ./cmd/fzf.nix
    ./cmd/git.nix
    ./cmd/ssh.nix
    ./cmd/zellij.nix
    ./cmd/zsh.nix
    ./cmd/starship.nix
    ./editors/helix.nix
    ./editors/zed.nix
  ];
in {
  imports = modules;

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

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nix;
    nixPath = ["nixpkgs=${inputs.nixpkgs}"]; # Use system nixpkgs for nixd lsp
    settings = {
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
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
