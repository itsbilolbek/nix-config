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
      self.nixosModules.fhs
      self.nixosModules.gaming
      self.nixosModules.home-manager
      self.nixosModules.koreanIME
      self.nixosModules.plymouth
      self.nixosModules.qemu
      self.nixosModules.uzbekl10n
    ];

    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    system.stateVersion = "25.11";

    networking.hostName = "xenon";
  };
}
