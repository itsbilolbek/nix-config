{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/boot
    ../../modules/nixos/desktop/cinnamon
    ../../modules/nixos/fcitx
    ../../modules/nixos/fonts
    ../../modules/nixos/gaming
    ../../modules/nixos/i18n
    ../../modules/nixos/networking
    ../../modules/nixos/nix-settings
    ../../modules/nixos/virtualisation
    ../../modules/nixos/users
    ../../modules/nixos/xkb
  ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  system.stateVersion = "25.11";

  networking.hostName = "xenon";

  services.openssh.enable = true;

  users.users.mocha.shell = pkgs.fish;

  programs.fish.enable = true;
}
