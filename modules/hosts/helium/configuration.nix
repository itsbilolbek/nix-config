# Test VM server
{ inputs, self, ... }:
{
  flake.nixosConfigurations.helium = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.hostHelium ];
  };

  flake.nixosModules.hostHelium = {
    imports = with self.nixosModules; [ core ];

    networking.hostName = "helium";
    system.stateVersion = "25.11";

    documentation.enable = false;
    documentation.nixos.enable = false;

    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.system = "x86_64-linux";

    virtualisation.vmVariant = {
      virtualisation = {
        memorySize = 4096;
        cores = 4;
        graphics = true;
      };
    };
  };
}
