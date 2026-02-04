{ inputs, self, ... }:
{
  flake.nixosConfigurations.xenon = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostXenon
    ];
  };

  flake.nixosModules.hostXenon = {
    imports = [
      inputs.stylix.nixosModules.stylix

      self.nixosModules.cinnamon
      self.nixosModules.core
      self.nixosModules.fcitx
      self.nixosModules.fhs
      self.nixosModules.gaming
      self.nixosModules.home-manager
      self.nixosModules.qemu
      self.nixosModules.usersMocha
    ];

    boot.initrd.kernelModules = [ "amdgpu" ];

    system.stateVersion = "25.11";

    networking.hostName = "xenon";

    programs.fish.enable = true;
  };
}
