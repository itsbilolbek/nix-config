{ self, ... }:
{
  flake.nixosModules.core = {
    imports = [
      self.nixosModules.boot
      self.nixosModules.fonts
      self.nixosModules.i18n
      self.nixosModules.networking
      self.nixosModules.nix-settings
      self.nixosModules.sops
      self.nixosModules.xkb
    ];
  };
}
