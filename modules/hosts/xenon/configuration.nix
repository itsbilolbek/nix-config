# Host: HP Laptop 15s-eq0xxx
# Display (AUO61ED): 1920x1080 in 16", 60 Hz [Built-in]
# CPU: AMD Ryzen 5 3500U (8) @ 2.10 GHz
# GPU: AMD Radeon Vega 8 Graphics [Integrated]
# Memory: 5.70 GiB
# Disk: 224.02 GiB

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
      home-manager
      koreanIME
      plymouth
      qemu
      # sops
      uzbekl10n
    ];

    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    system.stateVersion = "25.11";

    networking.hostName = "xenon";
  };
}
