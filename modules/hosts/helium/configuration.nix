# Test VM server
{ inputs, self, ... }:
{
  flake.nixosConfigurations.helium = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.hostHelium ];
  };

  flake.nixosModules.hostHelium = {
    imports = with self.nixosModules; [
      core
      qemu-guest
    ];

    networking.hostName = "helium";
    system.stateVersion = "25.11";
  };
}
