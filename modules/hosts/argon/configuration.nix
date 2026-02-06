# Test VM server
{ inputs, self, ... }:
{
  flake.nixosConfigurations.argon = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.hostArgon ];
  };

  flake.nixosModules.hostArgon = {

    imports = with self.nixosModules; [
      core
      podman
    ];

    networking.hostName = "argon";
    system.stateVersion = "25.11";

    documentation.enable = false;
    documentation.nixos.enable = false;
  };
}
