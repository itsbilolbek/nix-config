{ inputs, self, ... }:
{
  flake.nixosConfigurations.xenon = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs self;
      packages = self.packages.x86_64-linux;
    };
    modules = [ self.nixosModules.hostXenon ];
  };

  flake.nixosModules.hostXenon =
    { packages, ... }:
    {

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

      environment.systemPackages = [
        packages.nh
      ];

      boot.initrd.kernelModules = [ "amdgpu" ];
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      system.stateVersion = "25.11";

      networking.hostName = "xenon";
    };
}
