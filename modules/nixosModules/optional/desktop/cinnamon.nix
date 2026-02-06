{ self, ... }:
{
  flake.nixosModules.cinnamon = {
    imports = [
      self.nixosModules.desktop
    ];

    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      displayManager.lightdm.background = ./wallpapers/nix-dark.png;
      desktopManager.cinnamon.enable = true;
    };
  };
}
