{ self, ... }:
{
  flake.nixosModules.cinnamon = {
    imports = [
      self.nixosModules.desktop
    ];

    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.cinnamon.enable = true;
    };
  };
}
