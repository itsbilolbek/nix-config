{ inputs, self, ... }:
{
  flake.nixosConfigurations.xenon = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.hostXenon ];
  };

  flake.nixosModules.hostXenon = {

    imports = with self.nixosModules; [
      cinnamon
      core
      fhs
      gaming
      home-manager
      koreanIME
      plymouth
      qemu
      sops
      uzbekl10n
    ];

    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    system.stateVersion = "25.11";

    networking.hostName = "xenon";
  };
}
