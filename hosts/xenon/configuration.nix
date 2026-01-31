{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/desktop/cinnamon
    ../../modules/nixos/fcitx.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/i18n.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/nix-settings.nix
    ../../modules/nixos/virtualisation.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/xkb
  ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  system.stateVersion = "25.11";

  networking.hostName = "xenon";

  services.openssh.enable = true;

  users.users.mocha.shell = pkgs.fish;

  programs.fish.enable = true;

  programs.nix-ld.enable = true;

  environment.systemPackages = [ pkgs.uv ];
}
